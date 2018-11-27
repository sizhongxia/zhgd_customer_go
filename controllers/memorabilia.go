package controllers

import (
	"github.com/astaxie/beego"
)

type MemorabiliaController struct {
	beego.Controller
}

// 项目大事记
func (this *MemorabiliaController) Index() {
	this.TplName = "manage/memorabilia/index.tpl"
}
