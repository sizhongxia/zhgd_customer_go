layui.define(['config', 'admin', 'layer', 'laytpl', 'element', 'form'], function (exports) {
    var $ = layui.$;
    var config = layui.config;
    var admin = layui.admin;
    var layer = layui.layer;
    var laytpl = layui.laytpl;
    var element = layui.element;
    var form = layui.form;

    var index = {
        // 渲染左侧导航栏
        initLeftNav: function () {
            layer.load(2);
            admin.req(config.api.user_menus, {}, function (data) {
                layer.closeAll('loading');
                if (data.code === 200) {
                    let menus = data.data;
                    for (var i = menus.length - 1; i >= 0; i--) {
                        var tempMenu = menus[i];
                        if (!tempMenu.subMenus) {
                            continue;
                        }
                        for (var j = tempMenu.subMenus.length - 1; j >= 0; j--) {
                            var jMenus = tempMenu.subMenus[j];
                            if (jMenus.auth) {
                                tempMenu.subMenus.splice(j, 1);
                                continue;
                            }
                        }
                    }

                    // 去除空的目录
                    for (var i = menus.length - 1; i >= 0; i--) {
                        var tempMenu = menus[i];
                        if (tempMenu.subMenus && tempMenu.subMenus.length <= 0) {
                            menus.splice(i, 1);
                            continue;
                        }
                    }

                    // 渲染
                    $('.layui-layout-admin .layui-side').load(config.api.sidenav, function () {
                        laytpl(sideNav.innerHTML).render(menus, function (html) {
                            $('#sideNav').after(html);
                        });
                        element.render('nav');
                        admin.activeNav(Q.lash);
                    });

                    index.initRouter(menus);

                } else {
                    location.replace(config.api.notauth);
                }
            }, "POST");
        },
        // 路由注册
        initRouter: function (menus) {
            index.regRouter(menus);
            Q.init({
                index: 'dataview'
            });
        },
        // 使用递归循环注册
        regRouter: function (menus) {
            $.each(menus, function (i, data) {
                if (data.url && data.url.indexOf('#!') == 0) {
                    Q.reg(data.url.substring(2), function () {
                        var menuId = data.url.substring(2);
                        index.loadView(menuId, data.path, data.name);
                    });
                }
                // if (data.subMenus) {
                //     index.regRouter(data.subMenus);
                // }
            });

            // Q.reg("rolemenu", function (roleId) {
            //     index.loadView("rolemenu", "role/menu?roleId=" + roleId, "角色菜单授权");
            //     admin.activeNav('role');
            // });

        },
        // 路由加载组件
        loadView: function (menuId, menuPath, menuName) {
            var contentDom = '.layui-layout-admin .layui-body';
            admin.showLoading('.layui-layout-admin .layui-body');
            var flag;  // 选项卡是否添加
            if (!flag || admin.isRefresh) {
                $(contentDom).load(menuPath, function () {
                    admin.isRefresh = false;
                    element.render('breadcrumb');
                    form.render('select');
                    admin.removeLoading('.layui-layout-admin .layui-body');
                });
            } else {
                admin.removeLoading('.layui-layout-admin .layui-body');
            }
            admin.activeNav(Q.lash);
            // 移动设备切换页面隐藏侧导航
            // if (document.body.clientWidth <= 750) {
            //     admin.flexible(true);
            // }
            admin.flexible(true);
        },
        // 从服务器获取登录用户的信息
        getUser: function (success) {
            layer.load(2);
            admin.req(config.api.user_info, {}, function (data) {
                layer.closeAll('loading');
                success(data);
            }, 'POST');
        },
        // 页面元素绑定事件监听
        bindEvent: function () {
            // 退出登录
            $('#btnLogout').click(function () {
                layer.confirm('是否要退出当前系统？', { title: '退出提示' }, function () {
                    location.replace(config.api.logout);
                });
            });
            // 修改密码
            $('#setPsw').click(function () {
                admin.popupRight(config.api.reset_psw);
            });
            // 个人信息
            $('#setInfo').click(function () {
                admin.popupRight(config.api.personal);
            });
            // 消息
            //$('#btnMessage').click(function () {
            //    admin.popupRight('statics/components/tpl/message.html');
            //});
        },
        // 打开新页面
        openNewTab: function (param) {
            var url = param.url;
            var title = param.title;
            var menuId = param.menuId;
            if (!menuId) {
                menuId = url.replace(/[?:=&/]/g, '_');
            }

            Q.reg(menuId, function () {
                index.loadView(menuId, url, title);
            });

            Q.go(menuId);
        },
        // 关闭选项卡
        closeTab: function (menuId) {
            element.tabDelete('admin-pagetabs', menuId);
        }
    };

    // tab选项卡切换监听
    element.on('tab(admin-pagetabs)', function (data) {
        var layId = $(this).attr('lay-id');
        Q.go(layId);
    });

    // function initFontSize() {
    //     var rate = 100 / 1920;
    //     var rateh = 100 / 1080;
    //     var windowWidth = window.innerWidth;
    //     var windowHeight = window.innerHeight;
    //     var remw, remh;
    //     if (windowWidth <= 1280) {
    //         remw = 1280 * rate;
    //     } else {
    //         remw = windowWidth * rate;
    //     }
    //     $('html').css('font-size', remw + "px");
    // }

    // initFontSize()
    // $(window).resize(initFontSize)


    exports('index', index);
});
