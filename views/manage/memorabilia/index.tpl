<div class="layui-card">
    <div class="layui-card-header">
        项目大事记
        <button id="create_memorabilia_btn" class="layui-btn layui-btn-radius layui-btn-primary" style="float:right;margin:4px;">新增</button>
    </div>
    <div class="layui-card-body">
        <table class="layui-table" lay-filter="memorabiliatable">
            <thead>
                <tr>
                    <th lay-data="{field:'id', hide: true}"></th>
                    <th lay-data="{field:'happentime', width:200}">时间</th>
                    <th lay-data="{field:'title'}">标题</th>
                    <th lay-data="{field:'addtime', width:160}">添加时间</th>
                    <th lay-data="{field:'updatetime', width:160}">修改时间</th>
                    <th lay-data="{field:'option',width:260, align:'center'}"></th>
                </tr> 
            </thead>
            <tbody>
                {{#  if(d.data.length > 0){ }}
                    {{#  layui.each(d.data, function(index, item){ }}
                        <tr>
                            <td>{{ item.id }}</td>
                            <td>{{ item.happentime }}</td>
                            <td>{{ item.title }}</td>
                            <td>{{ item.addtime }}</td>
                            <td>{{ item.updatetime }}</td>
                            <td>
                                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                                <a class="layui-btn layui-btn-xs" lay-event="pics">图册</a>
                                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
                            </td>
                        </tr>
                    {{#  }); }}
                {{#  } }}
            </tbody>
        </table>
    </div>
</div>