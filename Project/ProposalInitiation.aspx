<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>

<!DOCTYPE html>

<script runat="server">

    private bool allowOpenProposalNo = true;
    PPPEntities db = new PPPEntities();
    private void form1_OnLoad(object sender, EventArgs e)
    {
        //SystemHelper.SetPageNo(this, "Admin"); 
        //SystemHelper.SessionCheck(this);
        var iProjectId = Convert.ToInt32(Request["ProjectId"]);
        if (iProjectId < 0)
        {
            Response.Redirect("ProjectInitiation.aspx?projectId=" + Request["projectId"]);
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
        .HeaderLinearBackground { 
           background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
         }
        table.project-info td {
            border: 0 solid gray !important;
        }
        .col1, .col2 {
            width: 200px;
        }
        .HeaderLinearBackground th {
            font-weight: normal !important;
        }
        span.remarks {
            color: lightgray;
            font-style: italic;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad"  role="form">

<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <a href="~/Project/Default.aspx" class=" btn-default btn-create" runat="server">Project Initiation</a> > <span>Proposal</span><p></p>
    <div class="container">
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="0">Proposal</li>
    <li class="TabbedPanelsTab" tabindex="1" onclick="javascript:location.href='ProjectInitiation.aspx?projectId=<%=Request["ProjectId"] %>';">Project</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
        <!-- 当前页正文 开始 -->
<div class="btn-group pull-right">
<a href="<%=string.Format("{0}Project/Actions/CreateProposalX.aspx?projectId={1}&flg=1", this.ResolveUrl("~"), Request["projectId"]) %>" class="btn btn-success new-proposal" >New Proposal</a><a href="javascript:void(0)" class="btn btn-primary pull-right" id="SaveChange">Save change</a>
</div>
        <div style="overflow:auto !important; border: 0px solid red; width: 100%">
        <table class="table table-hover table-bordered header" id="SubIDList" style="width: 1500px !important;">
        <thead>
            <tr class="HeaderLinearBackground">
                <th>Sub ID</th>
                <th>Proposal No</th>
                <th>Orignator</th>
                <th>Created Date</th>
                <th>Status</th>
                <th style="width: 260px;">Forms</th>
                <th>Action(s)</th>
                <th>BID/NO BID<br/>Submit Date</th>
                <th>BID/NO BID<br/>Approve Date</th>
                <th>Risk<br/>Submit Date</th>
                <th>Risk<br/>Approve Date</th>
                <th>NPIS<br/>Submit Date</th>
                <th>NPIS<br/>Approve Date</th>
            </tr>
        </thead>
        <tbody>
        <%
            var sb = new StringBuilder();
            var iProjectId = Convert.ToInt32(projectId.Value);
            var p = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId);
            if (p != null)
            {
                PType.Value = p.PType;
            }
            foreach (var v in db.TProposalX.Where(x => x.ProjectId == iProjectId).OrderBy(x => x.SubId))
            {
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td style='padding-left:0;padding-right:0;'>{5}</td><td><div class='btn-group'><a class='btn btn-danger btn-xs' href='javascript:void(0);'>Delete</a></div></td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td></tr>",
                    v.SubId,
                    v.ProposalNo,
                    v.OriginatorId,
                    StringHelper.FmtDate(v.CreatedDate),
                    v.Status,
                    string.Format("<div class='btn-group'><a class='btn btn-primary btn-xs' href='../Forms/BidForm.aspx?projectId={0}&subId={1}&type=1'>BID/NO BID</a><a class='btn btn-warning btn-xs' href='../Forms/RiskForm.aspx?projectId={0}&subId={1}&type=1'>Risk</a><a class='btn btn-info btn-xs' href='../Forms/NPISForm.aspx?projectId={0}&subId={1}&type=1'>NPIS</a><a class='btn btn-success btn-xs open-proposal' href='../Forms/OpenProposal.aspx?projectId={0}&subId={1}' {2}>Open Proposal</a></div>",
                    Request["projectId"], v.SubId, allowOpenProposalNo ? "" : "Disabled='true'"),
                    StringHelper.FmtDate(v.BidSubmitDate),
                    StringHelper.FmtDate(v.BidApproveDate),
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
        </div>
        <table class="table table-hover project-info">
            <tr>
                <td class="col1">CRMT ID</td>
                <td><input type="text" id="txtProjectId" runat="server" class="text-input" readonly="readonly"/></td>
                <td class="col2">Business Unit</td>
                <td><input type="text" id="txtBusinessUnit" runat="server" class="text-input"/></td>
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
                <td>Prospect Status</td>
                <td><input type="text" id="txtProspectStatus" runat="server" class="text-input" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>Bid Due Date <span class="remarks">(yyyy/mm/dd)</span></td>
                <td><input type="text" id="txtBidDueDate" runat="server" class="text-input"/></td>
                <td>Award Date <span class="remarks">(yyyy/mm/dd)</span></td>
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
                <td>Project Manager</td>
                <td><input type="text" id="txtProjectManagerId" runat="server" class="text-input" />
                    <div  class="search-people-result"></div>
                </td>
            </tr>
            <tr class="hidden">
                <td>BID/NO BID Submit Date <span class="remarks">(yyyy/mm/dd)</span></td>
                <td><input type="text" id="txtBidSubmitDate" runat="server" class="text-input" readonly="readonly"/></td>
                <td>BID/NO BID Approve Date <span class="remarks">(yyyy/mm/dd)</span></td>
                <td><input type="text" id="txtBidApproveDate" runat="server" class="text-input" readonly="readonly" /></td>
            </tr>
            <tr class="hidden">
                <td>Risk Submit Date <span class="remarks">(yyyy/mm/dd)</span></td>
                <td><input type="text" id="txtRiskSubmitDate" runat="server" class="text-input" readonly="readonly"/></td>
                <td>Risk Approve Date <span class="remarks">(yyyy/mm/dd)</span></td>
                <td><input type="text" id="txtRiskApproveDate" runat="server" class="text-input" readonly="readonly"/></td>
            </tr>
            <tr class="hidden">
                <td>NPIS Submit Date <span class="remarks">(yyyy/mm/dd)</span></td>
                <td><input type="text" id="txtPifSubmitDate" runat="server" class="text-input" readonly="readonly"/></td>
                <td>NPIS Approve Date <span class="remarks">(yyyy/mm/dd)</span></td>
                <td><input type="text" id="txtpifApproveDate" runat="server" class="text-input" readonly="readonly"/></td>
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
        <!-- 当前页正文 结束 -->
    </div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
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
        <div class="modal " id="modalDialog-new-proposal-confirm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">New Proposal Confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm create a new proposal?</label>
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
    </form>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/jquery-ui.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/SpryTabbedPanels.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Project/js/proposalInitialization.js")%>" ></script>

</body>
</html>
