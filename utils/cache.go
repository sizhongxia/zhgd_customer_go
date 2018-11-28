package utils

import (
	"encoding/json"
	"errors"
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/cache"
	_ "github.com/astaxie/beego/cache/redis"
	"github.com/astaxie/beego/logs"
)

var cc cache.Cache

func init() {
	host := beego.AppConfig.String("RedisHost")
	port := beego.AppConfig.String("RedisPort")
	pwd := beego.AppConfig.String("RedisPwd")

	var err error
	defer func() {
		if r := recover(); r != nil {
			cc = nil
		}
	}()

	cc, err = cache.NewCache("redis", `{"conn":"`+host+`:`+port+`","password":"`+pwd+`","key":"rediscache","dbNum":"0"}`)
	if err != nil {
		logs.Error("Connect to the redis host " + host + " failed")
		logs.Error(err)
	}
}

// SetCache
func SetCache(key string, value interface{}, timeout int) error {
	data, err := json.Marshal(value)
	if err != nil {
		return err
	}
	if cc == nil {
		return errors.New("cc is nil")
	}

	defer func() {
		if r := recover(); r != nil {
			logs.Error(r)
			cc = nil
		}
	}()
	timeouts := time.Duration(timeout) * time.Second
	err = cc.Put(key, data, timeouts)
	if err != nil {
		logs.Error(err)
		logs.Error("SetCache失败，key:" + key)
		return err
	} else {
		return nil
	}
}

func GetCache(key string) interface{} {
	if cc == nil {
		return nil
	}

	defer func() {
		if r := recover(); r != nil {
			logs.Error(r)
			cc = nil
		}
	}()

	data := cc.Get(key)
	if data == nil {
		return nil
	}
	var res interface{}
	err := json.Unmarshal(data.([]byte), &res)
	if err != nil {
		logs.Error(err)
		logs.Error("GetCache失败，key:" + key)
	}
	return res
}

// DelCache
func DelCache(key string) error {
	if cc == nil {
		return errors.New("cc is nil")
	}
	defer func() {
		if r := recover(); r != nil {
			//fmt.Println("get cache error caught: %v\n", r)
			cc = nil
		}
	}()
	err := cc.Delete(key)
	if err != nil {
		return errors.New("Cache删除失败")
	} else {
		return nil
	}
}
