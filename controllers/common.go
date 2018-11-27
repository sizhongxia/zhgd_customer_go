package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
)

type CommonController struct {
	beego.Controller
}

func (c *CommonController) Header() {

	token := params.BaseToken{}
	token.Uid = c.GetSession("cutoken").(string)
	token.Pid = c.GetSession("cptoken").(string)
	err, res := utils.FetchPost(&token, "project/detail")

	if err != nil {
		c.Data["content"] = "请求数据错误E1"
		c.TplName = "error.tpl"
		return
	}

	rsa := res.(map[string]interface{})

	value, ok := rsa["code"].(float64)
	if !ok {
		c.Data["content"] = "请求数据错误E2"
		c.TplName = "error.tpl"
		return
	}

	if value != 200 {
		value2, _ := rsa["message"].(string)
		c.Data["content"] = value2
		c.TplName = "error.tpl"
		return
	}

	rsd := rsa["data"].(map[string]interface{})

	c.Data["projectName"] = rsd["name"].(string)

	c.TplName = "common/header.tpl"
}

func (c *CommonController) SideNav() {
	c.TplName = "common/sidenav.tpl"
}

func (c *CommonController) Main() {
	c.TplName = "main.tpl"
}

func (c *CommonController) DataView() {
	c.TplName = "menu/dataview.tpl"
}
func (c *CommonController) Memorabilia() {
	c.TplName = "menu/memorabilia.tpl"
}
func (c *CommonController) VideoMonitor() {
	c.TplName = "menu/videomonitor.tpl"
}
func (c *CommonController) PersonManagement() {
	c.TplName = "menu/personmanagement.tpl"
}
func (c *CommonController) GreenConstruction() {
	c.TplName = "menu/greenconstruction.tpl"
}
func (c *CommonController) SmarthardWare() {
	c.TplName = "menu/smarthardware.tpl"
}
