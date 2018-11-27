<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">上级部门</label>
        <div class="layui-input-block">
            <select name="parentId" required lay-verify="required">
                <<<range .data>>>
                    <option value="<<<.id>>>"><<<.name>>></option>
                <<<end>>>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" placeholder="请输入部门名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门岗位</label>
        <div class="layui-input-block tags" id="tags">
            <input type="text" name="posts" id="inputTags" placeholder="按回车(Enter)添加更多" style="width: 97%;" autocomplete="off">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="button" lay-submit lay-filter="departmentaddform">提交</button>
        </div>
    </div>
</form>

<script>
layui.use(['layer', 'element', 'form', 'admin', 'inputTags'], function(){
    var form = layui.form, layer = layui.layer, element = layui.element;
    var admin = layui.admin;
    var inputTags = layui.inputTags;

    var inputTags = inputTags.render({
      elem:'#inputTags',
      content: [],
      aldaBtn: false
    });

    form.render('select');
    form.on('submit(departmentaddform)', function(data){
        data.field.posts = inputTags.config.content
        admin.req("/api/orgstructure/department/save", data.field, function(res) {
            console.info(data.field)
            if(res.code === 200) {
                admin.finishPopupCenter();
            } else {
                layer.msg(res.message)
            }
        }, "POST");
        return false;
    });
});
</script>