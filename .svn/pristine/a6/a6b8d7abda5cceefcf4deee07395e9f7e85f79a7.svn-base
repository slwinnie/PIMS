<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        var iProjectId = Convert.ToInt32(Request["ProjectId"]);
        if (iProjectId < 0)
        {
            txtProjectId.Visible = false;
        }
        if (!IsPostBack)
        {
            // 当前项目ID
            projectId.Value = Request["ProjectId"];
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/SpryTabbedPanels.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/jquery-ui.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/SpryTabbedPanels.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script src="js/projectInitialization.js"></script>
    <title><%=SystemHelper.SystemName %></title>
    <style>
        .text-input {
            width: 100%;
            /*border: 0;*/
            color: blue;
            display: inline-block;
        }
        .selected{
            background-color:bisque;
            /*border: 2px solid #5cb85c;*/
            font-weight: bold;
            /*background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));*/
        }
        table.project-info td {
            border: 0 solid gray !important;
        }
        .col1, .col2 {
            width: 200px;
        }
        .HeaderLinearBackground { 
           background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
         }
        .HeaderLinearBackground th {
            font-weight: normal !important;
        }
        #SubIDList tr td:nth-child(7){
            /*border:1px solid red !important;*/
            width:180px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">

<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <a href="./Default.aspx" class=" btn-default btn-create" runat="server">Project Initiation</a> > <span>Project</span><p></p>
    <div class="container">
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0" onclick="javascript:location.href='ProposalInitiation.aspx?projectId=<%=Request["ProjectId"] %>'; return false;">Proposal</li>
    <li class="TabbedPanelsTab" tabindex="1">Project</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent"></div>
    <div class="TabbedPanelsContent">
        <!-- 当前页正文 开始 -->
        <div class="btn-group pull-right">
            <a href="#" class="btn btn-success new-project" >New Project</a><a href="javascript:void(0)" class="btn btn-primary pull-right" id="SaveChange">Save change</a>
        </div>
<%
var db = new PPPEntities();

%>
<table class="table table-hover table-bordered header" id="SubIDList">
    <thead>
        <tr class="HeaderLinearBackground">
            <th>Sub ID</th>
            <th>Project No</th>
            <th>Orignator</th>
            <th>Created Date</th>
            <th>Project<br />Type</th>
            <th>Status</th>
            <th></th>
            <th>Risk<br/>Submit Date</th>
            <th>Risk<br/>Approve Date</th>
            <th>NIPS<br/>Submit Date</th>
            <th>NIPS<br/>Approve Date</th>
            <th>Action(s)</th>
        </tr>
    </thead>
    <tbody>
    <%
        var sb = new StringBuilder();
        var iProjectId = Convert.ToInt32(projectId.Value);

        var p = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId);
        if (p != null)
        {
            projectType.Value = p.ProjectType;
            PType.Value = p.PType;
        }
        foreach (var v in db.TProjectX.Where(x => x.ProjectId == iProjectId).OrderBy(x=>x.SubId))
        {
            sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td><td style='padding-left:0;padding-right:0;'>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td><div class='btn-group'><a class='btn btn-danger btn-xs' href='javascript:void(0);'>Delete</a></div></td></tr>",
                v.SubId,
                v.ProjectNo,
                v.OriginatorId,
                StringHelper.FmtDate(v.CreatedDate),
                v.ProjectType,
                v.Status,
                string.Format("<div class='btn-group'><a class='btn btn-warning btn-xs risk' href='{2}Forms/RiskForm.aspx?projectId={0}&subId={1}&type=2'>Risk</a><a class='btn btn-info btn-xs npis' href='../Forms/NPISForm.aspx?projectId={0}&subId={1}&type=2'>NPIS</a><a class='btn btn-success btn-xs open-project' href='{2}Forms/OpenProject.aspx?projectId={0}&subId={1}'>Open Project</a></div>",
                    Request["projectId"],
                    v.SubId,
                    ResolveUrl("~")),
                StringHelper.FmtDate(v.RiskSubmitDate),
                StringHelper.FmtDate(v.RiskApproveDate),
                StringHelper.FmtDate(v.NPISSubmitDate),
                StringHelper.FmtDate(v.NPISApproveDate)
                );
        }
     %>
    <%=sb.ToString() %>
    </tbody>
