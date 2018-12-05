<style>
    #memorabilia-content-pic {
        width: 100%;
        margin: auto;
        height: calc(100vh - 314px);
        overflow: hidden;
        margin-bottom: 8px;
        padding:0 10px;
    }

    #memorabilia-content-info {
        width: 100%;
        height: 220px;
        text-align: center;
        padding:0 12px;
    }
</style>

<div id="console-box" style="overflow:hidden;">
   <div id="memorabilia-aside">
        
    </div>
    <div id="memorabilia-content">
        <div id="memorabilia-content-pic">
            <div id="memorabilia"></div>
        </div>
        <div id="memorabilia-content-info">

        </div>
    </div>
</div>

<script id="memorabiliatpl" type="text/html">
    <div class="swiper-container">
        <div style="width:100%;height:46px;"></div>
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

        function initHeight() {
            $("#memorabilia-aside").height($(window).height() - 81)
            $("#memorabilia-content").height($(window).height() - 81)
        }

        initHeight();
        $(window).resize(initHeight);

        /*new Swiper('#memorabilialist .swiper-container', {
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
        })*/

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