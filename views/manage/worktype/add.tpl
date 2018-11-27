
<form class="layui-form" lay-filter="worktypeaddform">
    <div class="layui-form-item">
        <label class="layui-form-label">工种名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required  lay-verify="required" placeholder="请输入工种名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="worktypeaddformsubmit">提交</button>
        </div>
    </div>
</form>

<script>
layui.use(['layer', 'element', 'form', 'admin'], function(){
    var form = layui.form, layer = layui.layer, element = layui.element;
    var admin = layui.admin;
    form.on('submit(worktypeaddformsubmit)', function(data){
        admin.req("/api/worktype/save", data.field, function(res) {
            if(res.code === 200) {
                admin.finishPopupCenter(true);
                form.val("worktypeaddform", {"name": ""})
                layer.msg("保存成功")
            } else {
                layer.msg(res.message)
            }
        }, "POST");
        return false;
    });
});
</script>