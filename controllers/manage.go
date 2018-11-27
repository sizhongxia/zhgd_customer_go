package controllers

import (
	"github.com/astaxie/beego"
)

type ManageController struct {
	beego.Controller
}

func (c *ManageController) Index() {
	c.TplName = "manage/index.tpl"
}

func (c *ManageController) Memorabilia() {
	c.TplName = "manage/memorabilia.tpl"
}
