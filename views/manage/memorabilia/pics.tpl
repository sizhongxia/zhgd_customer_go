<style>
    .layadmin-cmdlist-fluid{padding-bottom:60px}
    .cmdlist-container{background:#fff;border:1px solid #eee;width:180px;height:240px;float:left;margin: 10px;}
    .cmdlist-container:hover{border:1px solid #00242a}
    .cmdlist-container img{width:100%;height:100%}
</style>
<div class="layui-fluid layadmin-cmdlist-fluid">
    <div class="layui-row layui-col-space30">
        <div class="layui-col-xs12" id="memorabilia-pics"></div>
    </div>
</div>

<script id="demo" type="text/html">
    <div class="cmdlist-container" data-id=""><a href="javascript:;"><img src="/static/images/upload-pic-180x240.png"/></a></div>
    {{#  layui.each(d.data, function(index, item){ }}
        <div class="cmdlist-container" data-id="{{item.id}}"><a href="javascript:;"><img src="{{item.src}}"/></a></div>
    {{#  }); }}
    <div style="clean:both;"></div>
</script>

<script>
layui.use(['layer', 'element', 'form', 'laytpl', 'admin'], function(){
    var form = layui.form, laytpl = layui.laytpl, layer = layui.layer, element = layui.element;
    var admin = layui.admin;
    
    var view = document.getElementById('memorabilia-pics');

    var loadPics = function() {
        admin.req("/api/memorabilia/pics", {id: "<<<.id>>>"}, function(res) {
            laytpl(demo.innerHTML).render(res, function(html){
                view.innerHTML = html;
            })
        }, "POST");
    }
    loadPics();

    $("#memorabilia-pics").on("click", ".cmdlist-container", function(){
        if($(this).data("id")) {
            console.info(admin.popupCenter)
            admin.popupCenter({
                title : '修改',
                path : '/manage/memorabilia/add',
                finish : function() {
                }
            });
        } else {
            admin.popupCenter({
                title : '新增',
                path : '/manage/memorabilia/add',
                finish : function() {
                }
            });
        }
    })
});
</script>