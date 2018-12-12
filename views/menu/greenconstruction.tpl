<div id="console-box">
</div>


<script>
    layui.use(['util', 'config', 'admin', 'carousel'], function () {
        var config = layui.config;
        var layer = layui.layer;
        var util = layui.util;
        var admin = layui.admin;
        var carousel = layui.carousel;



        // var doResizeTimer = false;
        function initHeight() {
            var rate = 100 / 1920;
            var consoleBoxWidth = $('#console-box').width();
            console.info(consoleBoxWidth)
            var remw;
            if (consoleBoxWidth <= 1000) {
                remw = 1000 * rate;
            } else {
                remw = consoleBoxWidth * rate;
            }
            $('html').css('font-size', remw + "px");

            var windowHeight = window.innerHeight;
            $('#console-box').css('height', windowHeight - 80 + "px");

            // if (doResizeTimer) {
            //     window.clearTimeout(doResizeTimer);
            // }
            // doResizeTimer = window.setTimeout(function () {
            //     initWorktypeStatistics();
            //     initBaseCensuss();
            // }, 800);
        }

        initHeight()

        $("#console-box").resize(function () {
            initHeight();
        });




        // function initHeight() {
        //     var windowHeight = window.innerHeight;
        //     $('#console-box').css('height', windowHeight - 80 + "px");
        // }
        // initHeight()
        // $(window).resize(initHeight)


    });
</script>