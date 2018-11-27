package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
)

type WorktypeController struct {
	beego.Controller
}

// Worktype 工种管理
func (this *WorktypeController) Worktype() {
	this.TplName = "manage/worktype/index.tpl"
}

func (this *WorktypeController) AddWorktype() {
	this.TplName = "manage/worktype/add.tpl"
}

func (this *WorktypeController) EditWorktype() {
	param := params.WorktypeParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "worktype/detail")
	this.Data["data"] = res
	this.TplName = "manage/worktype/edit.tpl"
}

func (this *WorktypeController) WorktypeData() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "worktype/data")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *WorktypeController) WorktypeSave() {
	param := params.WorktypeParam{}
	param.Name = this.GetString("name")
	valid := validation.Validation{}
	if v := valid.Required(param.Name, "name"); !v.Ok {
		errInfo := params.ErrorResult{}
		errInfo.Code = -1
		errInfo.Message = "请输入工种名称"
		this.Data["json"] = errInfo
	} else {
		param.Uid = this.GetSession("cutoken").(string)
		param.Pid = this.GetSession("cptoken").(string)
		_, res := utils.FetchPost(&param, "worktype/save")
		this.Data["json"] = res
	}
	this.ServeJSON()
}

func (this *WorktypeController) WorktypeDelete() {
	param := params.WorktypeParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "worktype/delete")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *WorktypeController) WorktypeUpdate() {
	param := params.WorktypeParam{}
	param.Id = this.GetString("id")
	param.Name = this.GetString("name")
	valid := validation.Validation{}
	if v := valid.Required(param.Name, "name"); !v.Ok {
		errInfo := params.ErrorResult{}
		errInfo.Code = -1
		errInfo.Message = "请输入工种名称"
		this.Data["json"] = errInfo
	} else {
		param.Uid = this.GetSession("cutoken").(string)
		param.Pid = this.GetSession("cptoken").(string)
		_, res := utils.FetchPost(&param, "worktype/update")
		this.Data["json"] = res
	}
	this.ServeJSON()
}
