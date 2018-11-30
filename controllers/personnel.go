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

	areaParam := params.AreaParam{}
	areaParam.Pcode = "0"
	areaParam.Uid = this.GetSession("cutoken").(string)
	areaParam.Pid = this.GetSession("cptoken").(string)
	_, res = utils.FetchPost(&areaParam, "area")
	this.Data["provinces"] = res

	_, res = utils.FetchPost(&baseParam, "project/worktypes")
	this.Data["worktypes"] = res

	_, res = utils.FetchPost(&baseParam, "project/departments")
	this.Data["departments"] = res

	this.TplName = "manage/personnel/add.tpl"
}

func (this *PersonnelController) PersonnelSave() {
	personnelParam := params.PersonnelParam{}

	personnelParam.Uid = this.GetSession("cutoken").(string)
	personnelParam.Pid = this.GetSession("cptoken").(string)

	personnelParam.Name = this.GetString("name")
	personnelParam.Code = this.GetString("code")
	personnelParam.Sex = this.GetString("sex")
	personnelParam.Birthday = this.GetString("birthday")
	personnelParam.Age = this.GetString("age")
	personnelParam.Birthplace1 = this.GetString("birthplace1")
	personnelParam.Birthplace2 = this.GetString("birthplace2")
	personnelParam.Birthplace3 = this.GetString("birthplace3")
	personnelParam.Photo = this.GetString("photo")
	personnelParam.Nation = this.GetString("nation")
	personnelParam.HomeAddress = this.GetString("homeAddress")
	personnelParam.Telephone = this.GetString("telephone")
	personnelParam.PersonnelType = this.GetString("personnelType")
	personnelParam.ProUuid = personnelParam.Pid
	personnelParam.CompanyUuid = this.GetString("companyUuid")
	personnelParam.GroupUuid = this.GetString("groupUuid")
	personnelParam.IsGroupLeader = this.GetString("isGroupLeader")
	personnelParam.WorkType = this.GetString("workType")
	personnelParam.DeptUuid = this.GetString("deptUuid")
	personnelParam.Post = this.GetString("post")
	_, res := utils.FetchPost(&personnelParam, "personnel/save")
	this.Data["json"] = res
	this.ServeJSON()
}
