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
                    <th lay-data="{field:'releasestate', width:90}">发布状态</th>
                    <th lay-data="{field:'onlinestate', width:90}">上线状态</th>
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
                            <td>
                                {{#  if(item.releasestate == 1){ }}
                                    <span class="layui-badge layui-bg-green">已发布</span>
                                {{# } else { }}
                                    <span class="layui-badge layui-bg-gray">未发布</span>
                                {{# } }}
                            </td>
                            <td>
                                {{#  if(item.releasestate == 1){ }}
                                    {{#  if(item.onlinestate == 1){ }}
                                        <span class="layui-badge layui-bg-green">上线</span>
                                    {{# } else { }}
                                        <span class="layui-badge layui-bg-gray">下线</span>
                                    {{# } }}
                                {{# } else { }}-{{# } }}
                            </td>
                            <td>{{ item.addtime }}</td>
                            <td>{{ item.updatetime }}</td>
                            <td>

                                {{#  if(item.releasestate == 1){ }}
                                    {{#  if(item.onlinestate == 1){ }}
                                        <a class="layui-btn layui-btn-xs" lay-event="outline">下线</a>
                                    {{# } else { }}
                                        <a class="layui-btn layui-btn-xs" lay-event="online">上线</a>
                                    {{# } }}
                                {{# } else { }}
                                    <a class="layui-btn layui-btn-xs" lay-event="release">发布</a>
                                {{# } }}

                                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                                <a class="layui-btn layui-btn-xs" lay-event="pics">图册</a>
                                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
                            </td>
                        </tr>
                    {{#  }); }}
                {{# } }}
            </tbody>
        </table>
    </div>
</div>