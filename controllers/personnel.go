package controllers

import (
	"github.com/astaxie/beego"
)

type PersonnelController struct {
	beego.Controller
}

// 人员信息管理
func (this *PersonnelController) Index() {
	this.TplName = "manage/personnel/index.tpl"
}
