package controllers

import (
	"github.com/astaxie/beego"
)

type ErrorController struct {
	beego.Controller
}

func (c *ErrorController) Error403() {
	c.Data["content"] = "Forbidden"
	c.TplName = "error.tpl"
}

func (c *ErrorController) Error404() {
	c.Data["content"] = "page not found"
	c.TplName = "error.tpl"
}

func (c *ErrorController) Error501() {
	c.Data["content"] = "server error 501"
	c.TplName = "error.tpl"
}

func (c *ErrorController) Error500() {
	c.Data["content"] = "server error 500"
	c.TplName = "error.tpl"
}
