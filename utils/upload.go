package utils

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"github.com/qiniu/api.v7/auth/qbox"
	"github.com/qiniu/api.v7/storage"
	"golang.org/x/net/context"
)

var qiNiuAk string
var qiNiuSk string
var qiNiuBucket string
var qiNiuZone string

var qiNiuUseHTTPS bool
var qiNiuUseCdnDomains bool

func init() {
	qiNiuAk = beego.AppConfig.String("QiNiuAk")
	qiNiuSk = beego.AppConfig.String("QiNiuSk")
	qiNiuBucket = beego.AppConfig.String("QiNiuBucket")
	qiNiuZone = beego.AppConfig.String("QiNiuZone")

	qiNiuUseHTTPS, _ = beego.AppConfig.Bool("QiNiuUseHTTPS")
	qiNiuUseCdnDomains, _ = beego.AppConfig.Bool("QiNiuUseCdnDomains")
	// Upload("abc.jpg", "‪1.png")
}

type QiNiuPutRet struct {
    Key    string
    Hash   string
    Fsize  	int
    Bucket string
    Name   string
}

// 文件上传
func Upload(key, localFile string) QiNiuPutRet {
	mac := qbox.NewMac(qiNiuAk, qiNiuSk)
	putPolicy := storage.PutPolicy{
		Scope: qiNiuBucket,
		ReturnBody: `{"key":"$(key)","hash":"$(etag)","fsize":$(fsize),"bucket":"$(bucket)","name":"$(x:name)"}`,
		CallbackBodyType: "application/json",
	}
	upToken := putPolicy.UploadToken(mac)

	cfg := storage.Config{}
	if qiNiuZone == "Huadong" {
		cfg.Zone = &storage.ZoneHuadong
	} else if qiNiuZone == "Huabei" {
		cfg.Zone = &storage.ZoneHuabei
	} else if qiNiuZone == "Huanan" {
		cfg.Zone = &storage.ZoneHuanan
	} else if qiNiuZone == "Beimei" {
		cfg.Zone = &storage.ZoneBeimei
	} else if qiNiuZone == "Xinjiapo" {
		cfg.Zone = &storage.ZoneXinjiapo
	}

	cfg.UseHTTPS = qiNiuUseHTTPS
    cfg.UseCdnDomains = qiNiuUseCdnDomains
	
	formUploader := storage.NewFormUploader(&cfg)
	ret := QiNiuPutRet{}
	putExtra := storage.PutExtra{
		Params: map[string]string{
			"x:name": "yeetong_pic",
		},
	}

	err := formUploader.PutFile(context.Background(), &ret, upToken, key, localFile, &putExtra)
	if err != nil {
		logs.Error(err)
	}
	return ret
}