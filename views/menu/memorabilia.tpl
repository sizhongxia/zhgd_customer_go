<style>
    .memorabilia-left {
        width: 4.4rem;
        height: 100%;
        float: left;
        overflow-y: auto;
        overflow-x: hidden;
        background: rgba(0, 0, 0, 0.02);
    }

    .layui-timeline-title {
        padding-right: 20px
    }

    .memorabilia-title-date {
        float: left;
        width: 1.2rem;
        font-size: 0.22rem;
        text-align: right;
        font-weight: 400;
        margin-left: -1.4rem;
        color: #1e9fff;
        margin-top: -0.2rem;
    }

    .memorabilia-title-year {
        font-size: 0.13rem;
        font-weight: normal
    }

    .memorabilia-content {
        margin-left: 4.4rem;
        height: 100%;
        display: -webkit-flex;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .layui-timeline-title p {
        font-size: 0.14rem;
        margin-bottom: 10px;
        color: #2d3b4c;
    }

    .picswiper {
        width: 100%;
        height: 100%;
    }

    .picswiper .swiper-slide {
        text-align: center;
        font-size: 18px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }

    .contentswiper {
        width: 100%;
        height: 100%;
    }

    .contentswiper .swiper-slide {
        font-size: 0.16rem;
        height: auto;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0px 60px;
    }
</style>
<div id="console-box">
    <div class="memorabilia-left">
        <ul class="layui-timeline" style="padding-left: 1.5rem;padding-top: 0.3rem;" id="timelinelist"></ul>
    </div>
    <div class="memorabilia-content" id="timelinecontent"></div>
</div>

<script id="timelineitemtpl" type="text/html">
    {{#  layui.each(d.data, function(index, item){ }}
        <li class="layui-timeline-item">
            <i class="layui-icon {{index==0?'layui-icon-note':'layui-icon-tips'}} layui-timeline-axis"></i>
            <div class="memorabilia-title-date">
                {{item.day}}<br><span class="memorabilia-title-year">{{item.years}}</span>
            </div>
            <div class="layui-timeline-content layui-text">
                <div class="layui-timeline-title">
                    <p>{{item.title}}</p>
                    <img data-id="{{item.id}}" style="width:2rem;height:1.43333rem;cursor: pointer;" src="{{item.picUrl}}">
                </div>
            </div>
        </li>
    {{#  }); }}
</script>

<script id="timelinecontenttpl" type="text/html">
    <div style="flex: 1;width: 100%;overflow: hidden;">
        <div class="swiper-container picswiper">
            <div class="swiper-wrapper">
                {{#  layui.each(d.data.pics, function(index, item){ }}
                <div class="swiper-slide"><img src="{{item}}"></div>
                {{#  }); }}
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div style="width: 100%;height: .2rem;overflow: hidden;"></div>
    <div style="width: 100%;height: 2.26rem;overflow: hidden;">
        <!-- Swiper -->
        <div class="swiper-container contentswiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <h3 style="width: 100%;height: 0.36rem;line-height: 0.36rem;font-size: 0.22rem;color: #27a3ff;font-weight: bold;">【{{d.data.happentime}}】 {{d.data.title}}</h3>
                    <p style="text-indent: 2em;line-height: .28rem;text-align: justify;">{{d.data.content}}</p>
                </div>
            </div>
            <!-- Add Scroll Bar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>
    <div style="width: 100%;height: .2rem;overflow: hidden;"></div>
</script>

<script>
    layui.use(['util', 'config', 'admin', 'laytpl'], function () {
        var config = layui.config;
        var layer = layui.layer;
        var util = layui.util;
        var admin = layui.admin;
        var laytpl = layui.laytpl;

        admin.req("/api/memorabilia/list", {}, function(res) {
            if(res.code == 200) {
                var view = document.getElementById('timelinelist');
                laytpl(timelineitemtpl.innerHTML).render(res, function(html){
                    view.innerHTML = html;
                })
                if(res.data.length > 0) {
                    loadDetail(res.data[0].id)
                }
            } else {
                layer.msg(res.message)
            }
        }, "POST")


        $(".memorabilia-left").niceScroll({
            cursorcolor: "#ddd",
            cursorborder: "1px solid #ddd"
        });

        function initHeight() {
            var windowHeight = window.innerHeight;
            $('#console-box').css('height', windowHeight - 80 + "px");
        }
        initHeight()
        $(window).resize(initHeight)

        function loadDetail(id) {
            admin.req("/api/memorabilia/detail", {id:id}, function(res) {
                if(res.code == 200) {
                    var view = document.getElementById('timelinecontent');
                    laytpl(timelinecontenttpl.innerHTML).render(res, function(html){
                        view.innerHTML = html;
                        new Swiper('.picswiper', {
                            //effect: 'fade',
                            loop : true,
                            pagination: {
                                el: '.picswiper .swiper-pagination',
                                //type: 'fraction',
                                dynamicBullets: true,
                            },
                            autoplay: {
                                delay: 2500,
                                disableOnInteraction: false,
                            },
                        });
                        new Swiper('.contentswiper', {
                            direction: 'vertical',
                            slidesPerView: 'auto',
                            freeMode: true,
                            scrollbar: {
                                el: '.contentswiper .swiper-scrollbar',
                            },
                            mousewheel: true,
                        });
                    })
                } else {
                    layer.msg(res.message)
                }
            }, "POST")
        }

        $("#timelinelist").on('click', 'img', function() {
            loadDetail($(this).data("id"))
        })
    });
</script>