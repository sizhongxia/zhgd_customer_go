<div class="layui-row layui-col-space15">
    <div class="layui-col-xs12">
        <button type="button" class="layui-btn" id="upload-btn">
            <i class="layui-icon">&#xe67c;</i>上传/更新人员头像
        </button>
        <img class="layui-upload-img" id="upload-img-box" src="<<<.photo.data.photo>>>" style="width:140px;height:200px;margin:18px auto;display: block;">
        <p id="upload-errinfo" style="text-align: center;"></p>
    </div>
</div>
<script>
layui.use(['layer', 'element', 'upload', 'admin'], function(){
    var layer = layui.layer, element = layui.element;
    var admin = layui.admin;
    var upload = layui.upload;
    
    var uploading = null

    var uploadInst = upload.render({
        elem: '#upload-btn',
        url: '/upload/personnel/photo',
        data: {
            id: function(){
                return "<<<.photo.data.id>>>";
            }
        },
        accept: 'images',
        exts: 'jpg|png|jpeg',
        size: 1024 * 2,
        multiple: false,
        field: 'file',
        before: function(obj){
            uploading = layer.load(2)
            obj.preview(function(index, file, result){
                $('#upload-img-box').attr('src', result);
            });
        },
        done: function(res){
            if(uploading) {
                layer.close(uploading)
            }
            //如果上传失败
            if(res.code < 0){
                return layer.msg('上传失败');
            }
            //上传成功
            return layer.msg('上传成功');
        },
        error: function(){
            if(uploading) {
                layer.close(uploading)
            }
            var demoText = $('#upload-errinfo');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a href="javascript:;" class="layui-btn-mini upload-reload">重试</a>');
            demoText.find('.upload-reload').on('click', function(){
                uploadInst.upload();
            });
        }
    });
    
});
</script>