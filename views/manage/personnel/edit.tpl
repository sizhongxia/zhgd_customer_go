
<form class="layui-form" lay-filter="worktypeaddform">
    <input type="hidden" name="id" value="<<<.personnel.data.id>>>"/>
    <div class="layui-form-item">
        <label class="layui-form-label">人员姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" required value="<<<.personnel.data.name>>>" lay-verify="required" placeholder="请输入人员姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证号</label>
        <div class="layui-input-block">
            <input type="text" name="code" required value="<<<.personnel.data.code>>>" lay-verify="required" placeholder="请输入人员身份证号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">人员性别</label>
        <div class="layui-input-block">
            <select name="sex" required  lay-verify="required">
                <option value="">请选择一个人员性别</option>
                <<<range .sexs.data>>>
                    <option value="<<<.value>>>" <<<if eq .value $.personnel.data.sex>>>selected="selected"<<<end>>> ><<<.key>>></option>
                <<<end>>>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-block">
            <input type="text" name="birthday" value="<<<.personnel.data.birthday>>>" id="birthday" required lay-verify="required" placeholder="请选择人员出生日期" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">人员年龄</label>
        <div class="layui-input-block">
            <input type="number" name="age" value="<<<.personnel.data.age>>>" min="16" max="120" required  lay-verify="required" placeholder="请输入人员年龄" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属民族</label>
        <div class="layui-input-inline">
            <select name="nation" required lay-search lay-verify="required">
                <option value="">请选择人员所属民族</option>
                <<<range .nations.data>>>
                    <option value="<<<.value>>>" <<<if eq $.personnel.data.nation .value>>>selected="selected"<<<end>>> ><<<.key>>></option>
                <<<end>>>
            </select>
        </div>
        <div class="layui-form-mid layui-word-aux">* 可输入民族文字检索</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">家庭住址</label>
        <div class="layui-input-block">
            <input type="text" name="homeAddress" value="<<<.personnel.data.homeAddress>>>" required  lay-verify="required" placeholder="请输入人员家庭住址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-block">
            <input type="text" name="telephone" required value="<<<.personnel.data.telephone>>>" lay-verify="required" placeholder="请输入人员联系电话" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="button" lay-submit lay-filter="personneeditformsubmit">提交</button>
        </div>
    </div>
</form>

<script>
layui.use(['layer', 'element', 'form', 'laydate', 'admin'], function(){
    var form = layui.form, layer = layui.layer, element = layui.element, laydate = layui.laydate;
    var admin = layui.admin;
    
    form.render('select')
    laydate.render({
        elem: '#birthday'
    });

    form.on('submit(personneeditformsubmit)', function(data){
        admin.req("/api/personnel/update", data.field, function(res) {
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