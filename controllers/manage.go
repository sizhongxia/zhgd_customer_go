package controllers

import (
	"github.com/astaxie/beego"
)

type ManageController struct {
	beego.Controller
}

func (this *ManageController) Index() {
	this.TplName = "manage/index.tpl"
}

func (this *ManageController) Memorabilia() {
	this.TplName = "manage/memorabilia.tpl"
}
