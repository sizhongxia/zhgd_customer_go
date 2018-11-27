package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Index() {
	// this.TplName = "index.tpl"
	this.Redirect("/console", 302)
}

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

	this.Redirect("/console", 302)
}

func (this *MainController) UserInfo() {
	userInfo := params.UserInfo{}
	userInfo.UserName = this.GetSession("cuname").(string)
	this.Data["json"] = &userInfo
	this.ServeJSON()
}

func (this *MainController) UserMenus() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "user/menus")
	this.Data["json"] = res
	this.ServeJSON()
}

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
