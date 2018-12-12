<style>
    .personmanagement-left {
        width: 6.8rem;
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


        // function initFontSize() {

        // }

        // initFontSize()
        // $(window).resize(initFontSize)

        var doResizeTimer = false;
        function initHeight() {
            var rate = 100 / 1920;
            var consoleBoxWidth = $('#console-box').width();
            console.info(consoleBoxWidth)
            var remw;
            if (consoleBoxWidth <= 1000) {
                remw = 1000 * rate;
            } else {
                remw = consoleBoxWidth * rate;
            }
            $('html').css('font-size', remw + "px");

            var windowHeight = window.innerHeight;
            $('#console-box').css('height', windowHeight - 80 + "px");
            if (doResizeTimer) {
                window.clearTimeout(doResizeTimer);
            }
            doResizeTimer = window.setTimeout(function () {
                initWorktypeStatistics();
                initBaseCensuss();
            }, 800);
        }

        initHeight()

        $("#console-box").resize(function () {
            initHeight();
        });



        var PmChartC01 = null;
        var PmChartC02 = null;
        var PmChartC03 = null;
        var PmChartC04 = null;

        function initWorktypeStatistics() {
            admin.req('/api/personnel/statistics/worktype', {}, function (res) {
                PmChartC01 && PmChartC01.destroy()
                PmChartC01 = null;
                PmChartC01 = new window.G2.Chart({
                    container: 'PmChartC01',
                    forceFit: true,
                    height: 160,
                    padding: [20, 0, 30, 0]
                });
                var userView = PmChartC01.view();
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
                PmChartC01.render();
            }, 'POST')
        }

        initWorktypeStatistics();
        initBaseCensuss();

        function initBaseCensuss() {
            admin.req('/api/personnel/statistics/basecensuss', {}, function (res) {
                initBaseCensussAge(res.data.ages)
                initBaseCensussSex(res.data.sexs)
                initBaseCensussArea(res.data.areas)
            }, 'POST')
        }

        function initBaseCensussSex(_sexData) {
            PmChartC04 && PmChartC04.destroy()
            PmChartC04 = null;
            PmChartC04 = new G2.Chart({
                container: 'PmChartC04',
                forceFit: true,
                height: 220,
                padding: { top: 10, right: 10, bottom: 10, left: 10 }
            });
            PmChartC04.source(_sexData, {
                value: {
                    formatter: function formatter(val) {
                        val = val + '%';
                        return val;
                    }
                }
            });
            PmChartC04.coord('theta', {
                radius: 0.7,
                innerRadius: 0.56
            });
            PmChartC04.intervalStack().position('value').color('name', ['#0a9afe', '#f0657d']).label('value', {
                formatter: function formatter(val, item) {
                    return item.point.name + ':' + val;
                }
            });
            PmChartC04.render();
        }

        function initBaseCensussAge(_ageData) {
            PmChartC03 && PmChartC03.destroy()
            PmChartC03 = null;
            PmChartC03 = new window.G2.Chart({
                container: 'PmChartC03',
                forceFit: true,
                height: 200,
                padding: [20, 0, 30, 0]
            });
            var userView = PmChartC03.view();
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
            PmChartC03.render();
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

            function renderG2Map(areaNode) {
                var adcode = areaNode.getAdcode();
                var geoJSON = areaNode.getSubFeatures(); // 获取 geoJSON 数据
                var name = areaNode.getName();

                var dv = processData(geoJSON);

                PmChartC02 && PmChartC02.destroy()
                PmChartC02 = null;

                PmChartC02 = new G2.Chart({
                    container: 'PmChartC02',
                    forceFit: true,
                    height: 480,
                    padding: 0
                });
                PmChartC02.source(dv);
                PmChartC02.axis(false);
                PmChartC02.tooltip({
                    showTitle: false
                });

                var userView = PmChartC02.view();
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
                PmChartC02.render();
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
                autohidemode: 'cursor',
                boxzoom: false,
            }).resize();
        }
    });
</script>