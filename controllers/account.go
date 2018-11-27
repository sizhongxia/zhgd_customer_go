package controllers

import (
	"github.com/astaxie/beego"
)

type AccountController struct {
	beego.Controller
}

// 工地账号信息
func (this *AccountController) Index() {
	this.TplName = "manage/account/index.tpl"
}
