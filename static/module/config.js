layui.define(function(exports) {
	var config = {
		api: {
			logout: '/logout',
			sidenav: '/console/sidenav',
			header: '/console/header',

			user_info: '/api/user/info',
			user_menus: '/api/user/menus',
		},
		tableName : 'zhgd-table',
		autoRender : false,
		pageTabs : false
	};
	exports('config', config);
});
