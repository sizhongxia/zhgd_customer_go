package main

import (
	"strings"
	"time"
	"zhgd/controllers"
	_ "zhgd/routers"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
	"github.com/astaxie/beego/logs"
)

var sessionCheckFilter = func(ctx *context.Context) {
	logs.Info(time.Now().Format("2006-01-02 15:04:05"))
	cutoken := ctx.Input.Session("cutoken")
	if cutoken == nil && !strings.HasPrefix(ctx.Request.RequestURI, "/login") {
		ctx.Redirect(302, "/login")
	}
}

func main() {
	beego.ErrorController(&controllers.ErrorController{})
	beego.InsertFilter("/*", beego.BeforeRouter, sessionCheckFilter)
	beego.Run()
}
