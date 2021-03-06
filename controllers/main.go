package controllers

import (
	"io"
	"os"
	"path"
	"time"
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"gopkg.in/mgo.v2/bson"
)

type MainController struct {
	beego.Controller
}
// 主页
func (this *MainController) Index() {
	//this.TplName = "index.tpl"
	this.Redirect("/console", 302)
}
// 请求错误页面
func (this *MainController) ErrPage() {
	this.TplName = "error/index.tpl"
}
// 获取服务器时间
func (this *MainController) Time() {
	timestamp := params.Timestamp{}
	timestamp.Timestamp = time.Now().Unix()
	this.Data["json"] = &timestamp
	this.ServeJSON()
}
// 登陆页
func (this *MainController) Login() {
	cutoken := this.GetSession("cutoken")
	if cutoken != nil {
		this.Redirect("/console", 302)
		return
	}
	flash := beego.ReadFromRequest(&this.Controller)
	if n, ok := flash.Data["error"]; ok {
		this.Data["errmsg"] = n
	}
	this.TplName = "login.tpl"
}
// 登陆处理
func (this *MainController) LoginAction() {
	flash := beego.NewFlash()
	param := params.LoginParam{}
	if err := this.ParseForm(&param); err != nil {
		flash.Error("请求数据错误")
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}

	err, res := utils.FetchPost(&param, "user/login")
	if err != nil {
		flash.Error("服务器响应错误，请稍后重试...")
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}
	rsa := res.(map[string]interface{})
	value, ok := rsa["code"].(float64)
	if !ok {
		flash.Error("服务器响应数据错误...")
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}
	if value != 200 {
		flash.Error(rsa["message"].(string))
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}
	rsd := rsa["data"].(map[string]interface{})

	this.SetSession("cutoken", rsd["uid"].(string))
	this.SetSession("cuname", rsd["uname"].(string))
	this.SetSession("cptoken", rsd["pid"].(string))
	this.SetSession("uaccount", rsd["uaccount"].(string))

	this.Redirect("/console", 302)
}
// 用户信息
func (this *MainController) UserInfo() {
	userInfo := params.UserInfo{}
	userInfo.UserName = this.GetSession("cuname").(string)
	this.Data["json"] = &userInfo
	this.ServeJSON()
}
// 用户（授权）菜单
func (this *MainController) UserMenus() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "user/menus")
	this.Data["json"] = res
	this.ServeJSON()
}
// 退出登陆，清除session
func (this *MainController) Logout() {
	cutoken := this.GetSession("cutoken")
	if cutoken != nil {
		this.DelSession("cutoken")
		this.DelSession("cuname")
		this.DelSession("cptoken")
	}
	this.Redirect("/login", 302)
	return
}

// 上传用户头像
func (this *MainController) UploadPersonnelPhoto() {
	file, _, err := this.GetFile("file")
	er := params.ErrorResult{}
	if err != nil {
		logs.Error(err)
		er.Code = -1
		er.Message = "上传文件失败"
		this.Data["json"] = er
		this.ServeJSON()
		return
	}
	defer file.Close()
	// fileName := information.Filename
	// logs.Info(fileName)

	fileKey := bson.NewObjectId().Hex()
	savePath := path.Join("static/upload", fileKey)
	// 存储本地
	this.SaveToFile("file", savePath)
	// 上传至七牛云
	utils.Upload(fileKey, savePath)
	param := params.PersonnelParam{}
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	param.Id = this.GetString("id")
	param.Photo = fileKey
	utils.FetchPost(&param, "personnel/updatePhoto")
	er.Code = 200
	this.Data["json"] = er
	this.ServeJSON()
}

// 上传大事记图片
func (this *MainController) UploadMemorabiliaPics() {
	er := params.ErrorResult{}

	files, err := this.GetFiles("file")
	if err != nil {
		logs.Error(err)
		er.Code = -1
		er.Message = "上传文件失败"
		this.Data["json"] = er
		this.ServeJSON()
		return
	}
	for i, _ := range files {
		file, err := files[i].Open()
		defer file.Close()
		if err != nil {
			logs.Error(err)
			er.Code = -2
			er.Message = "上传文件失败"
			this.Data["json"] = er
			this.ServeJSON()
			return
		}
		fileKey := bson.NewObjectId().Hex()
		savePath := path.Join("static/upload", fileKey)
		// 存储本地
		dst, err := os.Create(savePath)
		defer dst.Close()
		if err != nil {
			logs.Error(err)
			er.Code = -3
			er.Message = "文件创建失败"
			this.Data["json"] = er
			this.ServeJSON()
			return
		}
		if _, err := io.Copy(dst, file); err != nil {
			logs.Error(err)
			er.Code = -4
			er.Message = "保存文件失败"
			this.Data["json"] = er
			this.ServeJSON()
			return
		}
		// 上传至七牛云
		utils.Upload(fileKey, savePath)
		param := params.MemorabiliaPicParam{}
		param.Uid = this.GetSession("cutoken").(string)
		param.Pid = this.GetSession("cptoken").(string)
		param.Id = this.GetString("id")
		param.Pic = fileKey
		utils.FetchPost(&param, "memorabilia/uploadPic")
	}

	er.Code = 200
	this.Data["json"] = er
	this.ServeJSON()
}