</table>
    <table class="table table-hover project-info">
        <tr>
            <td class="col1">CRMT ID</td>
            <td><input type="text" id="txtProjectId" runat="server" class="text-input" readonly="readonly"/></td>
            <td class="col2">Business Unit</td>
            <td>
                <input type="text" id="txtBusinessUnit" runat="server" class="text-input"/>
            </td>
        </tr>
        <tr>
            <td>Business Line</td>
            <td>
                <%--<input type="text" id="txtBusinessLine" runat="server" class="text-input"/>--%>
                <select runat="server" id="txtBusinessLine" name="txtBusinessLine" class="form-control1" style="width: 100%; height: 100%">
                    <option value=""></option>
                    <option value="Services">Services</option>
                    <option value="Major Projects">Major Projects</option>
                    <option value="Improve">Improve</option>
                    <option value="Advisian">Advisian</option>
                </select>
            </td>
            <td>Opportunity Lead Sector</td>
            <td><input type="text" id="txtOpportunityLeadSector" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Project Name</td>
            <td colspan="3"><input type="text" id="txtProjectName" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Customer</td>
            <td><input type="text" id="txtCustomer" runat="server" class="text-input"/></td>
            <td>Project Status</td>
            <td><input type="text" id="txtProjectStatus" runat="server" class="text-input" readonly="readonly"/></td>
        </tr>
        <tr>
            <td>Bid Due Date<span class='date-format'>(yyyy/mm/dd)</span></td>
            <td><input type="text" id="txtBidDueDate" runat="server" class="text-input"/></td>
            <td>Award Date<span class='date-format'>(yyyy/mm/dd)</span></td>
            <td><input type="text" id="txtAwardDate" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Go (%)</td>
            <td><input type="text" id="txtGo" runat="server" class="text-input"/></td>
            <td>Get (%)</td>
            <td><input type="text" id="txtGet" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>WorleyParsons CV (AUD)</td>
            <td><input type="text" id="txtWPCV" runat="server" class="text-input"/></td>
            <td>WorleyParsons EBIT (AUD)</td>
            <td><input type="text" id="txtWPEBIT" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Estimated Work (Hrs)</td>
            <td><input type="text" id="txtEstimatedWork" runat="server" class="text-input"/></td>
            <td>Contract Duration (Wks)</td>
            <td><input type="text" id="txtContractDuration" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Contract Type</td>
            <td>
                <%--<input type="text" id="txtContractType" runat="server" class="text-input"/>--%>
                <select runat="server" id="txtContractType" name="txtContractType" class="form-control1" style="width: 100%; height: 100%">
                    <option value=""></option>
                    <option value="Reimbursable Schedule of Rates">Reimbursable Schedule of Rates</option>
                    <option value="Lump Sum">Lump Sum</option>
                    <option value="Cost Plus">Cost Plus</option>
                    <option value="Target Incentives">Target Incentives</option>
                    <option value="Other">Other</option>
                    <option value="N/A (Proposal)">N/A (Proposal)</option>
                </select>
            </td>
            <td>Bid Office</td>
            <td><input type="text" id="txtBidOffice" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Facility Location - Country</td>
            <td><input type="text" id="txtFacilityLocationCountry" runat="server" class="text-input"/></td>
            <td>Workshare Offices (All)</td>
            <td>
                <%--<input type="text" id="txtWorkshareOffice" runat="server" class="text-input"/>--%>
                <select runat="server" id="txtWorkshareOffice" name="txtWorkshareOffice" class="form-control1" style="width: 100%; height: 100%">
                    <option value=""></option>
                    <option value="No">No</option>
                    <option value="Yes">Yes</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Scopes (All)</td>
            <td><input type="text" id="txtScopes" runat="server" class="text-input"/></td>
            <td>Opportunity Lead Subsector</td>
            <td><input type="text" id="txtOpportunityLeadSubsector" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Custodian</td>
            <td><input type="text" id="txtCustodian" runat="server" class="text-input"/></td>
            <td>Opportunity Priority</td>
            <td><input type="text" id="txtOpportunityPriority" runat="server" class="text-input"/></td>
        </tr>
        <tr>
            <td>Contract Currency</td>
            <td><input type="text" id="txtContractCurrency" runat="server" class="text-input"/></td>
            <td>Project Manager *</td>
            <td>
                <input type="text" id="txtProjectManagerId" runat="server" class="text-input" autocomplete="off"/>
                <div  class="search-people-result"></div>
