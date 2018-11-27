<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md5 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">注册人数</div>
                <div class="layui-card-body">
                    <div id="c1"></div>
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

		/*admin.req(config.user_info, {}, function(res){
            console.info(res)
        }, 'POST')*/


        const data = [
        { genre: 'Sports', sold: 275 },
        { genre: 'Strategy', sold: 115 },
        { genre: 'Action', sold: 120 },
        { genre: 'Shooter', sold: 350 },
        { genre: 'Other', sold: 150 }
        ]; // G2 对数据源格式的要求，仅仅是 JSON 数组，数组的每个元素是一个标准 JSON 对象。
        // Step 1: 创建 Chart 对象
        const chart = new window.G2.Chart({
            container: 'c1', // 指定图表容器 ID
            forceFit: true,
            height : 300, // 指定图表高度
            padding: { top: 0, right: 0, bottom: 30, left: 0 }
        });
        // Step 2: 载入数据源
        chart.source(data);
        // Step 3：创建图形语法，绘制柱状图，由 genre 和 sold 两个属性决定图形位置，genre 映射至 x 轴，sold 映射至 y 轴
        chart.interval().position('genre*sold').color('genre')
        // Step 4: 渲染图表
        


        var data2 = [{
              item: '男',
              count: 40,
              percent: 0.4
            }, {
              item: '女',
              count: 21,
              percent: 0.21
            }];
            var chart2 = new G2.Chart({
              container: 'c0',
              forceFit: true,
              height : 300,
              padding: { top: 10, right: 10, bottom: 10, left: 10 }
            });
            chart2.source(data2, {
              percent: {
                formatter: function formatter(val) {
                  val = val * 100 + '%';
                  return val;
                }
              }
            });
            chart2.coord('theta', {
              radius: 0.8,
              innerRadius: 0.6
            });
            chart2.guide().html({
              position: ['50%', '50%'],
              html: '<div style="color:#8c8c8c;font-size: 13px;text-align: center;width: 10em;">总人数<br><span style="color:#8c8c8c;font-size:16px">200</span></div>',
              alignX: 'middle',
              alignY: 'middle'
            });
            chart2.intervalStack().position('percent').color('item').label('percent', {
              formatter: function formatter(val, item) {
                return item.point.item + ':' + val;
              }
            });
    
            chart.render();
            chart2.render();

            
        var ins3 = carousel.render({
            elem: '#test3',
            anim: 'fade',
            interval: 3000,
            width: '100%',
            height: '300px'
        });

	});
</script>