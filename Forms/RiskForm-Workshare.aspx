﻿<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<!DOCTYPE html>

<script runat="server">

    protected void form1_Load(object sender, EventArgs e)
    {
        if(string.IsNullOrEmpty(Request["projectId"]) || string.IsNullOrEmpty(Request["subId"]))
        {
            Response.Redirect("~/");
        }
        if (!IsPostBack)
        {
            projectId.Value = Request["projectId"];
            subId.Value = Request["subId"];
            var db = new PPPEntities();
            var iprojectId = Convert.ToInt32(projectId.Value);
            var iSubId = Convert.ToInt32(subId.Value);
            var item = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == iSubId);
            if (item == null)
            {
                // Create default.
                var riskWorkShareForm = new TRiskWorkshare();
                riskWorkShareForm.ProjectId = iprojectId;
                riskWorkShareForm.SubId = iSubId;
                riskWorkShareForm.type = "2";
                riskWorkShareForm.c1 = "false";
                riskWorkShareForm.c2 = "false";
                riskWorkShareForm.c3 = "false";
                riskWorkShareForm.c4 = "false";
                riskWorkShareForm.c5 = "false";
                riskWorkShareForm.c6 = "false";
                riskWorkShareForm.c7 = "false";
                riskWorkShareForm.c8 = "false";
                riskWorkShareForm.c9 = "false";
                riskWorkShareForm.c10 = "false";
                riskWorkShareForm.c11 = "false";
                riskWorkShareForm.c12 = "false";
                riskWorkShareForm.c13 = "false";
                riskWorkShareForm.c14 = "false";
                riskWorkShareForm.c15 = "false";
                riskWorkShareForm.c16 = "false";
                riskWorkShareForm.c17 = "false";
                riskWorkShareForm.c18 = "false";
                riskWorkShareForm.c19 = "false";
                riskWorkShareForm.c20 = "false";

                riskWorkShareForm.t1 = "";
                riskWorkShareForm.t2 = "";
                riskWorkShareForm.t3 = "";
                riskWorkShareForm.t4 = "";
                riskWorkShareForm.t5 = "";
                riskWorkShareForm.t6 = "";
                riskWorkShareForm.t7 = "";
                riskWorkShareForm.t8 = "";
                riskWorkShareForm.t9 = "";
                riskWorkShareForm.t10 = "";
                riskWorkShareForm.t11 = ""; // PM
                riskWorkShareForm.t12 = ""; // Signature
                riskWorkShareForm.t13 = ""; // Signature Date

                var pi = db.TProjectX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == iSubId);
                if (pi != null)
                {
                    riskWorkShareForm.t11 = pi.ProjectManagerId.ToString();
                }
                db.TRiskWorkshare.Add(riskWorkShareForm);
                db.SaveChanges();
            }
            else
            {
                t1.Value = item.t1;
                t2.Value = item.t2;
                t3.Value = item.t3;
                t4.Value = item.t4;
                t5.Value = item.t5;
                t6.Value = item.t6;
                t7.Value = item.t7;
                t8.Value = item.t8;
                t9.Value = item.t9;
                t10.Value = item.t10;
                t11.Value = item.t11;
                t12.Value = item.t12;
                t13.Value = item.t13;
                c1.Checked = item.c1 == "true";
                c2.Checked = item.c2 == "true";
                c3.Checked = item.c3 == "true";
                c4.Checked = item.c4 == "true";
                c5.Checked = item.c5 == "true";
                c6.Checked = item.c6 == "true";
                c7.Checked = item.c7 == "true";
                c8.Checked = item.c8 == "true";
                c9.Checked = item.c9 == "true";
                c10.Checked = item.c10 == "true";
                c11.Checked = item.c11 == "true";
                c12.Checked = item.c12 == "true";
                c13.Checked = item.c13 == "true";
                c14.Checked = item.c14 == "true";
                c15.Checked = item.c15 == "true";
                c16.Checked = item.c16 == "true";
                c17.Checked = item.c17 == "true";
                c18.Checked = item.c18 == "true";
                c19.Checked = item.c19 == "true";
                c20.Checked = item.c20 == "true";
                // Load PM Info.
                if (!string.IsNullOrEmpty(item.t11))
                {
                    var projectManagerId = Convert.ToInt32(item.t11);
                    var ppl = db.TPeople.FirstOrDefault(x => x.EmployeeId == projectManagerId);
                    if (ppl != null)
                    {
                        t11.Value = ppl.PeopleNameEn;
                        t11.Attributes["data-empid"] = projectManagerId.ToString();
                    }
                }
                rejectBy.InnerText = item.RejectBy;
                rejectComments.InnerText = item.RejectComment;
                if (!string.IsNullOrEmpty(item.RejectBy))
                {
                    rejectSection.Visible = true;
                }
                else
                {
                    //rejectSection.Visible = false;
                    rejectSection.Attributes.Add("class", "hidden");
                }
            }
            var isubId = Convert.ToInt32(Request["subId"]);
            var ppx = db.TProjectX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
            if (ppx.RiskSubmitDate != null)
            {
                islocked.Value = "1";
            }
            if (ppx.BidApproveDate != null
                && ppx.RiskApproveDate != null
                && ppx.NPISApproveDate != null)
            {
                isAllApproved.Value = "1";
            }


        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<!-- 不缓存 开始 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="pragma" content="no-cache" /> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="0" />
