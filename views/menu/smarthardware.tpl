

<div id="console-box">

    <div style="width:30rem;height:4rem;">打打打</div>

    <div class="layui-row layui-col-space15">
        <div class="layui-col-md5 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">注册人数</div>
                <div class="layui-card-body">
                    <div id="c1"></div>
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


        function initTdStatistics() {
            
            var Shape = G2.Shape;
            // 自定义Shape 部分
            Shape.registerShape('point', 'pointer', {
            drawShape: function drawShape(cfg, group) {
                var center = this.parsePoint({
                x: 0,
                y: 0
                });
                // 绘制指针
                group.addShape('line', {
                attrs: {
                    x1: center.x,
                    y1: center.y,
                    x2: cfg.x,
                    y2: cfg.y,
                    stroke: cfg.color,
                    lineWidth: 10,
                    lineCap: 'round'
                }
                });
                return group.addShape('circle', {
                attrs: {
                    x: center.x,
                    y: center.y,
                    r: 9.75,
                    stroke: cfg.color,
                    lineWidth: 4.5,
                    fill: '#fff'
                }
                });
            }
            });

            var data = [{
                value: 270
            }];
            var chart = new G2.Chart({
                container: 'c1',
                forceFit: true,
                padding: [0, 0, 30, 0]
            });
            chart.source(data);

            chart.coord('polar', {
                startAngle: 0,
                endAngle: 2 *  Math.PI,
                radius: 0.75
            });
            // 刻度
            chart.scale('value', {
                min: 0,
                max: 360,
                nice: true,
                ticks: [0, 45, 90, 135, 180, 225, 270, 315, 360]
            });
            chart.axis('1', false);
            chart.axis('value', {
                zIndex: 2,
                label: {
                    offset: -32,
                    formatter: function formatter(val) {
                    if (val === '0') {
                        return '正东';
                    } else if (val === '45') {
                        return '东南';
                    } else if (val === '90') {
                        return '正南';
                    } else if (val === '135') {
                        return '西南';
                    } else if (val === '180') {
                        return '正西';
                    } else if (val === '225') {
                        return '西北';
                    } else if (val === '270') {
                        return '正北';
                    } else if (val === '315') {
                        return '东北';
                    }
                    return '-';
                    },
                    textStyle: {
                    fontSize: 14,
                    textAlign: 'center'
                    }
                },
                tickLine: null,
                grid: null
            });
            chart.legend(false);
            chart.point().position('value*1').shape('pointer').color('#1890FF').active(false);

            // 绘制仪表盘刻度线
            for(var i=0;i<360;i++) {
                chart.guide().line({
                    start: [i, i%45 == 0 ? 0.8 : 0.9],
                    end: [i, 0.95],
                    lineStyle: {
                    stroke: '#CBCBCB',
                    lineDash: null,
                    lineWidth: 1
                    }
                });
            }

            // 绘制仪表盘背景
            chart.guide().arc({
                zIndex: 0,
                top: false,
                start: [0, 0.965],
                end: [360, 0.965],
                style: {
                    stroke: '#CBCBCB',
                    lineWidth: 1
                }
            });
            // 绘制指标
            chart.guide().arc({
                zIndex: 1,
                start: [0, 0.965],
                end: [data[0].value, 0.965],
                style: {
                    stroke: '#1890FF',
                    lineWidth: 10
                }
            });
            chart.render();
        }
		

        initTdStatistics();

	});
</script>