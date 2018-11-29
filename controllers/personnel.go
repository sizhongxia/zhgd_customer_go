package controllers

import (
	"zhgd/params"
	"zhgd/utils"
	"github.com/astaxie/beego"
)

type PersonnelController struct {
	beego.Controller
}

// 人员信息管理
func (this *PersonnelController) Index() {
	this.TplName = "manage/personnel/index.tpl"
}


func (this *PersonnelController) AddPersonnel() {


	dictionaryParam := params.DictionaryParam{}
	dictionaryParam.Type = "userSex"
	dictionaryParam.Uid = this.GetSession("cutoken").(string)
	dictionaryParam.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&dictionaryParam, "dictionary")
	this.Data["sexs"] = res

	baseParam := params.BaseToken{}
	baseParam.Uid = this.GetSession("cutoken").(string)
	baseParam.Pid = this.GetSession("cptoken").(string)
	_, res = utils.FetchPost(&baseParam, "nations")
	this.Data["nations"] = res

	this.TplName = "manage/personnel/add.tpl"
}