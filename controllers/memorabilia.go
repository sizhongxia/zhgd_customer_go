package controllers

import (
	"zhgd/params"
	"zhgd/utils"
	"github.com/astaxie/beego"
)

type MemorabiliaController struct {
	beego.Controller
}

// 项目大事记
func (this *MemorabiliaController) Index() {
	this.TplName = "manage/memorabilia/index.tpl"
}

func (this *MemorabiliaController) MemorabiliaData() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "memorabilia/data")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) AddMemorabilia() {
	this.TplName = "manage/memorabilia/add.tpl"
}


func (this *MemorabiliaController) MemorabiliaSave() {
	memorabiliaParam := params.MemorabiliaParam{}

	memorabiliaParam.Uid = this.GetSession("cutoken").(string)
	memorabiliaParam.Pid = this.GetSession("cptoken").(string)
	memorabiliaParam.Prouuid = this.GetSession("cptoken").(string)

	memorabiliaParam.Title = this.GetString("title")
	memorabiliaParam.Content = this.GetString("content")
	memorabiliaParam.Happentime = this.GetString("happenTime")
	
	_, res := utils.FetchPost(&memorabiliaParam, "memorabilia/save")
	this.Data["json"] = res
	this.ServeJSON()
}


func (this *MemorabiliaController) EditMemorabilia() {
	memorabiliaParam := params.MemorabiliaParam{}

	memorabiliaParam.Uid = this.GetSession("cutoken").(string)
	memorabiliaParam.Pid = this.GetSession("cptoken").(string)

	memorabiliaParam.Uuid = this.GetString("id")
	_, res := utils.FetchPost(&memorabiliaParam, "memorabilia/detail")
	this.Data["memorabilia"] = res
	this.TplName = "manage/memorabilia/edit.tpl"
}

func (this *MemorabiliaController) MemorabiliaUpdate() {
	memorabiliaParam := params.MemorabiliaParam{}

	memorabiliaParam.Uid = this.GetSession("cutoken").(string)
	memorabiliaParam.Pid = this.GetSession("cptoken").(string)
	memorabiliaParam.Prouuid = this.GetSession("cptoken").(string)

	memorabiliaParam.Uuid = this.GetString("id")

	memorabiliaParam.Title = this.GetString("title")
	memorabiliaParam.Content = this.GetString("content")
	memorabiliaParam.Happentime = this.GetString("happenTime")
	
	_, res := utils.FetchPost(&memorabiliaParam, "memorabilia/update")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) MemorabiliaDelete() {
	param := params.MemorabiliaParam{}
	param.Uuid = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "memorabilia/delete")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) PicsMemorabilia() {
	this.TplName = "manage/memorabilia/pics.tpl"
}

