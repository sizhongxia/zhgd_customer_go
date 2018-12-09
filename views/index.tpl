<!DOCTYPE html>
<html>

<head>
  <title>一通无限智慧工地客户版</title>
  <link rel="Shortcut Icon" href='/static/favicon.ico'>
  <link rel="bookmark" href="/static/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <style>
    html, body {
        background-color: rgb(5, 32, 60);
        overflow: hidden;
        font-size: 12px;
      }
      canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
      }
      #dataview-console-bg{
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        margin: 0;
        padding: 0;
        opacity: 0.9;
        position: fixed;
        transition: opacity 700ms;
        background-image: url(/static/images/default_bg.jpg);
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
        z-index: 0;
      }
      .container {
        width: 100%;
        height: 100vh;
        position: relative;
        background-color: rgba(5,5,50,0.1);
        z-index: 99999;
      }
      .container .header {
        width: 100%;
        height: 1.2rem;
        overflow: hidden;
      }
      .container .header .header-left {
        width: 520px;
        text-align:left;
        font-size: 1.4rem;
        font-weight: 400;
        color: #fff;
      }
      .container .content {
        width: 100%;
        height: calc(100vh - 1.2rem);
        text-align: center;
        display: box;
        display: -webkit-box;
        display: -moz-box;
      }


      /**************************left***********************/
      .content-left {
        width: 26rem;
        height: 100%;
      }

      .model-left-block-1 {
        width: 100%;
        margin: auto;
        height: calc(100vh - 350px);
        overflow: hidden;
        margin-bottom: 8px;
      }

      .project-item {
        width:100%;
        height: 17px;
        line-height: 17px;
        color:#ffffff;
        font-size:1.2em;
        text-align: left;
        text-overflow:ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }

      .model-left-block-2 {
        width: 100%;
        height: 249px;
        text-align: center;
      }


      /**************************main***********************/

      .content-main {
        box-flex: 1;
        -webkit-box-flex: 1;
        -moz-box-flex: 1;
        word-wrap: break-word;
      }

      .model-main-block-1 {
        width: 100%;
        margin: auto;
        height: calc(100vh - 248px);
        overflow: hidden;
        margin-bottom: 8px;
        padding:0 10px;
      }

      .model-main-block-2 {
        width: 100%;
        height: 146px;
        text-align: center;
        padding:0 12px;
      }

      /************************right*************************/
      .content-right {
        width: 256px;
        height: 100%;
      }

      .model-right-block-1 {
        width: 100%;
        height: 102px;
        text-align: center;
        margin-bottom: 8px;
      }

      .model-right-block-2 {
        width: 100%;
        height: 147px;
        text-align: center;
        margin-bottom: 8px;
      }
      .model-right-block-3 {
        width: 100%;
        height: 147px;
        text-align: center;
        margin-bottom: 8px;
      }
      .model-right-block-4 {
        width: 100%;
        margin: auto;
        height: calc(100vh - 516px);
        overflow: hidden;
      }

      /************************bootstrap*************************/

      .panel {
        background-color: rgba(0, 24, 55, 0.89);
        border: none;
        height: 100%;
      }

      .panel-default>.panel-heading {
        font-size: 13px;
        color: #fdfdfd;
        border-bottom: 1px solid #092647;
        background-image: linear-gradient(to bottom,#050532 0,#031c3b 100%);
      }

      @media screen and (max-width: 768px) {
        html, body {
            font-size: 10px;
        }
      }

    </style>
  <!--[if IE]>
      <script src="/static/js/html5.js"></script>
    <![endif]-->
</head>

<body>
  <div id="dataview-console-bg">
    <canvas id="line-canvas"></canvas>
  </div>
  <div class="container">
    <div class="header">
      <div class="header-left">xxxx</div>
    </div>
    <div class="content">
      <div class="content-left">
        <div class="model-left-block-1">
          <div class="panel panel-default">
            <div class="panel-body">
              <p class="project-item">项目名称：</p>
              <p class="project-item">项目类型：</p>
              <p class="project-item">项目地址：</p>
              <p class="project-item">建筑面积：</p>
              <p class="project-item">工程造价：</p>
              <p class="project-item">建设楼层：</p>
              <p class="project-item">建设单位：</p>
              <p class="project-item">设计单位：</p>
              <p class="project-item">监理单位：</p>
              <p class="project-item">勘测单位：</p>
              <p class="project-item">施工单位：</p>
            </div>
          </div>
        </div>
        <div class="model-left-block-2">
          <div class="panel panel-default">
            <div class="panel-heading">分布</div>
            <div class="panel-body">
              <div id="c2" style="width: 100%;height:177px;"></div>
              <div id="c1" style="width: 100%;height:177px;"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="content-main" style="min-width:768px;">
        <div class="model-main-block-1">
          <div class="panel panel-default">
            <div class="panel-body" style="">
            </div>
          </div>
        </div>
        <div class="model-main-block-2">
          <div class="panel panel-default">
            <div class="panel-body" style="height:183px">
              <div id="container" style="width:100%;height:177px"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="content-right">

        <div class="model-right-block-1">
          <div class="panel panel-default">
            <div class="panel-body">
            </div>
          </div>
        </div>
        <div class="model-right-block-2">
          <div class="panel panel-default">
            <div class="panel-body">
            </div>
          </div>
        </div>
        <div class="model-right-block-3">
          <div class="panel panel-default">
            <div class="panel-body">
            </div>
          </div>
        </div>
        <div class="model-right-block-4">
          <div class="panel panel-default">
            <div class="panel-body">
            </div>
          </div>
        </div>


      </div>
    </div>
  </div>
  <script type="text/javascript" src="//libs.baidu.com/jquery/2.0.3/jquery.min.js"></script>
  <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!--<script type="text/javascript" src="/static/js/echarts/echarts.min.js"></script>-->
  <!--<script type="text/javascript" src="//cdn.hcharts.cn/highcharts/highcharts.js"></script>-->

  <script type="text/javascript" src="https://gw.alipayobjects.com/os/antv/pkg/_antv.g2-3.3.2/dist/g2.min.js"></script>

  <script type="text/javascript" src="/static/js/linelib/TweenLite.min.js"></script>
  <script type="text/javascript" src="/static/js/linelib/EasePack.min.js"></script>
  <script type="text/javascript" src="/static/js/linelib/rAF.js"></script>
  <script type="text/javascript" src="/static/js/linelib/linestyle.js"></script>

  <script>
    $(function () {
      function initFontSize() {
        var rate = 100 / 1920;
        var windowWidth = window.innerWidth;// 当前窗口的宽度
        var rem;
        if (windowWidth <= 1280) {
          rem = 1280 * rate;
        } else {
          rem = windowWidth * rate;
        }
        $('html').css('font-size', rem + "px");
      }

      initFontSize()
      $(window).resize(initFontSize)

        (function () {
          const data = [
            { genre: '工种1', sold: 275 },
            { genre: '工种2', sold: 115 },
            { genre: '工种3', sold: 120 },
            { genre: '工种4', sold: 350 },
            { genre: '工种5', sold: 150 }
          ];
          const chart = new G2.Chart({
            container: 'c1',
            forceFit: true,
            height: 182,
            padding: { top: 0, right: 0, bottom: 30, left: 0 }
          });
          chart.legend(false);
          chart.source(data);
          chart.interval().position('genre*sold').color('genre')
          chart.render();

        })();
      (function () {
        var data = [{
          item: '男',
          count: 40,
          percent: 0.4
        }, {
          item: '女',
          count: 21,
          percent: 0.21
        }];
        var chart = new G2.Chart({
          container: 'c2',
          forceFit: true,
          height: 182,
          padding: { top: 10, right: 10, bottom: 10, left: 10 }
        });
        chart.source(data, {
          percent: {
            formatter: function formatter(val) {
              val = val * 100 + '%';
              return val;
            }
          }
        });
        chart.coord('theta', {
          radius: 0.8,
          innerRadius: 0.6
        });
        chart.guide().html({
          position: ['50%', '50%'],
          html: '<div style="color:#8c8c8c;font-size: 13px;text-align: center;width: 10em;">总人数<br><span style="color:#8c8c8c;font-size:16px">200</span></div>',
          alignX: 'middle',
          alignY: 'middle'
        });
        chart.intervalStack().position('percent').color('item').label('percent', {
          formatter: function formatter(val, item) {
            return item.point.item + ':' + val;
          }
        });
        chart.render();
      })();
    })
  </script>
</body>

</html>