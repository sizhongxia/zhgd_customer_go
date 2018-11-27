<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta charset="utf-8"/>
    <title>登录</title>
    <link rel="Shortcut Icon" href='/static/favicon.ico'>
    <link rel="bookmark" href="/static/favicon.ico" />
    <link rel="stylesheet" href="/static/libs/layui/css/layui.css?v=2.4.3"/>
    <link rel="stylesheet" href="/static/css/login.css" media="all">
    <script>
        if(self.location.href.indexOf("login") == -1) {
            self.location.href = "/login";
        } else if (self.location.hash != "") {
            self.location.href = "/login";
        }
    </script>
</head>

<body>
<div class="login-wrapper">
    <div class="login-header">YeeTong</div>
    <div class=" login-body">
        <div class="layui-card">
            <div class="layui-card-header">
                <i class="layui-icon layui-icon-engine"></i>&nbsp;&nbsp;登录
            </div>
            <div class="layui-card-body layui-form layui-form-pane">
                <form action="/loginaction" method="post">
                    <div class="layui-form-item" style="color:#d9534f;"><<< .errmsg >>></div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
                        <div class="layui-input-block">
                            <input name="UserName" type="text" lay-verify="required" placeholder="账号" class="layui-input" autocomplete="off">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                        <div class="layui-input-block">
                            <input name="Password" type="password" lay-verify="required" placeholder="密码" class="layui-input" autocomplete="off">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button lay-filter="login-submit" class="layui-btn layui-btn-fluid" lay-submit>登 录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/static/libs/layui/layui.js?v=2.4.3"></script>
<script>
    layui.config({
        base: '/static/module/'
    }).use(['layer', 'form'], function () {
        layui.form.on('submit(login-submit)', function (obj) {
            layui.layer.load(2)
        });
    });
</script>
</body>
</html>