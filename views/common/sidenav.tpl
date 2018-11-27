<div class="layui-side-scroll">
    <ul class="layui-nav layui-nav-tree" style="margin-top: 15px;">
        <script id="sideNav" type="text/html">
            {{#  layui.each(d, function(index, item){ }}
            {{# if(!item.hidden){ }}
            <li class="layui-nav-item">
                <a href="{{item.url}}"><i class="layui-icon {{item.icon}}"></i>&emsp;<cite>{{ item.name }}</cite></a>
            </li>
            {{# } }}
            {{#  }); }}
        </script>
    </ul>
</div>