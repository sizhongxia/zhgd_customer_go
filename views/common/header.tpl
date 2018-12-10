<div class="layui-logo">
    <<< .projectName >>>
</div>
<ul class="layui-nav layui-layout-left">
    <li class="layui-nav-item" lay-unselect>
        <a ew-event="flexible" title="侧边伸缩"><i class="layui-icon layui-icon-shrink-right"></i></a>
    </li>
    <li class="layui-nav-item" lay-unselect>
        <a ew-event="refresh" title="刷新"><i class="layui-icon layui-icon-refresh-3"></i></a>
    </li>
</ul>
<ul class="layui-nav layui-layout-right">
	<!-- 
    <li class="layui-nav-item" lay-unselect>
        <a id="btnMessage" title="消息"><i class="layui-icon layui-icon-notice"></i></a>
    </li>
     -->
    <li class="layui-nav-item layui-hide-xs" lay-unselect>
        <a ew-event="fullScreen" title="全屏"><i class="layui-icon layui-icon-screen-full"></i></a>
    </li>
    <li class="layui-nav-item" lay-unselect>
        <a>
            <cite>欢迎使用</cite>
        </a>
        <dl class="layui-nav-child">
            <dd lay-unselect>
                <a id="btnLogout">安全退出</a>
            </dd>
        </dl>
    </li>
</ul>