<!-- 不缓存 结束 -->
    <title></title>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
		<style>
			input{
				width:100%;
			}
			table td{
				border-top:0px dotted black !important;
			}
			.input-group-checkbox input{
				width: 20px;
			}
			table label{
				font-weight: normal !important;
				display: inline-block !important;
			}
			.tr-top-double{
				border-top:3px double black;
				border-color:gray;
			}
			.tr-bottom-double{
				border-bottom:3px double black;
				border-color:gray;
			}
			div.SectionName{
				background:lightgray;padding:10px;
				font-weight:bold;
			}
		</style>
</head>
<body>
    <form id="form1" runat="server" onload="form1_Load">
    <div>
        <!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" ID="Menu" />
        <!-- 导航菜单::结束 -->
        <!-- 导航地图::开始 -->
        <div>
            <strong>PIMS</strong> > <a href="../Project/Default.aspx">Project Initiation</a> > 
            <a href="../Project/ProjectInitiation.aspx?projectId=<%= Request["projectId"] %>">Project</a> > Workshare Risk Prompt List
        </div>
        <!-- 导航地图::结束 -->
		<div class="container">
			<h2 class="text-center">WORKSHARE RISK PROMPT LIST</h2>
			<p class="text-center small">Rev 0(12-Nov-12)</p><p>&nbsp;</p>

            <div class="text-right">
                <div class="btn-group">
                    <a href="javascript:void(0);" class="btn btn-primary save-change">Save change</a>
                    <a href="javascript:void(0);" class="btn btn-default ready-for-approval">Ready for Approval</a>
                    <a href="javascript:void(0);" class="btn btn-default expediting">Expediting</a>
                    <a href="javascript:void(0);" class="btn btn-default reverse">Reverse</a>
                </div>
            </div>

			<div class="col col-sm-12 col-md-12 col-lg-12">
				<div style="border-top:1px solid black;border-bottom: 1px solid black;height: auto;">