<%--                <asp:DropDownList runat="server" id="txtProjectManagerId" CssClass="form-control1 text-input" />--%>
            </td>
        </tr>
        <tr>
            <td>Type *</td>
            <td>
                <select runat="server" id="PType" name="PType" class="form-control1" style="width:100%">
                    <option value=""></option>
                    <option value="Chemical">Chemical</option>
                    <option value="Hydrocarbon">Hydrocarbon</option>
                    <option value="Infrastructure">Infrastructure</option>
                    <option value="Metals&Minerals">Metals&Minerals</option>
                    <option value="Power">Power</option>
                    <option value="Overhead">Overhead</option>
                </select>
            </td>
            <td></td>
            <td>
            </td>
        </tr>
    </table>
        <p>&nbsp;</p>
        <!-- 当前页正文 结束 -->
        <input type="hidden" id ="projectType" runat="server" />
        <input type="hidden" id ="currSubId" runat="server" />
    </div>
  </div>
</div>
        
<script type="text/javascript">
    var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
    TabbedPanels1.showPanel(1);
</script>
    </div>
        <input type="hidden" id="projectId" runat="server"/>
        <input type="hidden" id="subId" runat="server"/>
        <input type="hidden" id="projectManagerId" runat="server"/>
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Delete confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm delete current item?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnDelete" type="button" class="btn btn-danger">Delete</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-new-project-confirm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">New Project Confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm create a new project?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="btnContinue" type="button" class="btn btn-success">Continue</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->

