package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
)

type ProjectController struct {
	beego.Controller
}

// 项目信息
func (this *ProjectController) Index() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)

	cacheKey := "project:detail:" + token.Pid

	cval := utils.GetCache(cacheKey)
	if cval != nil {
		this.Data["project"] = cval
		this.TplName = "manage/project/index.tpl"
		return
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
	utils.SetCache(cacheKey, rsd, 60*5)

	this.Data["project"] = rsd
	this.TplName = "manage/project/index.tpl"
}

func (this *ProjectController) ProjectLaborsubcontractors() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "project/laborsubcontractors")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *ProjectController) ProjectConstructions() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "project/constructions")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *ProjectController) ProjectPosts() {
	param := params.PostParam{}
	param.DeptUuid = this.GetString("deptUuid")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "project/posts")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *ProjectController) ProjectGroups() {
	param := params.GroupParam{}
	param.CompanyId = this.GetString("companyId")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "project/groups")
	this.Data["json"] = res
	this.ServeJSON()
}
