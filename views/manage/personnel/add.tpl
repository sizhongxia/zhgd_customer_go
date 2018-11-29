
<form class="layui-form" lay-filter="worktypeaddform">
    <div class="layui-form-item">
        <label class="layui-form-label">人员姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" required  lay-verify="required" placeholder="请输入人员姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证号</label>
        <div class="layui-input-block">
            <input type="text" name="code" required  lay-verify="required" placeholder="请输入人员身份证号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">人员性别</label>
        <div class="layui-input-block">
            <select name="sex" required  lay-verify="required">
                <option value="">请选择一个人员性别</option>
                <<<range .sexs.data>>>
                    <option value="<<<.value>>>"><<<.key>>></option>
                <<<end>>>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-block">
            <input type="text" name="birthday" id="birthday" required lay-verify="required" placeholder="请选择人员出生日期" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">人员年龄</label>
        <div class="layui-input-block">
            <input type="number" name="age" min="16" max="120" required  lay-verify="required" placeholder="请输入人员年龄" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">人员籍贯</label>
        <div class="layui-input-inline" style="width: 164px;">
        <select name="birthplace1">
            <option value="">请选择省</option>
            <option value="浙江" selected="">浙江省</option>
            <option value="你的工号">江西省</option>
            <option value="你最喜欢的老师">福建省</option>
        </select>
        </div>
        <div class="layui-input-inline" style="width: 164px;">
        <select name="birthplace2">
            <option value="">请选择市</option>
            <option value="杭州">杭州</option>
            <option value="宁波" disabled="">宁波</option>
            <option value="温州">温州</option>
            <option value="温州">台州</option>
            <option value="温州">绍兴</option>
        </select>
        </div>
        <div class="layui-input-inline" style="width: 165px;margin-right: 0px;">
        <select name="birthplace3">
            <option value="">请选择县/区</option>
            <option value="西湖区">西湖区</option>
            <option value="余杭区">余杭区</option>
            <option value="拱墅区">临安市</option>
        </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属民族</label>
        <div class="layui-input-inline">
            <select name="nation" required lay-search lay-verify="required">
                <option value="">请选择人员所属民族</option>
                <<<range .nations.data>>>
                    <option value="<<<.value>>>"><<<.key>>></option>
                <<<end>>>
            </select>
        </div>
        <div class="layui-form-mid layui-word-aux">* 可输入民族文字检索</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">家庭住址</label>
        <div class="layui-input-block">
            <input type="text" name="homeAddress" required  lay-verify="required" placeholder="请输入人员家庭住址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-block">
            <input type="text" name="telephone" required  lay-verify="required" placeholder="请输入人员联系电话" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户身份</label>
        <div class="layui-input-block">
            <select name="type" required  lay-verify="required" lay-filter="select-personnel-type">
                <option value="1">管理人员</option>
                <option value="2">劳务人员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属公司</label>
        <div class="layui-input-block">
            <select name="companyUuid" required  lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item isWorker">
        <label class="layui-form-label">所属班组</label>
        <div class="layui-input-block">
            <select name="groupUuid" required  lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item isWorker">
        <label class="layui-form-label">是班组长</label>
        <div class="layui-input-block">
            <select name="isGroupLeader" required  lay-verify="required">
                <option value="0">否</option>
                <option value="1">是</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item isWorker">
        <label class="layui-form-label">所属工种</label>
        <div class="layui-input-block">
            <select name="workType" required  lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item isManager">
        <label class="layui-form-label">所属部门</label>
        <div class="layui-input-block">
            <select name="deptUuid" required  lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item isManager">
        <label class="layui-form-label">所属岗位</label>
        <div class="layui-input-block">
            <select name="post" required  lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="personneaddformsubmit">提交</button>
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

    form.on('select(select-personnel-type)', function(data){
        if(data.value == "2") {
            $(".isWorker").show();
            $(".isManager").hide();
        } else {
            $(".isWorker").hide();
            $(".isManager").show();
        }
    });
    // 默认隐藏工人选项
    $(".isWorker").hide();

    form.on('submit(personneaddformsubmit)', function(data){
        console.info(data)
        return false;
    });
});
</script>