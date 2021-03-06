<form class="layui-form">
    
    <div class="layui-form-item">
        <label class="layui-form-label">大事记标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" required lay-verify="required" placeholder="请输入大事记标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发生时间</label>
        <div class="layui-input-block">
            <input type="text" name="happenTime" id="happenTime" required lay-verify="required" placeholder="请选择发生时间" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">大事记内容</label>
        <div class="layui-input-block">
            <textarea name="content" required lay-verify="required" placeholder="请输入大事记内容" class="layui-textarea" style="height:188px"></textarea>
        </div>
    </div> 
    
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="button" lay-submit lay-filter="memorabiliaaddform">提交</button>
        </div>
    </div>
</form>

<script>
layui.use(['layer', 'element', 'form', 'laydate', 'admin'], function(){
    var form = layui.form, laydate = layui.laydate, layer = layui.layer, element = layui.element;
    var admin = layui.admin;

    laydate.render({
        elem: '#happenTime'
    });

    form.on('submit(memorabiliaaddform)', function(data){
        admin.req("/api/memorabilia/save", data.field, function(res) {
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