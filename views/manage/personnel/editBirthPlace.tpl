
<form class="layui-form" lay-filter="worktypeaddform">
    <input type="hidden" name="id" value="<<<.id>>>"/>
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
        <div class="layui-input-block">
            <button class="layui-btn" type="button" lay-submit lay-filter="personneeditformsubmit">提交</button>
        </div>
    </div>
</form>

<script>
layui.use(['layer', 'element', 'form', 'admin'], function(){
    var form = layui.form, layer = layui.layer, element = layui.element;
    var admin = layui.admin;
    
    form.render('select')

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

    form.on('submit(personneeditformsubmit)', function(data){
        admin.req("/api/personnel/updateBirthPlace", data.field, function(res) {
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