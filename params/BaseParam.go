package params

type BaseToken struct {
	Uid string `json:"uid"`
	Pid string `json:"pid"`
}

type LoginParam struct {
	UserName string `json:"username"`
	Password string `json:"password"`
	Vcode    string `json:"vcode"`
}

type UserInfo struct {
	UserName string `json:"userName"`
}

type ErrorResult struct {
	Code    float64 `json:"code"`
	Message string  `json:"message"`
}

type WorktypeParam struct {
	BaseToken

	Id   string `json:"id"`
	Name string `json:"name"`
}

type OrgStructureParam struct {
	BaseToken

	Id        string `json:"id"`
	Name      string `json:"name"`
	CompanyId string `json:"companyId"`
}

type OrgDepartmentParam struct {
	BaseToken

	Id         string   `json:"id"`
	Name       string   `json:"name"`
	ParentUuid string   `json:"parentUuid"`
	Posts      []string `json:"posts"`
}
