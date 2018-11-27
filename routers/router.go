package routers

import (
	. "zhgd/controllers"

	"github.com/astaxie/beego"
)

func init() {

	beego.Router("/", &MainController{}, "*:Index")

	beego.Router("/login", &MainController{}, "*:Login")
	beego.Router("/logout", &MainController{}, "*:Logout")

	// Api
	beego.Router("/loginaction", &MainController{}, "POST:LoginAction")
	beego.Router("/api/user/info", &MainController{}, "POST:UserInfo")
	beego.Router("/api/user/menus", &MainController{}, "POST:UserMenus")

	// 工种管理
	beego.Router("/manage/worktype", &WorktypeController{}, "*:Worktype")
	beego.Router("/manage/worktype/add", &WorktypeController{}, "*:AddWorktype")
	beego.Router("/manage/worktype/edit", &WorktypeController{}, "*:EditWorktype")
	beego.Router("/api/worktype/data", &WorktypeController{}, "*:WorktypeData")
	beego.Router("/api/worktype/save", &WorktypeController{}, "*:WorktypeSave")
	beego.Router("/api/worktype/update", &WorktypeController{}, "*:WorktypeUpdate")
	beego.Router("/api/worktype/delete", &WorktypeController{}, "*:WorktypeDelete")

	beego.Router("/console", &CommonController{}, "*:Main")

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

	beego.Router("/manage/account", &AccountController{}, "*:Index")
	beego.Router("/manage/memorabilia", &MemorabiliaController{}, "*:Index")
	beego.Router("/manage/personnel", &PersonnelController{}, "*:Index")
	beego.Router("/manage/orgstructure", &OrgstructureController{}, "*:Index")

	beego.Router("/manage/orgstructure/group/edit", &OrgstructureController{}, "*:EditGroup")
	beego.Router("/api/orgstructure/group/save", &OrgstructureController{}, "*:GroupSave")
	beego.Router("/api/orgstructure/group/update", &OrgstructureController{}, "*:GroupUpdate")
	beego.Router("/api/orgstructure/group/delete", &OrgstructureController{}, "*:GroupDelete")

	beego.Router("/api/orgstructure/data", &OrgstructureController{}, "*:OrgstructureData")
	beego.Router("/api/orgstructure/treedata", &OrgstructureController{}, "*:OrgstructureTreeData")

	beego.Router("/manage/orgstructure/department/add", &OrgstructureController{}, "*:AddDepartment")
	beego.Router("/manage/orgstructure/department/edit", &OrgstructureController{}, "*:EditDepartment")
	beego.Router("/api/orgstructure/department/save", &OrgstructureController{}, "*:DepartmentSave")
	beego.Router("/api/orgstructure/department/update", &OrgstructureController{}, "*:DepartmentUpdate")
	beego.Router("/api/orgstructure/department/delete", &OrgstructureController{}, "*:DepartmentDelete")

}
