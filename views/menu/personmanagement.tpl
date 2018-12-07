<div id="console-box">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md5 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">劳务工种人数统计</div>
                <div class="layui-card-body">
                    <div id="all_woker_woketype_statistics"></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md7 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">人员统计</div>
                <div class="layui-card-body">
                    <div id="c0"></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md7 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">人员统计</div>
                <div class="layui-card-body">
                    <div id="c0"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use([ 'util', 'config', 'admin', 'carousel' ], function() {
		var config = layui.config;
		var layer = layui.layer;
		var util = layui.util;
		var admin = layui.admin;
        var carousel = layui.carousel;


        function initWorktypeStatistics() {
            admin.req('/api/personnel/statistics/worktype', {}, function(res){
                const chart = new window.G2.Chart({
                    container: 'all_woker_woketype_statistics',
                    forceFit: true,
                    height : 300,
                    padding: [20, 0, 30, 0]
                });
                chart.source(res.data);
                chart.interval().position('item*num').color('type', function(val) {return '#3060f0';}).label('num', {
                    useHtml: true,
                    htmlTemplate: function htmlTemplate(text, item) {
                        var a = item.point;
                        return '<span class="g2-label-item"><p class="g2-label-item-value">' + a.num + '</p></div>';
                    }
                }).size(36);
                chart.render();
            }, 'POST')
        }
		

        initWorktypeStatistics();

	});
</script>