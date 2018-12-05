<div id="console-box">
    <div class="row">
        <div class="layui-col-xs2">
            <div id="memorabilialist">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide memorabiliaitem" data-id="1">Slide 1</div>
                        <div class="swiper-slide memorabiliaitem" data-id="2">Slide 2</div>
                        <div class="swiper-slide memorabiliaitem" data-id="3">Slide 3</div>
                        <div class="swiper-slide memorabiliaitem" data-id="4">Slide 4</div>
                        <div class="swiper-slide memorabiliaitem" data-id="5">Slide 5</div>
                        <div class="swiper-slide memorabiliaitem" data-id="6">Slide 6</div>
                        <div class="swiper-slide memorabiliaitem" data-id="7">Slide 7</div>
                        <div class="swiper-slide memorabiliaitem" data-id="8">Slide 8</div>
                        <div class="swiper-slide memorabiliaitem" data-id="9">Slide 9</div>
                        <div class="swiper-slide memorabiliaitem" data-id="10">Slide 10</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs10">
            <div id="memorabilia"></div>
            <p>
            到百度首页
js 查看大图
百度首页消息设置zhongxia92620
网页资讯贴吧知道视频音乐图片地图文库更多»
展开其他人还搜

fancybox
Lightbox插件


js代码
代码脚本文件


jquery
简洁的JavaScript框架


javascript
浏览器支持的脚本语言


脚本
使用特定的描述性语言


网页特效
活跃网页气氛动态效果


css插件工具箱
计算机与互联网图书

疯狂html 5/css 3/j...
前端开发者的参考手册

换一换 搜索热点
1支付宝勒索病毒新	49万
2小学生持刀弑母新	46万
3过马路看手机判刑	40万
4体检行业爆丑闻	38万
5网贷12万给女主播	35万
6高校禁烟表情包	35万
7张家口遇难者名单	35万
8腾讯回应勒索病毒	34万
9演员穿镂空裙被诉	33万
10SpaceX再破纪录新	33万
查看更多>>
收起工具时间不限所有网页和文件站点内检索
搜索工具百度为您找到相关结果约4,860,000个
强大的jQuery图片查看器插件Viewer.js

插件描述:Viewer.js 是一款强大的图片查看器 1、引入文件 JS 版本: jQuery 版本: ...
www.jq22.com/jquery-in...  - 百度快照
js点击小图弹出大图查看代码_站长素材
我要投稿 名称: js点击小图弹出大图查看代码 类型: 脚本 标签:js鼠标点击图片相册查看大图 分享到: 新浪 腾讯 QQ空间 ...
sc.chinaz.com/jiaobend...  - 百度快照
点击图片全屏放大查看js代码 - 素材火

2017年9月5日 - 这是一个点击图片全屏放大查看js代码,上下左右移动鼠标查看未显示的部分,再次点击全屏图片退出全屏查看。
www.sucaihuo.com/js/2...  - 百度快照
超简单查看大图js插件,附下载链接 - 北影的博客 - CSDN博客
2018年3月31日 - 原文地址:http://www.itoak.cn/archives/301在平时的网页开发中,经常会需要放大图片,查看详情。网上也有很多类似的插件,功能很多,很强大,但很多功能都...
https://blog.csdn.net/u0125343...  - 百度快照
js点击图片全屏放大查看效果代码
2017年8月31日 - JS鼠标点击图片放大,全屏查看图片的JavaScript库。单击图片查看其操作!(不兼容IE6,7,8)
www.17sucai.com/pins/2...  - 百度快照
JS实现简单的图片查看效果 - 萧逸才的博客 - CSDN博客
2017年3月29日 - 用js实现了一个简单的图片查看效果。主要功能: 1、点击图片后打开遮罩并在遮罩中显示图片,大小已做好限制,不会因为图片太大而导致出现滚动条; 2、鼠标...
https://blog.csdn.net/xyc_csdn...  - 百度快照
JS点击缩略图整屏居中放大图片效果_javascript技巧_脚本之家

2017年7月4日 - 今天开发的时候,遇到要点击缩略图之后居中显示图片的大图查看(大致效果如上图所示)~想了好几种实现方式,下面...
https://www.jb51.net/article/1...  - 百度快照
            </p>
        </div>
    </div>
</div>


<script id="memorabiliatpl" type="text/html">
    <div class="swiper-container">
        <div style="width:100%;background:#fff;height:46px;"></div>
        <div class="swiper-wrapper">
            {{#  layui.each(d.list, function(index, item){ }}
                <div class="swiper-slide">
                    <img src="{{ item.src }}" />
                    <p>{{ item.title }}</p>
                </div>
            {{#  }); }}
        </div>
    </div>
    <div class="swiper-pagination"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</script>


<script>
    layui.use([ 'util', 'config', 'admin', 'laytpl' ], function() {
        var layer = layui.layer, element = layui.element, laytpl = layui.laytpl;
        var admin = layui.admin;


        $("#memorabilialist").height($(window).height() - 110)

        new Swiper('#memorabilialist .swiper-container', {
            slidesPerView: 'auto',
            loop: false,
            loopedSlides: 4,
            autoplay: false,
            direction : 'vertical',
            grabCursor: true,
            watchSlidesProgress: true,
            slideToClickedSlide: true,
            on: {
                click: function(e) {
                    console.info(e.target.dataset.id)
                }
            }
        })

        var data = {
            list: [
                {"src":"https://www.swiper.com.cn/demo/certify/images/certify01.png", "title":"非常难得又值钱的认证证书"},
                {"src":"https://www.swiper.com.cn/demo/certify/images/certify01.png", "title":"非常难得又值钱的认证证书"},
                {"src":"https://www.swiper.com.cn/demo/certify/images/certify01.png", "title":"非常难得又值钱的认证证书"},
                {"src":"https://www.swiper.com.cn/demo/certify/images/certify01.png", "title":"非常难得又值钱的认证证书"}
            ]
        }
        var memorabiliaView = document.getElementById('memorabilia');
        laytpl(memorabiliatpl.innerHTML).render(data, function(html){
            memorabiliaView.innerHTML = html;
            var mSwiper = new Swiper('#memorabilia .swiper-container', {
                watchSlidesProgress: true,
                slidesPerView: 'auto',
                loop: true,
                loopedSlides: 4,
                autoplay: true,
                // dynamicBullets: true,
                grabCursor: true,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable :true,
                    renderBullet: function (index, className) {
                        return '<span class="' + className + '">' + (index + 1) + '</span>';
                    },
                }
            })
        });

    })
</script>