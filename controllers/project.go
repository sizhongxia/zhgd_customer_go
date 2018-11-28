package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
)

type ProjectController struct {
	beego.Controller
}

// 项目信息
func (this *ProjectController) Index() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)

	cacheKey := "project:detail:" + token.Pid

	cval := utils.GetCache(cacheKey)
	if cval != nil {
		this.Data["project"] = cval
		this.TplName = "manage/project/index.tpl"
		return
	}

	err, res := utils.FetchPost(&token, "project/detail")
	if err != nil {
		this.Abort("404")
	}
	rsa := res.(map[string]interface{})
	value, ok := rsa["code"].(float64)
	if !ok {
		this.Abort("404")
	}
	if value != 200 {
		this.Abort("404")
	}
	rsd := rsa["data"].(map[string]interface{})
	utils.SetCache(cacheKey, rsd, 60*5)

	this.Data["project"] = rsd
	this.TplName = "manage/project/index.tpl"
}

// func (this *ProjectController) ProjectDetail() {
// 	token := params.BaseToken{}
// 	token.Uid = this.GetSession("cutoken").(string)
// 	token.Pid = this.GetSession("cptoken").(string)
// 	_, res := utils.FetchPost(&token, "project/detail")
// 	this.Data["json"] = res
// 	this.ServeJSON()
// }