This checklist is based on the <strong style="text-decoration:underline;">Workshare Risk Management Guideline (CRP-0037)</strong> and is used to determine requirements for Support Office (SO) risk management. It shall be completed by the SO Proposal or Project Manager at bid, project award and subsequent new phases or significant project change. Please use in conjunction with <strong style="text-decoration:underline;">Workshare Risk Management Guideline (CRP-0037)</strong>
				</div>
			</div>
			<p>&nbsp;</p>
			<table class="table table-condensed" >
				<tr>
					<td>SO Project No.</td>
					<td><input type="text" id="t1" runat="server" /></td>
					<td>IEWO No.</td>
					<td><input type="text" id="t2" runat="server" /></td>
					<td style="width: 80px;">Rev. No.</td>
					<td style="width: 80px;"><input type="text" id="t3" runat="server" /></td>
				</tr>
				<tr>
					<td>SO Project Title</td>
					<td colspan="5"><input type="text" id="t4" runat="server" /></td>
				</tr>
				<tr>
					<td>Customer</td>
					<td><input type="text" id="t5" runat="server" /></td>
					<td>Home Office</td>
					<td colspan="3"><input type="text" id="t6" runat="server" /></td>
				</tr>
				<tr>
					<td colspan="3">Risk Classification (per HO risk classification form)</td>
					<td colspan="3" class="input-group-checkbox">
						<label><input type="checkbox" id='c1' runat="server" /> High</label> <label><input type="checkbox" id='c2' runat="server" /> Moderate</label><label><input type="checkbox" id='c3' runat="server" /> Low</label>
					</td>
				</tr>
				<tr>
					<td>Project Location</td>
					<td><input type="text" id="t7" runat="server" /></td>
					<td>SO Work Location</td>
					<td colspan="3"><input type="text" id="t8" runat="server" /></td>
				</tr>
				<tr>
					<td>SO Scope</td>
					<td colspan="5"><input type="text" id="t9" runat="server" /></td>
				</tr>
				<tr>
					<td>SO Proposal/<br/>
						Project Status</td>
					<td colspan="5" class="input-group-checkbox">
						<label><input type="checkbox" id="c4" runat="server" /> Proposal Commencement</label>
						<label><input type="checkbox" id='c5' runat="server" /> At Project Award</label>
						<label><input type="checkbox" id='c6' runat="server" /> Start of New Phase or Significant Project Change</label>
					</td>
				</tr>
			</table>
			<table class="table table-condensed">
				<tr class="tr-top-double">
					<td colspan="4">
						It is expected that a SO Risk Management workshop will be required if one or more of the following apply:
					</td>
				</tr>
				<tr>
					<td>1.</td>
					<td>The SO's estimated execution hours exceed 15,000 man hours or USD500K.</td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c7" runat="server" /> No</label></td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c8" runat="server" /> Yes</label></td>
				</tr>
				<tr>
					<td>2.</td>
					<td>The SO's activities are on project schedule critical path.</td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c9" runat="server" /> No</label></td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c10" runat="server" /> Yes</label></td>
				</tr>
				<tr>
					<td>3.</td>
					<td>The SO's deliverables represent 20% or more of total budget.</td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c11" runat="server" /> No</label></td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c12" runat="server" /> Yes</label></td>
				</tr>
				<tr>
					<td>4.</td>
					<td>The SO's scope of work is not considered part of their core capability or SO plans to subcontract out some services <br/>(this would also cover using engineering systems new to SO).</td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c13" runat="server" /> No</label></td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c14" runat="server" /> Yes</label></td>
				</tr>
				<tr>
					<td>5.</td>
					<td>The SO’s scope of work is expected to materially increase as the project progresses.</td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c15" runat="server" /> No</label></td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c16" runat="server" /> Yes</label></td>
				</tr>
				<tr>
					<td>6.</td>
					<td>The SO’s scope of work is being executed as a lump sum to the HO.</td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c17" runat="server" /> No</label></td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c18" runat="server" /> Yes</label></td>
				</tr>
				<tr>
					<td>7.</td>
					<td>It is the first Workshare package between HO and SO (ie. HO and SO have no prior Workshare experience with each other). <br/>There is a need to consider differences in business culture and established work practices.</td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c19" runat="server" /> No</label></td>
					<td class="input-group-checkbox"><label><input type="checkbox" id="c20" runat="server" /> Yes</label></td>
				</tr>
				<tr>
					<td colspan="4">
						If the project is not planning to conduct a SO Risk Management workshop, and the response to any of the items 1 to 7 above is “Yes”, then provide explanation: 
					</td>
				</tr>
				<tr class="tr-bottom-double">
					<td colspan="4">
						<textarea type="text" id="t10" style="width: 100%; height: 4em;" runat="server" ></textarea>
					</td>
				</tr>
			</table>
			<table class="table table-condensed">
				<tr >
					<td colspan="6">
						<strong>Project/Proposal Manager:</strong> The information in this form is accurate and correctly reflects the Workshare project to which the form refers:
					</td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><input type="text" id="t11" runat="server" />
                        <div  class="search-people-result"></div>
					</td>
					<td>Signature:</td>
					<td><input type="text" id="t12" runat="server" readonly="readonly" disabled="disabled" /></td>
					<td>Date:</td>
					<td><input type="text" id="t13" runat="server" readonly="readonly" disabled="disabled" /></td>
				</tr>
			</table>
            <div class="reject" runat="server" id="rejectSection">
                <div class="SectionName border-left border-right border-top border-bottom">Reject Comments</div>
                <table id="tblReject" class="table table-bordered">
                    <tr>
                        <td style="width:100px;">Reject By</td><td><label id="rejectBy" runat="server">zhenhua.liu</label></td>
                    </tr>
                    <tr>
                        <td>Comments</td>
                        <td><label id="rejectComments" runat="server" style="color:red"></label></td>
                    </tr>
                </table>
            </div>
            <div class="text-right">
                <div class="btn-group">
                    <a href="javascript:void(0);" class="btn btn-primary save-change">Save change</a>
                    <a href="javascript:void(0);" class="btn btn-default ready-for-approval">Ready for Approval</a>
                    <a href="javascript:void(0);" class="btn btn-default expediting">Expediting</a>
                    <a href="javascript:void(0);" class="btn btn-default reverse">Reverse</a>
                </div>
            </div>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
		</div>
    </div>
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-exediting-confirm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Exediting confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm exediting current Workshare Risk Prompt List?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success exediting-confirm">Continue</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
        <input type="hidden" id="projectId" runat="server" />
        <input type="hidden" id="subId" runat="server" />
        <input type="hidden" id="islocked" runat="server" />
        <input type="hidden" id="isAllApproved" runat="server" />
    </form>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/jquery-ui.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script src="js/riskWorkshare.js" ></script>
</body>
</html>
