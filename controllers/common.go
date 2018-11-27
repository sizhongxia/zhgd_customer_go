package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
)

type CommonController struct {
	beego.Controller
}

func (this *CommonController) Header() {

	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	err, res := utils.FetchPost(&token, "project/detail")

	if err != nil {
		this.Data["content"] = "请求数据错误E1"
		this.TplName = "error.tpl"
		return
	}

	rsa := res.(map[string]interface{})

	value, ok := rsa["code"].(float64)
	if !ok {
		this.Data["content"] = "请求数据错误E2"
		this.TplName = "error.tpl"
		return
	}

	if value != 200 {
		value2, _ := rsa["message"].(string)
		this.Data["content"] = value2
		this.TplName = "error.tpl"
		return
	}

	rsd := rsa["data"].(map[string]interface{})

	this.Data["projectName"] = rsd["name"].(string)

	this.TplName = "common/header.tpl"
}

func (this *CommonController) SideNav() {
	this.TplName = "common/sidenav.tpl"
}

func (this *CommonController) Main() {
	this.TplName = "main.tpl"
}

func (this *CommonController) DataView() {
	this.TplName = "menu/dataview.tpl"
}
func (this *CommonController) Memorabilia() {
	this.TplName = "menu/memorabilia.tpl"
}
func (this *CommonController) VideoMonitor() {
	this.TplName = "menu/videomonitor.tpl"
}
func (this *CommonController) PersonManagement() {
	this.TplName = "menu/personmanagement.tpl"
}
func (this *CommonController) GreenConstruction() {
	this.TplName = "menu/greenconstruction.tpl"
}
func (this *CommonController) SmarthardWare() {
	this.TplName = "menu/smarthardware.tpl"
}