<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-new-project-select-project-type">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Select Project Type</h4>
                    </div>
                    <div class="modal-body">
                        <div style="width:80%; margin:0 auto;margin-top:20px;">
                        <div class="list-group">
                          <a href="JavaScript:void(0);" class="list-group-item active text-center" id= "btnStandalone">Standalone Project</a>
                          <a href="JavaScript:void(0);" class="list-group-item  text-center" id="btnWorkshare">Workshare Project</a>
                        </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
    </form>
    <script>
        $(function () {
            //读取当前SubId的详细信息
            $(".header tr:gt(0)").click(function () {
                $("#subId").val($(this).find("td:eq(0)").html());
                $("#currSubId").val($("#subId").val());
                $(this).siblings().removeClass('selected');
                $(this).addClass('selected');
                $.ajax({
                    url: "Actions/ProjectJsonData.aspx?projectId=" + $("#projectId").val() + "&subId=" + $("#subId").val(),
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (d) {
                        try {
                            var json = JSON.parse(d);
                            $("#txtBusinessUnit").val(json.BusinessUnit);
                            $("#txtProjectId").val(json.ProjectId);
                            $("#txtBusinessLine").val(json.BusinessLine);
                            $("#txtOpportunityLeadSector").val(json.OpportunityLeadSector);
                            $("#txtProjectName").val(json.ProjectName);
                            $("#txtCustomer").val(json.Customer);
                            $("#txtProjectStatus").val(json.Status);
                            $("#txtBidDueDate").val(json.BidDueDate);
                            $("#txtAwardDate").val(json.AWardDate);
                            $("#txtGo").val(json.Go);
                            $("#txtGet").val(json.Get);
                            $("#txtWPCV").val(json.WorleyParsonsCV);
                            $("#txtWPEBIT").val(json.WorleyParsonsEBIT);
                            $("#txtEstimatedWork").val(json.EstimatedWork);
                            $("#txtContractDuration").val(json.ContractDuration);
                            $("#txtContractType").val(json.ContractType);
                            $("#txtBidOffice").val(json.BidOffice);
                            $("#txtFacilityLocationCountry").val(json.FacilityLocationCountry);
                            $("#txtWorkshareOffice").val(json.WorkshareOffices);
                            $("#txtScopes").val(json.Scopes);
                            $("#txtOpportunityLeadSubsector").val(json.OpportunityLeadSubsector);
                            $("#txtCustodian").val(json.Custodian);
                            $("#txtOpportunityPriority").val(json.OpportunityPriority);
                            $("#txtContractCurrency").val(json.ContractCurrency);
                            $("#txtProjectManagerId").val(json.ProjectManager);
                            $("#txtProjectManagerId").data("pmid", json.ProjectManagerId);
                        } catch (e) {
                            alert(e);
                        }
                    },
                    error: function () {
                        alert("e");
                    }
                });
            });
            // 保存变更
            $("#SaveChange").click(function () {
                if ($("#currSubId").val() === "") {
                    alert("Please select a row first.");
                    return false;
                }
                var param = $("#form1").serialize();

                if ($("#txtProjectId").val() === "") {
                    alert("Please select a row first.");
                    return false;
                }
                $.ajax({
                    url: "Actions/ProjectSaveChange.aspx?pmId=" + $("#txtProjectManagerId").data("pmid") + "&" + param,
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (d) {
                        try {
                            var rst = JSON.parse(d);
                            if (rst.ErrorCode === "0") {
                                alert(rst.ErrorMessage);
                            } else {
                                alert(rst.ErrorMessage);
                            }
                        } catch (e) {
                            alert(e);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        /*弹出jqXHR对象的信息*/
                        //alert(jqXHR.responseText);
                        alert(jqXHR.status);
                        //alert(jqXHR.readyState);
                        //alert(jqXHR.statusText);
                        /*弹出其他两个参数的信息*/
                        //alert(textStatus);
                        //alert(errorThrown);
                    }
                });

                return false;
            });
            // 打开对话框
            $(".header td a:contains('Delete')").click(function () {
                var $modal = $('#modalDialog');
                $("#modalDialog").draggable({
                    handle: ".modal-header"
                });
                $("#modalDialog").data("sender", $(this));
                $modal.modal("show");
            });
            // 删除当前SUBID
            $("#btnDelete").click(function () {
                var $sender = $("#modalDialog").data("sender");
                var projectId = $.getUrlParam(window.location.href, 'projectId');
                var $this = $("this");

                if ($("#subId").val() === "") {
                    alert("Please select a row first.");
                    return false;
                }
                $.ajax({
                    url: "Actions/DeleteProjectXSubId.aspx?projectId=" + projectId + "&subId=" + $("#subId").val(),
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (d) {
                        try {
                            var rst = JSON.parse(d);
                            if (rst.ErrorCode === "0") {
                                $("#modalDialog").modal("hide");
                                $("tr.selected").remove();
                                $("#SubIDList tr:last").click();

                            } else {
                                alert(rst.ErrorMessage);
                            }
                        } catch (e) {
                            alert(e);
                        }
                    },
                    error: function () {
                        alert("e");
                    }
                });
                return false;
            });

            // 动态格式化货币
            $("#txtWPCV, #txtEstimatedWork, #txtWPEBIT, #txtContractDuration").blur(function () {
                $(this).val($(this).val().replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,'));

                return false;
            });

            $("#txtProjectManagerId").keyup(function () {
                var ownerId = $(this).attr("id");
                $.ajax({
                    url: "<%=ResolveUrl("~")%>People/Actions/searchPeople.aspx?top=10&searchKey=" + $(this).val(),
                    type: "post",
                    success: function (d) {
                        try {
                            $("#" + ownerId).next().html("");
                            var rst = JSON.parse(d);
                            if (rst.length === 0) return false;
                            var html = "<table class='table table-condensed table-hover' style='background-color:white;padding:0;margin:0;border:1px solid gray;'>";
                            $.each(rst, function (i, item) {
                                html += "<tr><td><a href='javascript:void(0);' class='search-result-item' data-owner='" + ownerId + "'>" + item.EmployeeId + "</a></td><td><a href='javascript:void(0);' class='search-result-item' data-owner='" + ownerId + "'>" + item.PeopleNameEn + "</a></td></tr>";
                            });
                            html += "</table>";
                            $("#" + ownerId).next().html(html);
                        } catch (e) {
                            alert(e);
                        }
                        return false;
                    }
                });

                return false;
            });
            $("#txtProjectManagerId").blur(function () {
                if ($("#txtProjectManagerId").val() === "") {
                    $("#txtProjectManagerId").data("pmid", "");
                }
            });
            $("body").on("click", ".search-result-item", function () {
                var ownerId = "#" + $(this).data("owner");
                $(ownerId).data("pmid", $(this).parent().parent().find("td:eq(0) a").html());
                //$(ownerId).data("empname", $(this).parent().parent().find("td:eq(1) a").html());
                $(ownerId).val($(this).parent().parent().find("td:eq(1) a").html());
                $(this).parent().parent().parent().html("");
                //console.log($("#searchKey").data("empid"));
                //console.log($("#searchKey").data("empname"));
            });
            $(".risk, .npis").click(function () {
                var status = false;
                var subId = $(this).parent().parent().parent().find("td:eq(0)").text();
                $.ajax({
                    url: "./Actions/RiskNpisFormOpenCheck.aspx?projectId=" + $("#projectId").val() + "&subId=" + subId,
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (d) {
                        try {
                            var rst = JSON.parse(d);
                            if (rst.ErrorCode === "0") {
                                status = true;
                            } else {
                                alert(rst.ErrorMessage);
                            }
                        } catch (e) {
                            alert(e);
                        }
                    },
                    error: function () {
                        alert("system error.");
                    }
                });

                return status;
            });

            $(".open-project").click(function () {
                var status = false;
                var subId = $(this).parent().parent().parent().find("td:eq(0)").text();
                $.ajax({
                    url: "./Actions/OpenProjectCheck.aspx?projectId=" + $("#projectId").val() + "&subId=" + subId,
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (d) {
                        try {
                            var rst = JSON.parse(d);
                            if (rst.ErrorCode === "0") {
                                status = true;
                                return true;
                            } else {
                                alert(rst.ErrorMessage);
                                return false;
                            }
                        } catch (e) {
                            alert(e);
                            return false;
                        }
                    },
                    error: function () {
                        alert("e");
                        return false;
                    }
                });
                return status;
            });

            $(".new-project").click(function () {
                
                var projectId = $.getUrlParam(document.location.href, "projectId");
                var isPrompt = false;
                $.ajax({
                    url: "./Actions/GetMaxSubId.aspx?type=2&projectId=" + projectId,
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (d) {
                        try {
                            if (d === "0") {
                                isPrompt = false;
                            } else {
                                isPrompt = true;
                            }
                        } catch (e) {
                            alert(e);
                            return false;
                        }
                    },
                    error: function () {
                        alert("Error.");
                        return false;
                    }
                });
                if (isPrompt) {
                    $("#modalDialog-new-project-confirm").modal('show');
                    return false;
                } else {
                    // 跳转到项目类型选择窗口
                    $("#modalDialog-new-project-select-project-type").modal('show');
                    return false;
                }
            });

            $("#modalDialog-new-project-confirm .btn-success").click(function () {
                window.location.href = $(".new-project").attr("href");
            });

            $("#btnContinue").click(function () { // modalDialog-new-project-confirm.btnContinue
                var url = "<%=string.Format("{0}Project/Actions/CreateProjectX.aspx?projectId={1}&flg=1", this.ResolveUrl("~"), Request["projectId"]) %>";
                window.location.href = url + "&projectType=" + $("#projectType").val();
            });

            $("#btnStandalone").click(function () {
                window.location.href = "<%=string.Format("{0}Project/Actions/CreateProjectX.aspx?projectId={1}&flg=1&projectType=Standalone", this.ResolveUrl("~"), Request["projectId"]) %>"
                return false;
            });

            $("#btnWorkshare").click(function () {
                window.location.href = "<%=string.Format("{0}Project/Actions/CreateProjectX.aspx?projectId={1}&flg=1&projectType=Workshare", this.ResolveUrl("~"), Request["projectId"]) %>"
                return false;
            });

            // === 系统初始化 ===
            $(".menu-projectinitialization").addClass("active");
            $(".header tr:last").click();
        });
    </script>
</body>
</html>
