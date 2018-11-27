package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
)

type OrgstructureController struct {
	beego.Controller
}

func (this *OrgstructureController) Index() {
	this.TplName = "manage/orgstructure/index.tpl"
}

func (this *OrgstructureController) OrgstructureData() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "orgstructure/data")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *OrgstructureController) OrgstructureTreeData() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "orgstructure/treedata")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *OrgstructureController) EditGroup() {
	param := params.OrgStructureParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	err, res := utils.FetchPost(&param, "orgstructure/laborsubcontractor/groups")

	if err != nil {
		this.TplName = "manage/error.tpl"
		return
	}

	rsa := res.(map[string]interface{})
	value, ok := rsa["code"].(float64)
	if !ok {
		this.TplName = "manage/error.tpl"
		return
	}
	if value != 200 {
		this.TplName = "manage/error.tpl"
		return
	}

	this.Data["data"] = res
	this.TplName = "manage/orgstructure/group/edit.tpl"
}

func (this *OrgstructureController) GroupDelete() {
	param := params.OrgStructureParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/delete/group")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *OrgstructureController) GroupUpdate() {
	param := params.OrgStructureParam{}
	param.Id = this.GetString("id")
	param.Name = this.GetString("name")
	param.CompanyId = this.GetString("companyId")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/update/group")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *OrgstructureController) GroupSave() {
	param := params.OrgStructureParam{}
	param.Name = this.GetString("name")
	param.CompanyId = this.GetString("companyId")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/save/group")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *OrgstructureController) AddDepartment() {

	param := params.OrgStructureParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/level1data")

	rsa := res.(map[string]interface{})

	value, ok := rsa["code"].(float64)
	if !ok {
		this.TplName = "manage/error.tpl"
		return
	}
	if value != 200 {
		this.TplName = "manage/error.tpl"
		return
	}

	this.Data["data"] = rsa["data"]

	this.TplName = "manage/orgstructure/department/add.tpl"
}

func (this *OrgstructureController) DepartmentSave() {
	param := params.OrgDepartmentParam{}
	param.Name = this.GetString("name")
	param.ParentUuid = this.GetString("parentId")

	param.Posts = this.GetStrings("posts[]")[:]

	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/save/department")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *OrgstructureController) EditDepartment() {

	param := params.OrgStructureParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/department/detail")

	rsa := res.(map[string]interface{})

	value, ok := rsa["code"].(float64)
	if !ok {
		this.TplName = "manage/error.tpl"
		return
	}
	if value != 200 {
		this.TplName = "manage/error.tpl"
		return
	}

	this.Data["data"] = rsa["data"]
	this.TplName = "manage/orgstructure/department/edit.tpl"
}

func (this *OrgstructureController) DepartmentUpdate() {
	param := params.OrgDepartmentParam{}
	param.Id = this.GetString("id")
	param.Name = this.GetString("name")
	param.Posts = this.GetStrings("posts[]")[:]
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/update/department")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *OrgstructureController) DepartmentDelete() {
	param := params.OrgDepartmentParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "orgstructure/delete/department")
	this.Data["json"] = res
	this.ServeJSON()
}
