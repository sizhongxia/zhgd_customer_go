<div class="layui-row layui-col-space15">
    <div class="layui-col-xs12">
        <div class="layui-card">
            <div class="layui-card-header">基本信息</div>
            <div class="layui-card-body">
                <<<if .personnel.data.empNo>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>人员编号：<<<.personnel.data.empNo>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.name>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>姓名：<<<.personnel.data.name>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.code>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>身份证号：<<<.personnel.data.code>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.sex>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>性别：<<<.personnel.data.sexTxt>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.birthday>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>出生日期：<<<.personnel.data.birthday>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.age>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>年龄：<<<.personnel.data.age>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.birthPlace>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>籍贯：<<<.personnel.data.birthPlace>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.nation>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>民族：<<<.personnel.data.nation>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.homeAddress>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>家庭住址：<<<.personnel.data.homeAddress>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.telephone>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>联系方式：<<<.personnel.data.telephone>>></p>
                    </div>
                <<<end>>>
                <div style="clear:both;"></div>
            </div>
        </div>
    </div>
    <div class="layui-col-xs12">
        <div class="layui-card">
            <div class="layui-card-header">身份信息</div>
            <div class="layui-card-body">
                <<<if .personnel.data.typeName>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>身份类型：<<<.personnel.data.typeName>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.companyName>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>所在公司：<<<.personnel.data.companyName>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.department>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>所在部门：<<<.personnel.data.department>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.post>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>所属岗位：<<<.personnel.data.post>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.group>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>所在班组：<<<.personnel.data.group>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.isGroupLeader>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>班组长：<<<.personnel.data.isGroupLeader>>></p>
                    </div>
                <<<end>>>
                <<<if .personnel.data.worktype>>>
                    <div class="layui-col-xs6 layui-col-sm6">
                        <p>所属工种：<<<.personnel.data.worktype>>></p>
                    </div>
                <<<end>>>
                <div style="clear:both;"></div>
            </div>
        </div>
    </div>
</div>