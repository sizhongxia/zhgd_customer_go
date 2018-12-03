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

type DictionaryParam struct {
	BaseToken

	Type string `json:"type"`
}

type AreaParam struct {
	BaseToken

	Pcode string `json:"pcode"`
}

type PostParam struct {
	BaseToken

	DeptUuid string `json:"deptUuid"`
}

type GroupParam struct {
	BaseToken

	CompanyId string `json:"companyId"`
}

type PersonnelParam struct {
	BaseToken

	Id          string `json:"id"`
	Name          string `json:"name"`
	Code          string `json:"code"`
	Sex           string `json:"sex"`
	Birthday      string `json:"birthday"`
	Age           string `json:"age"`
	Birthplace1   string `json:"birthplace1"`
	Birthplace2   string `json:"birthplace2"`
	Birthplace3   string `json:"birthplace3"`
	Photo         string `json:"photo"`
	Nation        string `json:"nation"`
	HomeAddress   string `json:"homeaddress"`
	Telephone     string `json:"telephone"`
	PersonnelType string `json:"type"`
	ProUuid       string `json:"prouuid"`
	CompanyUuid   string `json:"companyuuid"`
	GroupUuid     string `json:"groupuuid"`
	IsGroupLeader string `json:"isgroupleader"`
	WorkType      string `json:"worktype"`
	DeptUuid      string `json:"deptuuid"`
	Post          string `json:"post"`
}



type MemorabiliaParam struct {
	BaseToken

	Uuid          string `json:"uuid"`

	Title          string `json:"title"`
	Content           string `json:"content"`
	Happentime      string `json:"happentime"`
	Prouuid          string `json:"prouuid"`
}


type MemorabiliaPicParam struct {
	BaseToken

	Id	string `json:"id"`
	Pic string `json:"pic"`
	Title string `json:"title"`
	Sortnum string `json:"sortnum"`
}
