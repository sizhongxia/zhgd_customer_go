<style>
    .personmanagement-left {
        width: 4.4rem;
        height: 100%;
        float: left;
        overflow-y: auto;
        overflow-x: hidden;
        background: rgba(0, 0, 0, 0.02);
    }
</style>
<div id="console-box">

    <div class="personmanagement-left">
        <div class="layui-card">
            <div class="layui-card-header">劳务工种人数统计</div>
            <div class="layui-card-body">
                <div id="PmChartC01"></div>
            </div>
        </div>
        <div class="layui-card">
            <div class="layui-card-header">人员年龄分布</div>
            <div class="layui-card-body">
                <div id="PmChartC03"></div>
            </div>
        </div>
        <div class="layui-card">
            <div class="layui-card-header">人员性别对比(百分比%)</div>
            <div class="layui-card-body">
                <div id="PmChartC04"></div>
            </div>
        </div>
        <div class="layui-card">
            <div class="layui-card-header">人员地域分布</div>
            <div class="layui-card-body">
                <div id="PmChartC02"></div>
            </div>
        </div>
    </div>

</div>

<script>
    layui.use(['util', 'config', 'admin', 'carousel'], function () {
        var config = layui.config;
        var layer = layui.layer;
        var util = layui.util;
        var admin = layui.admin;
        var carousel = layui.carousel;

        function initHeight() {
            var windowHeight = window.innerHeight;
            $('#console-box').css('height', windowHeight - 80 + "px");
        }
        initHeight()
        $(window).resize(initHeight);

        (function initWorktypeStatistics() {
            admin.req('/api/personnel/statistics/worktype', {}, function (res) {
                var chart = new window.G2.Chart({
                    container: 'PmChartC01',
                    forceFit: true,
                    height: 220,
                    padding: [20, 0, 30, 0]
                });
                var userView = chart.view();
                userView.source(res.data, {
                    'value': {
                        alias: '人数'
                    }
                });
                userView.interval().position('name*value').color('#1e9fff').label('name', {
                    useHtml: true,
                    htmlTemplate: function htmlTemplate(text, item) {
                        var a = item.point;
                        return '<span class="g2-label-item"><p class="g2-label-item-value">' + a.value + '</p></div>';
                    }
                }).size(36);
                chart.render();
            }, 'POST')
        })(this)


        admin.req('/api/personnel/statistics/basecensuss', {}, function (res) {
            initBaseCensussAge(res.data.ages)
            initBaseCensussSex(res.data.sexs)
            initBaseCensussArea(res.data.areas)
        }, 'POST')

        function initBaseCensussSex(_sexData) {
            var chart = new G2.Chart({
                container: 'PmChartC04',
                forceFit: true,
                height: 200,
                padding: [20, 0, 50, 0]
            });

            chart.source(_sexData);
            chart.coord('theta', {
                innerRadius: 0.75
            });
            chart.tooltip({
                showTitle: false
            });
            chart.intervalStack().position('value').color('name', ['#0a9afe', '#f0657d']).shape('sliceShape');

            chart.render();
        }

        function initBaseCensussAge(_ageData) {
            var chart = new window.G2.Chart({
                container: 'PmChartC03',
                forceFit: true,
                height: 220,
                padding: [20, 0, 30, 0]
            });
            var userView = chart.view();
            userView.source(_ageData, {
                'value': {
                    alias: '人数'
                }
            });
            userView.interval().position('name*value').color('#1e9fff').label('name', {
                useHtml: true,
                htmlTemplate: function htmlTemplate(text, item) {
                    var a = item.point;
                    return '<span class="g2-label-item"><p class="g2-label-item-value">' + a.value + '</p></div>';
                }
            }).size(36);
            chart.render();
        }


        function initBaseCensussArea(_areaData) {
            var colors = ["#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00", "#b82e2e", "#316395", "#994499", "#22aa99", "#aaaa11", "#6633cc", "#e67300", "#8b0707", "#651067", "#329262", "#5574a6", "#3b3eac"];
            // 当前聚焦的区域
            var currentAreaNode = void 0;

            AMapUI.load(['ui/geo/DistrictExplorer', 'lib/$'], function (DistrictExplorer) {
                // 创建一个实例
                var districtExplorer = window.districtExplorer = new DistrictExplorer({
                    eventSupport: true, //打开事件支持
                });

                //绘制某个区域的边界
                function renderAreaPolygons(areaNode) {
                    var node = _.cloneDeep(areaNode);
                    districtExplorer.clearFeaturePolygons();
                    districtExplorer.renderSubFeatures(node, function (feature, i) {
                        var fillColor = colors[i % colors.length];
                        var strokeColor = colors[colors.length - 1 - i % colors.length];

                        return {
                            cursor: 'default',
                            bubble: true,
                            strokeColor: strokeColor, //线颜色
                            strokeOpacity: 1, //线透明度
                            strokeWeight: 1, //线宽
                            fillColor: fillColor, //填充色
                            fillOpacity: 0.35 //填充透明度
                        };
                    });

                    //绘制父区域
                    districtExplorer.renderParentFeature(node, {
                        cursor: 'default',
                        bubble: true,
                        strokeColor: 'black', //线颜色
                        strokeOpacity: 1, //线透明度
                        strokeWeight: 1, //线宽
                        fillColor: null, //填充色
                        fillOpacity: 0.35 //填充透明度
                    });
                }

                //切换区域后刷新显示内容
                function refreshAreaNode(areaNode) {
                    districtExplorer.setHoverFeature(null);
                    renderAreaPolygons(areaNode);
                }

                //切换区域
                function switch2AreaNode(adcode, callback) {
                    loadAreaNode(adcode, function (error, areaNode) {
                        if (error) {
                            if (callback) {
                                callback(error);
                            }
                            return;
                        }
                        currentAreaNode = window.currentAreaNode = areaNode;
                        refreshAreaNode(areaNode);

                        setTimeout(nicePageScroll)
                        
                        if (callback) {
                            callback(null, areaNode);
                        }
                    });
                }

                //加载区域
                function loadAreaNode(adcode, callback) {
                    districtExplorer.loadAreaNode(adcode, function (error, areaNode) {
                        if (error) {
                            if (callback) {
                                callback(error);
                            }
                            return;
                        }
                        renderG2Map(areaNode); // 使用 G2 绘制地图

                        if (callback) {
                            callback(null, areaNode);
                        }
                    });
                }

                switch2AreaNode(100000);
            });

            // 开始使用 G2 绘制地图
            var provinceChart = void 0;

            function renderG2Map(areaNode) {
                var adcode = areaNode.getAdcode();
                var geoJSON = areaNode.getSubFeatures(); // 获取 geoJSON 数据
                var name = areaNode.getName();

                provinceChart && provinceChart.destroy();
                provinceChart = null;

                var dv = processData(geoJSON);


                provinceChart = new G2.Chart({
                    container: 'PmChartC02',
                    forceFit: true,
                    height: 480,
                    padding: 0
                });
                provinceChart.source(dv);
                provinceChart.axis(false);
                provinceChart.tooltip({
                    showTitle: false
                });

                var userView = provinceChart.view();
                userView.source(dv, {
                    'cvalue': {
                        alias: '人数'
                    },
                    'name': {
                        alias: '省份'
                    }
                });
                userView.polygon().position('longitude*latitude').tooltip('name*cvalue').style({
                    stroke: '#FEFEFE',
                    lineWidth: 1
                }).color('value', '#E3EDF3-#BAE7FF-#1890FF-#0050B3');
                provinceChart.render();
            }

            function processData(geoJSON) {
                var mapData = {
                    type: 'FeatureCollection',
                    features: geoJSON
                };
                var ds = new DataSet();
                var geoDataView = ds.createView().source(mapData, {
                    type: 'GeoJSON'
                });
                var dvData = ds.createView().source(_areaData);
                dvData.transform({
                    type: 'geo.region',
                    field: 'name',
                    geoDataView: geoDataView,
                    as: ['longitude', 'latitude']
                }).transform({
                    type: 'map',
                    callback: function callback(obj) {
                        obj.cvalue = obj.value;
                        return obj;
                    }
                });
                return dvData;
            }
        }

        function nicePageScroll() {
            $(".personmanagement-left").niceScroll({
                cursorcolor: "#ddd",
                cursorborder: "1px solid #ddd",
                horizrailenabled: false,
                cursordragontouch: true,
            });
        }
    });
</script>