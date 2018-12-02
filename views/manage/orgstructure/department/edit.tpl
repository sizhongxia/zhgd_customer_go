<form class="layui-form">
    <input type="hidden" name="id" value="<<< .data.id >>>"/>
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" value="<<< .data.name >>>" placeholder="请输入部门名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门岗位</label>
        <div class="layui-input-block tags" id="tags">
            <input type="text" name="posts" id="inputTags" placeholder="输入后按回车(Enter)进行添加..." style="width: 97%;" autocomplete="off">
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
      content: [
        <<<if .data.posts>>>
            <<<range .data.posts>>>
                '<<<.>>>',
            <<<end>>>
        <<<end>>>
      ],
      aldaBtn: false
    });

    form.render('select');
    form.on('submit(departmentaddform)', function(data){
        data.field.posts = inputTags.config.content
        admin.req("/api/orgstructure/department/update", data.field, function(res) {
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