package routers

import (
	. "zhgd/controllers"

	"github.com/astaxie/beego"
)

func init() {

	beego.Router("/", &MainController{}, "*:Index")
	beego.Router("/error", &MainController{}, "*:ErrPage")

	beego.Router("/login", &MainController{}, "*:Login")
	beego.Router("/logout", &MainController{}, "*:Logout")

	beego.Router("/time", &MainController{}, "*:Time")

	// Api
	beego.Router("/loginaction", &MainController{}, "POST:LoginAction")
	beego.Router("/api/user/info", &MainController{}, "POST:UserInfo")
	beego.Router("/api/user/menus", &MainController{}, "POST:UserMenus")
	beego.Router("/upload/personnel/photo", &MainController{}, "POST:UploadPersonnelPhoto")
	beego.Router("/upload/memorabilia/pics", &MainController{}, "POST:UploadMemorabiliaPics")

	// 工种管理
	beego.Router("/manage/worktype", &WorktypeController{}, "*:Worktype")
	beego.Router("/manage/worktype/add", &WorktypeController{}, "*:AddWorktype")
	beego.Router("/manage/worktype/edit", &WorktypeController{}, "*:EditWorktype")
	beego.Router("/api/worktype/data", &WorktypeController{}, "*:WorktypeData")
	beego.Router("/api/worktype/save", &WorktypeController{}, "*:WorktypeSave")
	beego.Router("/api/worktype/update", &WorktypeController{}, "*:WorktypeUpdate")
	beego.Router("/api/worktype/delete", &WorktypeController{}, "*:WorktypeDelete")

	beego.Router("/console", &CommonController{}, "*:Main")

	beego.Router("/api/area", &CommonController{}, "*:AreaData")

	// 公共
	beego.Router("/console/header", &CommonController{}, "*:Header")
	beego.Router("/console/sidenav", &CommonController{}, "*:SideNav")

	// 主菜单
	beego.Router("/console/dataview", &CommonController{}, "*:DataView")
	beego.Router("/console/memorabilia", &CommonController{}, "*:Memorabilia")
	beego.Router("/console/videomonitor", &CommonController{}, "*:VideoMonitor")
	beego.Router("/console/personmanagement", &CommonController{}, "*:PersonManagement")
	beego.Router("/console/greenconstruction", &CommonController{}, "*:GreenConstruction")
	beego.Router("/console/smarthardware", &CommonController{}, "*:SmarthardWare")

	// 工地管理相关菜单
	beego.Router("/manage/index", &ManageController{}, "*:Index")

	beego.Router("/manage/project", &ProjectController{}, "*:Index")
	beego.Router("/api/project/laborsubcontractors", &ProjectController{}, "*:ProjectLaborsubcontractors")
	beego.Router("/api/project/constructions", &ProjectController{}, "*:ProjectConstructions")
	beego.Router("/api/project/posts", &ProjectController{}, "*:ProjectPosts")
	beego.Router("/api/project/groups", &ProjectController{}, "*:ProjectGroups")

	beego.Router("/manage/account", &AccountController{}, "*:Index")

	beego.Router("/manage/memorabilia", &MemorabiliaController{}, "*:Index")
	beego.Router("/manage/memorabilia/add", &MemorabiliaController{}, "*:AddMemorabilia")
	beego.Router("/manage/memorabilia/edit", &MemorabiliaController{}, "*:EditMemorabilia")
	beego.Router("/manage/memorabilia/pics", &MemorabiliaController{}, "*:PicsMemorabilia")
	beego.Router("/manage/memorabilia/editpic", &MemorabiliaController{}, "*:EditPicMemorabilia")
	beego.Router("/api/memorabilia/data", &MemorabiliaController{}, "*:MemorabiliaData")
	beego.Router("/api/memorabilia/save", &MemorabiliaController{}, "*:MemorabiliaSave")
	beego.Router("/api/memorabilia/update", &MemorabiliaController{}, "*:MemorabiliaUpdate")
	beego.Router("/api/memorabilia/delete", &MemorabiliaController{}, "*:MemorabiliaDelete")
	beego.Router("/api/memorabilia/release", &MemorabiliaController{}, "*:MemorabiliaRelease")
	beego.Router("/api/memorabilia/outline", &MemorabiliaController{}, "*:MemorabiliaOutline")
	beego.Router("/api/memorabilia/online", &MemorabiliaController{}, "*:MemorabiliaOnline")
	beego.Router("/api/memorabilia/pics", &MemorabiliaController{}, "*:MemorabiliaPics")
	beego.Router("/api/memorabilia/updatepic", &MemorabiliaController{}, "*:MemorabiliaUpdatePic")
	beego.Router("/api/memorabilia/deletePic", &MemorabiliaController{}, "*:MemorabiliaDeletePic")
	beego.Router("/api/memorabilia/list", &MemorabiliaController{}, "*:MemorabiliaList")
	beego.Router("/api/memorabilia/detail", &MemorabiliaController{}, "*:MemorabiliaDetail")

	beego.Router("/manage/personnel", &PersonnelController{}, "*:Index")
	beego.Router("/manage/personnel/add", &PersonnelController{}, "*:AddPersonnel")
	beego.Router("/manage/personnel/edit", &PersonnelController{}, "*:EditPersonnel")
	beego.Router("/manage/personnel/editBirthPlace", &PersonnelController{}, "*:EditBirthPlacePersonnel")
	beego.Router("/manage/personnel/detail", &PersonnelController{}, "*:DetailPersonnel")
	beego.Router("/manage/personnel/photo", &PersonnelController{}, "*:PhotoPersonnel")
	beego.Router("/api/personnel/data", &PersonnelController{}, "*:PersonnelData")
	beego.Router("/api/personnel/save", &PersonnelController{}, "*:PersonnelSave")
	beego.Router("/api/personnel/update", &PersonnelController{}, "*:PersonnelUpdate")
	beego.Router("/api/personnel/updateBirthPlace", &PersonnelController{}, "*:PersonnelUpdateBirthPlace")
	beego.Router("/api/personnel/delete/identity", &PersonnelController{}, "*:PersonnelDeleteIdentity")

	beego.Router("/api/personnel/statistics/worktype", &PersonnelStatisticsController{}, "*:Worktype")
	beego.Router("/api/personnel/statistics/basecensuss", &PersonnelStatisticsController{}, "*:BaseCensuss")

	beego.Router("/manage/orgstructure", &OrgstructureController{}, "*:Index")
	beego.Router("/api/orgstructure/data", &OrgstructureController{}, "*:OrgstructureData")
	beego.Router("/api/orgstructure/treedata", &OrgstructureController{}, "*:OrgstructureTreeData")

	beego.Router("/manage/orgstructure/group/edit", &OrgstructureController{}, "*:EditGroup")
	beego.Router("/api/orgstructure/group/save", &OrgstructureController{}, "*:GroupSave")
	beego.Router("/api/orgstructure/group/update", &OrgstructureController{}, "*:GroupUpdate")
	beego.Router("/api/orgstructure/group/delete", &OrgstructureController{}, "*:GroupDelete")

	beego.Router("/manage/orgstructure/department/add", &OrgstructureController{}, "*:AddDepartment")
	beego.Router("/manage/orgstructure/department/edit", &OrgstructureController{}, "*:EditDepartment")
	beego.Router("/api/orgstructure/department/save", &OrgstructureController{}, "*:DepartmentSave")
	beego.Router("/api/orgstructure/department/update", &OrgstructureController{}, "*:DepartmentUpdate")
	beego.Router("/api/orgstructure/department/delete", &OrgstructureController{}, "*:DepartmentDelete")

}
