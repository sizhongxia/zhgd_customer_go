package controllers

import (
	"zhgd/params"
	"zhgd/utils"
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/cache"
)

type ProjectController struct {
	beego.Controller
}

// 项目信息
func (this *ProjectController) Index() {

	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)

	cacheKey := ('Project' + token.Pid)

	bm, bmerr := cache.NewCache("memory", `{"interval":60}`)
	if bmerr == nil {
		if bm.IsExist(cacheKey) {
			this.Data["project"] = bm.Get(cacheKey)
			this.TplName = "manage/project/index.tpl"
			return;
		}
	}

	err, res := utils.FetchPost(&token, "project/detail")
	if err != nil {
		this.Abort("404")
	}
	rsa := res.(map[string]interface{})
	value, ok := rsa["code"].(float64)
	if !ok {
		this.Abort("404")
	}
	if value != 200 {
		this.Abort("404")
	}
	rsd := rsa["data"].(map[string]interface{})

	if bmerr == nil {
		bm.Put(cacheKey, rsd, 10*time.Second)
	}

	this.Data["project"] = rsd
	this.TplName = "manage/project/index.tpl"
}

// func (this *ProjectController) ProjectDetail() {
// 	token := params.BaseToken{}
// 	token.Uid = this.GetSession("cutoken").(string)
// 	token.Pid = this.GetSession("cptoken").(string)
// 	_, res := utils.FetchPost(&token, "project/detail")
// 	this.Data["json"] = res
// 	this.ServeJSON()
// }
