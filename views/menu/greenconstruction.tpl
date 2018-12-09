<div id="console-box">
</div>


<script>
    layui.use([ 'util', 'config', 'admin', 'carousel' ], function() {
		var config = layui.config;
		var layer = layui.layer;
		var util = layui.util;
		var admin = layui.admin;
        var carousel = layui.carousel;


        
        function initHeight() {
            var windowHeight = window.innerHeight;
            $('#console-box').css('height', windowHeight - 80 + "px");
        }
        initHeight()
        $(window).resize(initHeight)


	});
</script>