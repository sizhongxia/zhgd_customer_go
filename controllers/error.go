package controllers

import (
	"github.com/astaxie/beego"
)

type ErrorController struct {
	beego.Controller
}

func (this *ErrorController) Error403() {
	this.Layout = "error/layout.tpl"
	this.TplName = "error/403.tpl"
}

func (this *ErrorController) Error404() {
	this.Layout = "error/layout.tpl"
	this.TplName = "error/404.tpl"
}

func (this *ErrorController) Error500() {
	this.Layout = "error/layout.tpl"
	this.TplName = "error/500.tpl"
}

func (this *ErrorController) Error501() {
	this.Layout = "error/layout.tpl"
	this.TplName = "error/501.tpl"
}
