<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8" />
    <title>一通无限科技</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/libs/layui/css/layui.css?v=2.4.3" />
    <link rel="stylesheet" href="//cdn.bootcss.com/Swiper/4.4.2/css/swiper.min.css" />
    <link rel="stylesheet" href="/static/css/admin.css" />
    <link rel="stylesheet" href="/static/css/console.css" />
    <link rel="stylesheet" href="/static/css/memorabilia.css" />
    <link rel="stylesheet" href="/static/module/formSelects/formSelects-v4.css" />
    <style type="text/css">
        .layui-layer-move {
            z-index: 0 !important;
        }

        .layui-layer-title {
            color: #ccc !important;
            background-color: rgba(11, 22, 33, 0.88) !important;
        }

        .layui-layer-btn .layui-layer-btn0 {
            border-color: rgba(11, 22, 33, 0.88) !important;
            background-color: rgba(11, 22, 33, 0.88) !important;
        }

        .layui-nav .layui-nav-item a {
            color: rgba(255, 255, 255, .45);
        }

        .layui-nav-tree .layui-nav-child dd.layui-this,
        .layui-nav-tree .layui-nav-child dd.layui-this a,
        .layui-nav-tree .layui-this,
        .layui-nav-tree .layui-this>a,
        .layui-nav-tree .layui-this>a:hover {
            background-color: rgba(255, 255, 255, 0.08);
            color: rgb(255, 255, 255);
        }

        .layui-layout-admin .layui-header .layui-nav .layui-this:after,
        .layui-layout-admin .layui-header .layui-nav-bar {
            background-color: #ffffff;
        }

        .layui-nav-tree .layui-nav-bar {
            background-color: rgba(11, 22, 33, 0.88);
        }

        #time {
            position: absolute;
            top: 0;
            left: 50%;
            width: 120px;
            text-align: center;
            margin-left: -60px;
            line-height: 50px;
            font-size: 18px;
            color: #ffffff;
            z-index: 9999999;
            font-weight: bolder;
            font-family: fantasy;
            letter-spacing: 6px;
        }
    </style>
</head>

<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div id="time">
            <div style="width: 50px;float: left;text-align: right;" id="time-hour">__</div>
            <div style="width: 12px;float: left;text-align: right;margin-top: -2px;" id="time-separator">:</div>
            <div style="width: 50px;float: left;margin-left: -8px;" id="time-minute">__</div>
        </div>
        <!-- 头部 -->
        <div class="layui-header" p-com="base.console/header"></div>
        <!-- 侧边栏 -->
        <div class="layui-side"></div>
        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="layui-tab" lay-allowClose="true" lay-filter="admin-pagetabs">
                <ul class="layui-tab-title"></ul>
                <div class="layui-tab-content"></div>
            </div>
            <div class="layui-icon admin-tabs-control layui-icon-prev" ew-event="leftPage"></div>
            <div class="layui-icon admin-tabs-control layui-icon-next" ew-event="rightPage"></div>
            <div class="layui-icon admin-tabs-control layui-icon-down">
                <ul class="layui-nav admin-tabs-select" lay-filter="admin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd ew-event="closeThisTabs" lay-unselect><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd ew-event="closeOtherTabs" lay-unselect><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd ew-event="closeAllTabs" lay-unselect><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 底部 
        <div class="layui-footer">版权所有 &copy; 2019 By <a href="https://www.yeetong.cn" target="_blank">YeeTong.CN</a> 一通无限</div>
        -->
        <!-- 手机屏幕遮罩层 -->
        <div class="site-mobile-shade"></div>
    </div>

    <script type="text/javascript" src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="/static/libs/q.js"></script>
    <script type="text/javascript" src="/static/libs/pandyle.min.js"></script>
    <script type="text/javascript" src="/static/libs/layui/layui.js"></script>
    <script type="text/javascript" src="//cdn.bootcss.com/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="//cdn.bootcss.com/Swiper/4.4.2/js/swiper.min.js"></script>
    <script type="text/javascript" src="/static/js/g2.js"></script>
        
    <script src="//gw.alipayobjects.com/os/antv/pkg/_antv.data-set-0.10.1/dist/data-set.min.js"></script>
    <script src="//webapi.amap.com/maps?v=1.4.1&key=0d78256ea89beeb8c25d1cd047549d1f"></script>
    <script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>


    <script>
        layui.config({
            base: '/static/module/'
        }).extend({
            treetable: 'treetable-lay/treetable',
            inputTags: 'inputTags/inputTags',
            ckplayer: 'ckplayer/ckplayer'
        }).use(['config', 'index', 'element', 'util', 'admin'], function () {
            var config = layui.config;
            var index = layui.index;
            var element = layui.element;
            var util = layui.util;
            var admin = layui.admin;

            Pandyle.config({
                comPath: {
                    base: '/{name}'
                }
            });
            // 获取当前用户信息
            index.getUser(function (user) {
                $('.layui-layout-admin .layui-header').vm(user);
                index.initLeftNav();
                element.render('nav');
                index.bindEvent();
            });
            
            admin.req('/time', {}, function(res){
                var currentSecond = res.timestamp;
                setInterval(function () {
                    var now = new Date(++currentSecond * 1000).getTime();
                    var hour = util.digit(util.toDateString(now, "HH"),2)
                    if(hour < 10) {
                        hour = "0" + hour;
                    }
                    var minute = util.digit(util.toDateString(now, "mm"),2)
                    if(minute < 10) {
                        minute = "0" + minute;
                    }
                    $("#time-hour").html(hour)
                    $("#time-separator").html("&nbsp;")
                    $("#time-minute").html(minute)
                    setTimeout(function () {
                        $("#time-separator").html(":")
                    }, 500)
                }, 1000)
            }, 'POST')

        });
    </script>
</body>

</html>