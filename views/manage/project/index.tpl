<div class="layui-row layui-col-space15">
    <div class="layui-col-xs12">
        <div class="layui-card">
            <div class="layui-card-header">基本信息</div>
            <div class="layui-card-body">
                <<<if .project.proname>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>项目名称：<<<.project.proname>>></p>
                    </div>
                <<<end>>>
                <<<if .project.proname>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>项目简称：<<<.project.name>>></p>
                    </div>
                <<<end>>>
                <<<if .project.proname>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>区域位置：<<<.project.province>>><<<.project.city>>><<<.project.county>>></p>
                    </div>
                <<<end>>>
                <<<if .project.typename>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>项目类型：<<<.project.typename>>></p>
                    </div>
                <<<end>>>
                <<<if .project.constructionnaturename>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>建设性质：<<<.project.constructionnaturename>>></p>
                    </div>
                <<<end>>>
                <<<if .project.width>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>建筑宽度：<<<.project.width>>></p>
                    </div>
                <<<end>>>
                <<<if .project.length>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>建筑长度：<<<.project.length>>></p>
                    </div>
                <<<end>>>
                <<<if .project.measure>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>建设面积：<<<.project.measure>>></p>
                    </div>
                <<<end>>>
                <<<if .project.investment>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>总投资额：<<<.project.investment>>></p>
                    </div>
                <<<end>>>
                <<<if .project.numberoflayers>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>建筑层数：<<<.project.numberoflayers>>></p>
                    </div>
                <<<end>>>
                <<<if .project.planstarttime>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>计划开工时间：<<<.project.planstarttime>>></p>
                    </div>
                <<<end>>>
                <<<if .project.planendtime>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>计划竣工时间：<<<.project.planendtime>>></p>
                    </div>
                <<<end>>>
                <<<if .project.personname>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>项目负责人：<<<.project.personname>>></p>
                    </div>
                <<<end>>>
                <<<if .project.phone>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>负责人联系电话：<<<.project.phone>>></p>
                    </div>
                <<<end>>>
                <<<if .project.salesname>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>项目销售：<<<.project.salesname>>></p>
                    </div>
                <<<end>>>
                <<<if .project.salesphone>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p>销售联系电话：<<<.project.salesphone>>></p>
                    </div>
                <<<end>>>
                <<<if .project.mainstructuretypenames>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md6 layui-col-lg6">
                        <p>结构类型：<<<.project.mainstructuretypenames>>></p>
                    </div>
                <<<end>>>
                <<<if .project.functionname>>>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md6 layui-col-lg6">
                        <p>项目功能：<<<.project.functionname>>></p>
                    </div>
                <<<end>>>
                <div style="clear:both;"></div>
            </div>
        </div>
    </div>
    <div class="layui-col-xs12 layui-col-sm6">
        <div class="layui-card">
            <div class="layui-card-header">五方单位</div>
            <div class="layui-card-body">
                <ul>
                    <li>建设单位：<<<.project.buildingname>>></li>
                    <li>施工单位：<<<.project.constructionname>>></li>
                    <li>监理单位：<<<.project.supervisionname>>></li>
                    <li>勘察单位：<<<.project.surveyname>>></li>
                    <li>设计单位：<<<.project.designname>>></li>
                </ul>
            </div>
        </div>
    </div>
    <<<if .project.laborsubcontractors>>>
        <div class="layui-col-xs12 layui-col-sm6">
            <div class="layui-card">
                <div class="layui-card-header">分包单位</div>
                <div class="layui-card-body">
                    <ul>
                        <<<range .project.laborsubcontractors>>>
                            <li><<<.companyname>>></li>
                        <<<end>>>
                    </ul>
                </div>
            </div>
        </div>
    <<<end>>>
</div>