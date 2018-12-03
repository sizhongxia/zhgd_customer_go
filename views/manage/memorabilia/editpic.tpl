<form class="layui-form">
    <input type="hidden" name="id" value="<<<.pic.data.id>>>" />
    <div class="layui-form-item" style="text-align: center;">
        <img alt="<<<.pic.data.title>>>" src="<<<.pic.data.src>>>"/>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片序号</label>
        <div class="layui-input-block">
            <input type="number" name="sortnum" value="<<<.pic.data.sortnum>>>" required lay-verify="required" placeholder="请输入图片序号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" value="<<<.pic.data.title>>>" required lay-verify="required" placeholder="请输入图片标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <!--
    <div class="layui-form-item">
        <label class="layui-form-label">上传时间</label>
        <div class="layui-input-block">
            <input type="text" value="<<<.pic.data.addtime>>>" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">修改时间</label>
        <div class="layui-input-block">
            <input type="text" value="<<<.pic.data.updatetime>>>" readonly="readonly" class="layui-input">
        </div>
    </div>
    -->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-danger" type="button" lay-submit lay-filter="memorabiliadeletepicform">删除</button>
            <button class="layui-btn" type="button" lay-submit lay-filter="memorabiliaeditpicform" style="width:160px">提交</button>
        </div>
    </div>
</form>

<script>
layui.use(['layer', 'element', 'form', 'admin'], function(){
    var form = layui.form, layer = layui.layer, element = layui.element;
    var admin = layui.admin;

    var id = "<<<.pic.data.id>>>";

    form.on('submit(memorabiliaeditpicform)', function(data){
        admin.req("/api/memorabilia/updatepic", data.field, function(res) {
            if(res.code === 200) {
                admin.finishPopupCenterLevel2();
            } else {
                layer.msg(res.message)
            }
        }, "POST");
        return false;
    });
    form.on('submit(memorabiliadeletepicform)', function(data){
        layer.confirm('是否要删除当前图片记录？', {title:'删除提示'}, function(index){
            layer.close(index);
            admin.req("/api/memorabilia/deletePic", {id: id}, function(res) {
                if(res.code === 200) {
                    admin.finishPopupCenterLevel2();
                } else {
                    layer.msg(res.message);
                }
            }, "POST");
        });
        return false;
    });
    

});
</script>