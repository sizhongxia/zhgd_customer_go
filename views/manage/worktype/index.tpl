
<div class="layui-card">
    <div class="layui-card-header">
        工种管理
        <button id="create_worktype_btn" class="layui-btn layui-btn-radius layui-btn-primary" style="float:right;margin:4px;">新增工种</button>
    </div>
    <div class="layui-card-body">

        <table class="layui-table" lay-filter="worktypetable">
            <thead>
                <tr>
                    <th lay-data="{field:'id', hide: true}"></th>
                    <th lay-data="{field:'type', hide: true}"></th>
                    <th lay-data="{field:'name'}">名称</th>
                    <th lay-data="{field:'typeName', width:100}">系统</th>
                    <th lay-data="{field:'option',width:160, align:'center'}"></th>
                </tr> 
            </thead>
            <tbody>
                {{#  if(d.data.length > 0){ }}
                    {{#  layui.each(d.data, function(index, item){ }}
                        <tr>
                            <td>{{ item.id }}</td>
                            <td>{{ item.type }}</td>
                            <td>{{ item.name }}</td>
                            <td>{{ item.type === 0 ? "是" : "否" }}</td>
                            <td>
                                {{#  if(item.type != 0 ){ }}
                                    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                                {{#  } }} 
                            </td>
                        </tr>
                    {{#  }); }}
                {{#  } }}
            </tbody>
        </table>

    </div>
</div>