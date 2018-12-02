<div class="layui-row layui-col-space15">
    <div class="layui-col-xs12">
        <div class="layui-card">
            <div class="layui-card-header">
                人员(身份)管理
                <button id="create_personnel_btn" class="layui-btn layui-btn-radius layui-btn-primary" style="float:right;margin:4px;">新增人员</button>
            </div>
            <div class="layui-card-body">



                <table class="layui-table" lay-filter="personneltable">
                    <thead>
                        <tr>
                            <th lay-data="{field:'id', hide: true}"></th>
                            <th lay-data="{type:'numbers'}"></th>
                            <th lay-data="{field:'empNo', width:190}">人员编号</th>
                            <th lay-data="{field:'name', width:180}">姓名</th>
                            <th lay-data="{field:'type', width:100}">身份类型</th>
                            <th lay-data="{field:'code', width:200}">身份证号</th>
                            <th lay-data="{field:'telephone', width:160}">联系方式</th>
                            <th lay-data="{field:'nation', width:90}">民族</th>
                            <th lay-data="{field:'sex', width:80}">性别</th>
                            <th lay-data="{field:'age', width:80}">年龄</th>
                            <th lay-data="{field:'homeAddress', width:380}">家庭住址</th>
                            <th lay-data="{field:'option',width:320, align:'center'}"></th>
                        </tr> 
                    </thead>
                    <tbody>
                        {{#  if(d.data.length > 0){ }}
                            {{#  layui.each(d.data, function(index, item){ }}
                                <tr>
                                    <td>{{ item.id }}</td>
                                    <td></td>
                                    <td>{{ item.empNo }}</td>
                                    <td>{{ item.name }}</td>
                                    <td>{{ item.type }}</td>
                                    <td>{{ item.code }}</td>
                                    <td>{{ item.telephone }}</td>
                                    <td>{{ item.nation }}</td>
                                    <td>{{ item.sex }}</td>
                                    <td>{{ item.age }}</td>
                                    <td>{{ item.homeAddress }}</td>
                                    <td>
                                        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改基本信息</a>
                                        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="editBirthPlace">修改籍贯</a>
                                        <a class="layui-btn layui-btn-info layui-btn-xs" lay-event="personnelPhoto">头像</a>
                                        <a class="layui-btn layui-btn-xs" lay-event="detail">详细</a>
                                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
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