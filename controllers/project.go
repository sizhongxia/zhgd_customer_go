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
	this.TplName = "manage/project/index.tpl"
}

func (this *ProjectController) ProjectDetail() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "project/detail")
	this.Data["json"] = res
	this.ServeJSON()
}
