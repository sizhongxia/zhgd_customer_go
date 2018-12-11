<style>
    .layadmin-cmdlist-fluid{padding-bottom:60px}
    .cmdlist-container{background:#fff;border:1px solid #eee;width:290px;height:180px;float:left;margin: 10px 24px 10px 0;}
    .cmdlist-container:hover{border:1px solid #00242a}
    .cmdlist-container img{width:100%;height:180px}
    .cmdlist-container-title {width:100%;line-height:22px;height: 44px;overflow: hidden;}
</style>
<div class="layui-fluid layadmin-cmdlist-fluid">
    <button type="button" class="layui-btn" id="upload-btn">
        <i class="layui-icon">&#xe67c;</i>上传图片
    </button>
    <div class="layui-row layui-col-space30">
        <div class="layui-col-xs12" id="memorabilia-pics"></div>
    </div>
</div>

<script id="pictplbox" type="text/html">
    {{#  layui.each(d.data, function(index, item){ }}
        <div class="cmdlist-container" data-id="{{item.id}}">
            <a href="javascript:;"><img src="{{item.src}}"/></a>
        </div>
    {{#  }); }}
    <div style="clean:both;"></div>
</script>

<script>
layui.use(['layer', 'element', 'upload', 'laytpl', 'admin'], function(){
    var upload = layui.upload, laytpl = layui.laytpl, layer = layui.layer, element = layui.element;
    var admin = layui.admin;
    
    var view = document.getElementById('memorabilia-pics');
    var rid = "<<<.id>>>";

    var loadPics = function() {
        admin.req("/api/memorabilia/pics", {id: rid}, function(res) {
            laytpl(pictplbox.innerHTML).render(res, function(html){
                view.innerHTML = html;
            })
        }, "POST");
    }
    loadPics();

    $("#memorabilia-pics").on("click", ".cmdlist-container", function(){
        var id = $(this).data("id");
        if(!!id) {
            admin.popupCenterLevel2({
                title : '修改',
                path : '/manage/memorabilia/editpic?id=' + id,
                finish : function() {
                    loadPics();
                }
            });
        }
    })

    var uploading = null
    var uploadInst = upload.render({
        elem: '#upload-btn',
        url: '/upload/memorabilia/pics',
        data: {
            id: rid
        },
        accept: 'images',
        exts: 'jpg|png|jpeg',
        size: 1024 * 2,
        multiple: true,
        field: 'file',
        before: function(obj){
            uploading = layer.load(2)
        },
        done: function(res){
            if(uploading) {
                layer.close(uploading)
            }
            //如果上传失败
            if(res.code < 0){
                return layer.msg('上传失败');
            }
            loadPics();
            //上传成功
            return layer.msg('上传成功');
        },
        error: function(){
            if(uploading) {
                layer.close(uploading)
            }
            layer.msg('请求失败');
        }
    });
});
</script>