<div class="layui-row layui-col-space15">
    <div class="layui-col-xs12">
        <div class="layui-card">
            <div class="layui-card-header">
                总包(施工)单位部门岗位设置
                <button id="create_department_btn" class="layui-btn layui-btn-radius layui-btn-primary" style="float:right;margin:4px;">新增部门</button>
            </div>
            <div class="layui-card-body">
				<table class="layui-table" id="manageorgstructuretable" lay-filter="manageorgstructuretable"></table>
            </div>
        </div>
    </div>
    <div class="layui-col-xs12">
        <div class="layui-card">
            <div class="layui-card-header">
                分包单位班组设置
            </div>
            <div class="layui-card-body">

                <table class="layui-table" lay-filter="laborsubcontractortable">
                    <thead>
                        <tr>
                            <th lay-data="{field:'id', hide: true}"></th>
                            <th lay-data="{field:'name', width:240}">名称</th>
                            <th lay-data="{field:'groups', width:420}">班组列表</th>
                            <th lay-data="{field:'option', width:160, align:'center'}"></th>
                        </tr> 
                    </thead>
                    <tbody>
                        {{#  if(d.data.laborsubcontractors.length > 0){ }}
                            {{#  layui.each(d.data.laborsubcontractors, function(index, item){ }}
                                <tr>
                                    <td>{{ item.id }}</td>
                                    <td>{{ item.name }}</td>
                                    <td>
                                        {{#  if(item.groups.length > 0){ }}
                                            {{#  layui.each(item.groups, function(index2, item2){ }}
                                                {{#  if(index2 == 0){ }}
                                                    {{ item2.name }}
                                                {{#  } else { }}
                                                    , {{ item2.name }}
                                                {{# } }}
                                            {{# }); }}
                                        {{#  } }} 
                                    </td>
                                    <td>
                                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                                    </td>
                                </tr>
                            {{#  }); }}
                        {{#  } }}
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>