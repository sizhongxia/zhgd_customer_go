package controllers

import (
	"zhgd/params"
	"zhgd/utils"

	"github.com/astaxie/beego"
)

type PersonnelStatisticsController struct {
	beego.Controller
}

func (this *PersonnelStatisticsController) Worktype() {
	baseParam := params.BaseToken{}
	baseParam.Uid = this.GetSession("cutoken").(string)
	baseParam.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&baseParam, "personnel/statistics/worktype")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *PersonnelStatisticsController) BaseCensuss() {
	baseParam := params.BaseToken{}
	baseParam.Uid = this.GetSession("cutoken").(string)
	baseParam.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&baseParam, "personnel/statistics/basecensuss")
	this.Data["json"] = res
	this.ServeJSON()
}
