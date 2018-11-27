
<style>
    .layui-elem-quote {border-left: 5px solid #002a31;}
</style>
<blockquote class="layui-elem-quote">
当前分包商：<<< .data.data.name >>>
</blockquote>
<form class="layui-form" style="text-align: center;">
    <input type="hidden" name="companyId" value="<<< .data.data.id >>>"/>
    <div class="layui-inline">
        <div class="layui-input-inline" style="width: 439px;">
            <input type="text" name="name" placeholder="输入新班组名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-inline">
        <button class="layui-btn" lay-submit lay-filter="laborsubcontractorgroupsform" style="height: 36px;">新增</button>
    </div>
</form>

<table class="layui-table" lay-filter="laborsubcontractorgroupstable">
    <thead>
        <tr>
            <th lay-data="{field:'id', hide: true}"></th>
            <th lay-data="{field:'companyId', hide: true}"></th>
            <th lay-data="{field:'name', edit:'text'}">名称 (注：点击名称可进行修改)</th>
            <th lay-data="{field:'option',width:90, align:'center'}"></th>
        </tr> 
    </thead>
    <tbody>
        <<<range .data.data.groups>>>
            <tr>
                <td><<<.id>>></td>
                <td><<<$.data.data.id>>></td>
                <td><<<.name>>></td>
                <td>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </td>
            </tr>
        <<<end>>>
    </tbody>
</table>

<script>
layui.use(['layer', 'element', 'form', 'admin', 'table'], function(){
    var form = layui.form, layer = layui.layer, element = layui.element;
    var admin = layui.admin;
    var table = layui.table;

    form.on('submit(laborsubcontractorgroupsform)', function(data){
        admin.req("/api/orgstructure/group/save", data.field, function(res) {
            if(res.code === 200) {
                admin.finishPopupCenter();
            } else {
                layer.msg(res.message)
            }
        }, "POST");
        return false;
    });

    table.init('laborsubcontractorgroupstable');

    table.on('edit(laborsubcontractorgroupstable)', function(obj){
        var data = obj.data;
        admin.req("/api/orgstructure/group/update", {id: data.id, companyId: data.companyId, name: obj.value}, function(res) {
            if(res.code === 200) {
                admin.finishPopupCenter();
            } else {
                layer.msg(res.message);
            }
        }, "POST");
    });

    table.on('tool(laborsubcontractorgroupstable)', function(obj){
        var data = obj.data;
        var layEvent = obj.event;
        if(layEvent === 'del'){
            layer.confirm('是否要删除当前班组？', {title:'删除提示'}, function(index){
                layer.close(index);
                admin.req("/api/orgstructure/group/delete", {id: data.id}, function(res) {
                    if(res.code === 200) {
                        admin.finishPopupCenter();
                    } else {
                        layer.msg(res.message);
                    }
                }, "POST");
            });
        }
    });

});
</script>