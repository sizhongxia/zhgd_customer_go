
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
            <select name="birthplace1" lay-search lay-filter="select-personnel-birthplace-province">
                <option value="">请选择省</option>
                <<<range .provinces.data>>>
                    <option value="<<<.value>>>"><<<.key>>></option>
                <<<end>>>
            </select>
        </div>
        <div class="layui-input-inline" style="width: 164px;">
            <select name="birthplace2" id="birthplace2" lay-search lay-filter="select-personnel-birthplace-city"></select>
        </div>
        <div class="layui-input-inline" style="width: 165px;margin-right: 0px;">
            <select name="birthplace3" id="birthplace3" lay-search></select>
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
            <select name="personnelType" required id="personnelType" lay-verify="required" lay-filter="select-personnel-type">
                <option value="">请选择一个用户身份</option>
                <option value="1">管理人员</option>
                <option value="2">劳务人员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属公司</label>
        <div class="layui-input-block">
            <select name="companyUuid" id="companyUuid" required lay-verify="required" lay-filter="select-personnel-company">
            </select>
        </div>
    </div>
    <div class="layui-form-item isWorker">
        <label class="layui-form-label">所属班组</label>
        <div class="layui-input-block">
            <select name="groupUuid" id="groupUuid">
            </select>
        </div>
    </div>
    <div class="layui-form-item isWorker">
        <label class="layui-form-label">是班组长</label>
        <div class="layui-input-block">
            <select name="isGroupLeader">
                <option value="0">否</option>
                <option value="1">是</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item isWorker">
        <label class="layui-form-label">所属工种</label>
        <div class="layui-input-block">
            <select name="workType">
                <option value="">请选择人员所属工种</option>
                <<<range .worktypes.data>>>
                    <option value="<<<.value>>>"><<<.key>>></option>
                <<<end>>>
            </select>
        </div>
    </div>
    <div class="layui-form-item isManager">
        <label class="layui-form-label">所属部门</label>
        <div class="layui-input-block">
            <select name="deptUuid" lay-filter="select-personnel-dept">
                <option value="">请选择人员所属部门</option>
                <<<range .departments.data>>>
                    <option value="<<<.value>>>"><<<.key>>></option>
                <<<end>>>
            </select>
        </div>
    </div>
    <div class="layui-form-item isManager">
        <label class="layui-form-label">所属岗位</label>
        <div class="layui-input-block">
            <select name="post" id="personnelPost">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="button" lay-submit lay-filter="personneaddformsubmit">提交</button>
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

    form.on('select(select-personnel-birthplace-province)', function(data){

        $("#birthplace2").html("");
        $("#birthplace2").append($("<option>").val("").text("请选择市"));
        $("#birthplace3").html("");
        $("#birthplace3").append($("<option>").val("").text("请选择区/县"));

        admin.req("/api/area", {pcode: data.value}, function(res) {
            $.each(res.data, function(key, val) {
                let opt = $("<option>").val(val.value).text(val.key);
                $("#birthplace2").append(opt);
                form.render('select');
            });
        }, 'POST');
        
    });
    form.on('select(select-personnel-birthplace-city)', function(data){
        
        $("#birthplace3").html("");
        $("#birthplace3").append($("<option>").val("").text("请选择区/县"));

        admin.req("/api/area", {pcode: data.value}, function(res) {
            $.each(res.data, function(key, val) {
                let opt = $("<option>").val(val.value).text(val.key);
                $("#birthplace3").append(opt);
                form.render('select');
            });
        }, 'POST');

    });

    form.on('select(select-personnel-type)', function(data){
        $("#companyUuid").html("");
        $("#companyUuid").append($("<option>").val("").text("请选择人员所属公司"));
        form.render('select');

        if(data.value == "2") {
            admin.req("/api/project/laborsubcontractors", {}, function(res) {
                $.each(res.data, function(key, val) {
                    let opt = $("<option>").val(val.value).text(val.key);
                    $("#companyUuid").append(opt);
                    form.render('select');
                });
            }, 'POST');
            $(".isWorker").show();
            $(".isManager").hide();
        } else if (data.value == "1") {
            admin.req("/api/project/constructions", {}, function(res) {
                $.each(res.data, function(key, val) {
                    let opt = $("<option>").val(val.value).text(val.key);
                    $("#companyUuid").append(opt);
                    form.render('select');
                });
            }, 'POST');
            $(".isWorker").hide();
            $(".isManager").show();
        } else {
            $(".isWorker").hide();
            $(".isManager").hide();
        }
    });

    form.on('select(select-personnel-company)', function(data){
        
        var pt = $("#personnelType").val()
        if(pt == "1") {
            // 管理  部门>岗位
            // Not todo
        } else if (pt == "2") {
            // 劳务  班组
            $("#groupUuid").html("");
            $("#groupUuid").append($("<option>").val("").text("请选择人员所属班组"));
            admin.req("/api/project/groups", {companyId:data.value}, function(res) {
                $.each(res.data, function(key, val) {
                    let opt = $("<option>").val(val.value).text(val.key);
                    $("#groupUuid").append(opt);
                    form.render('select');
                });
            }, 'POST');
        } else {
            console.error('not found personnel type!!!');
        }

    });

    form.on('select(select-personnel-dept)', function(data){
        
        $("#personnelPost").html("");
        $("#personnelPost").append($("<option>").val("").text("请选择人员所属岗位"));

        admin.req("/api/project/posts", {deptUuid: data.value}, function(res) {
            $.each(res.data, function(key, val) {
                let opt = $("<option>").val(val.value).text(val.key);
                $("#personnelPost").append(opt);
                form.render('select');
            });
        }, 'POST');

    });


    // 默认隐藏身份信息选项
    $(".isWorker").hide();
    $(".isManager").hide();

    form.on('submit(personneaddformsubmit)', function(data){
        admin.req("/api/personnel/save", data.field, function(res) {
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