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

// func (c *ManageController) Tpl() {
// 	// time.Sleep(time.Duration(3)*time.Second)
// 	c.TplName = "manage/tpl.tpl"
// }

// func (c *ManageController) Project() {
// 	c.TplName = "manage/project.tpl"
// }
// func (c *ManageController) Account() {
// 	c.TplName = "manage/account.tpl"
// }
func (c *ManageController) Memorabilia() {
	c.TplName = "manage/memorabilia.tpl"
}

// func (c *ManageController) Personnel() {
// 	c.TplName = "manage/personnel.tpl"
// }
