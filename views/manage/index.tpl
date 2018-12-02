<style>
.layui-tree li {line-height: 38px;}
</style>
<div class="layui-tab" lay-filter="smtype">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="project"><i class="layui-icon layui-icon-template-1"/> 项目信息</li>
        <li lay-id="account"><i class="layui-icon layui-icon-auz"/> 账号信息</li>
        <li lay-id="memorabilia"><i class="layui-icon layui-icon-tabs"/> 项目大事记</li>
        <li lay-id="personnel"><i class="layui-icon layui-icon-user"/> 人员管理</li>
        <li lay-id="orgstructure"><i class="layui-icon layui-icon-component"/> 组织架构</li>
        <li lay-id="worktype"><i class="layui-icon layui-icon-util"/> 工种管理</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show" id="view_m_project"></div>
        <div class="layui-tab-item" id="view_m_account"></div>
        <div class="layui-tab-item" id="view_m_memorabilia"></div>
        <div class="layui-tab-item" id="view_m_personnel"></div>
        <div class="layui-tab-item" id="view_m_orgstructure"></div>
        <div class="layui-tab-item" id="view_m_worktype"></div>
    </div>
</div>

<script type="text/javascript">
    layui.use(['layer', 'element', 'admin', 'util', 'laytpl', 'table', 'form', 'carousel', 'treetable'], function() {
	    var layer = layui.layer;
	    var admin = layui.admin;

	    var $ = layui.jquery, 
            element = layui.element, 
            util = layui.util,
            laytpl = layui.laytpl,
            form = layui.form,
            table = layui.table,
            device = layui.device,
            carousel = layui.carousel;

		var treetable = layui.treetable;

        var layid = location.hash.replace(/^#!sitemanage\?s/, '');
        if(layid === "#!sitemanage") {
            layid = "project";
        } else {
            element.tabChange('smtype', layid);
        }

        element.on('tab(smtype)', function(elem){
            location.hash = '#!sitemanage?s'+ $(this).attr('lay-id');
        });

        admin.reqTpl('/manage/' + layid, {}, function(result, status, xhr){
            var view = document.getElementById('view_m_' + layid);
            if(layid === "project") {
                laytpl(result).render({}, function(html){
                    view.innerHTML = html;
                    element.render()
                    carousel.render({
                        elem: '.layui-carousel',
                        width: '100%',
                        height: '60px',
                        arrow: 'none',
                        autoplay: true,
                        trigger: device.ios || device.android ? 'click' : 'hover',
                        anim: 'fade'
                    });

                })
            } else if(layid === "account") {
                laytpl(result).render({}, function(html){
                    view.innerHTML = html;
                    element.render()
                })
            } else if(layid === "memorabilia") {
                function init() {
                    admin.req("/api/memorabilia/data", {}, function(res) {
                        laytpl(result).render(res, function(html){
                            view.innerHTML = html;
                            element.render()

                            table.init('memorabiliatable', {
                                page: {
                                    limit: 20
                                }
                            });

                            table.on('tool(memorabiliatable)', function(obj){
                                var data = obj.data;
                                var layEvent = obj.event;
                                if(layEvent === 'edit'){ //编辑
                                    admin.popupCenter({
                                        title : '修改大事记',
                                        path : '/manage/memorabilia/edit?id=' + data.id,
                                        finish : function() {
                                            init();
                                        }
                                    });
                                } else if (layEvent === 'delete') {
                                    layer.confirm('删除是否要删除当前大事记记录？', {title:'删除提示'}, function(index){
                                        layer.close(index);
                                        admin.req("/api/memorabilia/delete", {id: data.id}, function(res) {
                                            if(res.code === 200) {
                                                init();
                                            } else {
                                                layer.msg(res.message);
                                            }
                                        }, "POST");
                                    });
                                }
                            });

                            $(document).on('click','#create_memorabilia_btn',function(){
                                admin.popupCenter({
                                    title : '新增事记',
                                    path : '/manage/memorabilia/add',
                                    finish : function() {
                                        init();
                                    }
                                });
                            });

                        })
                    }, "POST");
                }
                init();
            } else if(layid === "personnel") {
                
                function init() {
                    admin.req("/api/personnel/data", {}, function(res) {
                        laytpl(result).render(res, function(html){
                            view.innerHTML = html;
                            element.render()

                            table.init('personneltable', {
                                page: {
                                    limit: 20
                                }
                            });

                            table.on('tool(personneltable)', function(obj){
                                var data = obj.data;
                                var layEvent = obj.event;
                                if(layEvent === 'edit'){ //编辑
                                    admin.popupCenter({
                                        title : '修改人员基础信息',
                                        path : '/manage/personnel/edit?id=' + data.id,
                                        finish : function() {
                                            init();
                                        }
                                    });
                                } else if (layEvent === 'editBirthPlace') {
                                    admin.popupCenter({
                                        title : '变更人员籍贯信息',
                                        path : '/manage/personnel/editBirthPlace?id=' + data.id,
                                        finish : function() {
                                        }
                                    });
                                } else if (layEvent === 'personnelPhoto') {
                                    admin.popupCenter({
                                        title : '人员头像',
                                        path : '/manage/personnel/photo?id=' + data.id,
                                        finish : function() {
                                        }
                                    });
                                } else if (layEvent === 'detail') {
                                    admin.popupCenter({
                                        title : '详情',
                                        path : '/manage/personnel/detail?id=' + data.id,
                                        finish : function() {
                                        }
                                    });
                                } else if (layEvent === 'delete') {
                                    layer.confirm('删除是否要删除当前用户身份？', {title:'删除提示'}, function(index){
                                        layer.close(index);
                                        admin.req("/api/personnel/delete/identity", {id: data.id}, function(res) {
                                            if(res.code === 200) {
                                                init();
                                            } else {
                                                layer.msg(res.message);
                                            }
                                        }, "POST");
                                    });
                                }
                            });

                            $(document).on('click','#create_personnel_btn',function(){
                                admin.popupCenter({
                                    title : '新增人员',
                                    path : '/manage/personnel/add',
                                    finish : function() {
                                        init();
                                    }
                                });
                            });

                        })
                    }, "POST");
                }
                init();
            } else if(layid === "orgstructure") {

                function init() {
                    admin.req("/api/orgstructure/data", {}, function(res) {
                        laytpl(result).render(res, function(html){
                            view.innerHTML = html;
                            element.render()

                            treetable.render({
                                treeColIndex: 2,
                                treeSpid: 0,
                                treeIdName: 'id',
                                treePidName: 'pid',
                                treeDefaultClose: false,
                                treeLinkage: true,
                                elem: '#manageorgstructuretable',
                                url : '/api/orgstructure/treedata',
                                defaultToolbar: false,
                                method : 'POST',
                                cols: [[
                                    {title: 'id', field: 'id', hide: true},
                                    {type: 'numbers'},
                                    {title: '名称', width: 260,field: 'name'},
                                    {title: '岗位', width: 360, field: 'posts'},
                                    {title: '', align:'center', width: 160,templet: function(d){
                                        if(d.type != 'project') {
                                            return `
                                                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                                                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
                                            `;
                                        }
                                        return "";
                                    }},
                                ]],
                                done: function () {
                                }
                            });

                            table.on('tool(manageorgstructuretable)', function(obj){
                                var data = obj.data;
                                var layEvent = obj.event;
                                if(layEvent === 'edit'){ //编辑
                                    admin.popupCenter({
                                        title : '修改部门',
                                        path : '/manage/orgstructure/department/edit?id=' + data.id,
                                        finish : function() {
                                            init();
                                        }
                                    });
                                } else if (layEvent === 'delete') {
                                    layer.confirm('删除部门会同步删除部门下的所有岗位信息，是否要删除当前部门？', {title:'删除提示'}, function(index){
                                        layer.close(index);
                                        admin.req("/api/orgstructure/department/delete", {id: data.id}, function(res) {
                                            if(res.code === 200) {
                                                init();
                                            } else {
                                                layer.msg(res.message);
                                            }
                                        }, "POST");
                                    });
                                }
                            });

                            table.init('laborsubcontractortable', {
                                page: {}
                            });

                            table.on('tool(laborsubcontractortable)', function(obj){
                                var data = obj.data;
                                var layEvent = obj.event;
                                if(layEvent === 'edit'){ //编辑
                                    admin.popupCenter({
                                        title : '修改分包商班组',
                                        path : '/manage/orgstructure/group/edit?id=' + data.id,
                                        finish : function() {
                                            if(res.code === 200) {
                                                init();
                                            } else {
                                                layer.msg(res.message);
                                            }
                                        }
                                    });
                                }
                            });

                            $(document).on('click','#create_department_btn',function(){
                                admin.popupCenter({
                                    title : '新增部门',
                                    path : '/manage/orgstructure/department/add',
                                    finish : function() {
                                        init();
                                    }
                                });
                            });

                        });
                    }, "POST");
                }

                init();

            } else if (layid === "worktype") {

                function init() {
                    admin.req("/api/worktype/data", {}, function(res) {
                        laytpl(result).render(res, function(html){
                            view.innerHTML = html;
                            element.render();
                            table.init('worktypetable', {
                                page: {
                                    limit: 20
                                }
                            });
                            table.on('tool(worktypetable)', function(obj){
                                var data = obj.data;
                                var layEvent = obj.event;
                                if(data.type == 0) {
                                    layer.msg("系统项不允许操作");
                                    return;
                                }
                                if(layEvent === 'del'){
                                    layer.confirm('是否要删除当前工种？', {title:'删除提示'}, function(index){
                                        layer.close(index);
                                        admin.req("/api/worktype/delete", {id: data.id}, function(res) {
                                            if(res.code === 200) {
                                                init();
                                            } else {
                                                layer.msg(res.message);
                                            }
                                        }, "POST");
                                    });
                                } else if(layEvent === 'edit'){ //编辑
                                    admin.popupCenter({
                                        title : '修改工种',
                                        path : '/manage/worktype/edit?id=' + data.id,
                                        finish : function() {
                                            if(res.code === 200) {
                                                init();
                                            } else {
                                                layer.msg(res.message);
                                            }
                                        }
                                    });
                                }
                            });

                            $(document).on('click','#create_worktype_btn',function(){
                                admin.popupCenter({
                                    title : '新增工种',
                                    path : '/manage/worktype/add',
                                    finish : function() {
                                        init();
                                    }
                                });
                            });

                        });
                    }, "POST");
                }
                init();
                
            }


        });

    })
</script>