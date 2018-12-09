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

func (this *MemorabiliaController) MemorabiliaList() {
	token := params.BaseToken{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&token, "memorabilia/list")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) MemorabiliaDetail() {
	token := params.MemorabiliaParam{}
	token.Uid = this.GetSession("cutoken").(string)
	token.Pid = this.GetSession("cptoken").(string)
	token.Uuid = this.GetString("id")
	_, res := utils.FetchPost(&token, "memorabilia/detail")
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

func (this *MemorabiliaController) MemorabiliaRelease() {
	param := params.MemorabiliaParam{}
	param.Uuid = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "memorabilia/release")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) MemorabiliaOutline() {
	param := params.MemorabiliaParam{}
	param.Uuid = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "memorabilia/outline")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) MemorabiliaOnline() {
	param := params.MemorabiliaParam{}
	param.Uuid = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "memorabilia/online")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) PicsMemorabilia() {
	this.Data["id"] = this.GetString("id")
	this.TplName = "manage/memorabilia/pics.tpl"
}

func (this *MemorabiliaController) MemorabiliaPics() {
	param := params.MemorabiliaParam{}
	param.Uuid = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "memorabilia/pics")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) EditPicMemorabilia() {

	param := params.MemorabiliaPicParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "memorabilia/picDetail")

	this.Data["pic"] = res
	this.TplName = "manage/memorabilia/editpic.tpl"
}

func (this *MemorabiliaController) MemorabiliaUpdatePic() {
	memorabiliaParam := params.MemorabiliaPicParam{}

	memorabiliaParam.Uid = this.GetSession("cutoken").(string)
	memorabiliaParam.Pid = this.GetSession("cptoken").(string)

	memorabiliaParam.Id = this.GetString("id")
	memorabiliaParam.Title = this.GetString("title")
	memorabiliaParam.Sortnum = this.GetString("sortnum")

	_, res := utils.FetchPost(&memorabiliaParam, "memorabilia/updatePic")
	this.Data["json"] = res
	this.ServeJSON()
}

func (this *MemorabiliaController) MemorabiliaDeletePic() {
	param := params.MemorabiliaPicParam{}
	param.Id = this.GetString("id")
	param.Uid = this.GetSession("cutoken").(string)
	param.Pid = this.GetSession("cptoken").(string)
	_, res := utils.FetchPost(&param, "memorabilia/deletePic")
	this.Data["json"] = res
	this.ServeJSON()
}
