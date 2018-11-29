<div class="layui-row layui-col-space15">
    <div class="layui-col-xs12" id="video">
    </div>
</div>

<script>
layui.use(['layer', 'element', 'ckplayer', 'admin'], function(){
    var ckplayer = layui.ckplayer, layer = layui.layer, element = layui.element;
    var admin = layui.admin;

    var videoObject = {
        container: '#video',
        loop: false,
        autoplay: false,
        video: [
            ['http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', 'video/mp4']
        ]
    };
    var player = new ckplayer(videoObject);
  
});
</script>