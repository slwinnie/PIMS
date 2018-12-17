<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Security.Cryptography.Xml" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/Workbench/LeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
<%
    var iProjectId = Convert.ToInt32(Request["projectId"]);
    var iSubId = Convert.ToInt32(Request["subId"]);
    var iEmployeeId = Convert.ToInt32(Request["EmployeeId"]);
    if (Request["async"] != null)
    {
        var t = Request["type"].ToString();
        var db = new PPPEntities();
        var f = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId
                                         && x.SubId == iSubId
                                         && x.FormType == "Risk1"
                                         && x.EmployeeId == iEmployeeId);
        if (f != null)
        {
            f.Comments = Server.UrlDecode(Request["comments"]);

            GetRisk1FormNextAppover(Request["projectId"], Request["subId"], t);
            f.Status = "Approved";

            #region Modify Signature & Date
            var empId = Request["EmployeeId"];
            var risk = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == iProjectId
                                         && x.SubId == iSubId
                                         && x.type == "1");
            if (risk != null)
            {
                //risk.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());

                if (risk.t5 == empId)
                {
                    risk.t7 = SystemHelper.GetUserName(SystemHelper.DomainUserName());
                    risk.t8 = StringHelper.FmtDate(DateTime.Now);
                    if (risk.t7 == risk.RejectBy)
                    {
                        risk.RejectBy = string.Empty;
                        risk.RejectComment = string.Empty;
                    }
                }
                if (risk.t13 == empId)
                {
                    risk.t15 = SystemHelper.GetUserName(SystemHelper.DomainUserName());
                    risk.t16 = StringHelper.FmtDate(DateTime.Now);
                    if (risk.t15 == risk.RejectBy)
                    {
                        risk.RejectBy = string.Empty;
                        risk.RejectComment = string.Empty;
                    }
                }
                if (risk.t17 == empId)
                {
                    risk.t19 = SystemHelper.GetUserName(SystemHelper.DomainUserName());
                    risk.t20 = StringHelper.FmtDate(DateTime.Now);
                    if (risk.t19 == risk.RejectBy)
                    {
                        risk.RejectBy = string.Empty;
                        risk.RejectComment = string.Empty;
                    }
                }
            }
            #endregion
            db.SaveChanges();
        }
        Response.End();
        return;
    }

%>
<!DOCTYPE html>

<script runat="server">
    string syHidden = "";
    private void form1_OnLoad(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            var iprojectId = Convert.ToInt32(Request["projectId"]);
            var isubId = Convert.ToInt32(Request["subId"]);
            type.Value = Request["type"];
            projectId.Value = Request["projectId"];
            subId.Value = Request["subId"];
            var db = new PPPEntities();

            var t = Request["type"];
            var item = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId && x.type == t);
            if (item != null)
            {
                t1.Value = item.t1;
                t2.Value = item.t2;
                t3.Value = item.t3;
                t4.Value = item.t4;
                t5.Value = PeopleHelper.GetPeopleName(item.t5);
                t6.Value = item.t6;
                t7.Value = item.t7;
                t8.Value = item.t8;
                t9.Value = PeopleHelper.GetPeopleName(item.t9);
                t10.Value = item.t10;
                t11.Value = item.t11;
                t12.Value = item.t12;
                t13.Value = PeopleHelper.GetPeopleName(item.t13);
                t14.Value = item.t14;
                t15.Value = item.t15;
                t16.Value = item.t16;
                t17.Value = PeopleHelper.GetPeopleName(item.t17);
                t18.Value = item.t18;
                t19.Value = item.t19;
                t20.Value = item.t20;
                t21.Value = item.t21;
                t22.Value = item.t22;
                t23.Value = item.t23;
                t24.Value = item.t24;
                t25.Value = item.t25;
                t26.Value = item.t26;
                t27.Value = item.t27;
                t28.Value = item.t28;
                t29.Value = item.t29;
                t30.Value = item.t30;
                t31.Value = item.t31;
                t32.Value = item.t32;
                t33.Value = item.t33;
                t34.Value = item.t34;
                t35.Value = item.t35;
                t36.Value = item.t36;
                t37.Value = item.t37;
                t38.Value = item.t38;
                t39.Value = item.t39;
                t40.Value = item.t40;
                t41.Value = item.t41;
                t42.Value = item.t42;
                t43.Value = item.t43;
                t44.Value = item.t44;
                t45.Value = item.t45;
                t46.Value = item.t46;
                t47.Value = item.t47;
                t48.Value = item.t48;
                t49.Value = item.t49;
                t50.Value = item.t50;
                t51.Value = item.t51;
                t52.Value = item.t52;
                t53.Value = item.t53;
                t54.Value = item.t54;
                t55.Value = item.t55;
                t56.Value = item.t56;
                t57.Value = item.t57;
                t58.Value = item.t58;
                t59.Value = item.t59;
                t60.Value = item.t60;
                t61.Value = item.t61;
                t62.Value = item.t62;
                t63.Value = item.t63;
                t64.Value = item.t64;
                t65.Value = item.t65;
                t66.Value = item.t66;
                t67.Value = item.t67;
                t68.Value = item.t68;
                t69.Value = item.t69;
                t70.Value = item.t70;
                t71.Value = item.t71;
                t72.Value = item.t72;
                t73.Value = item.t73;
                t74.Value = item.t74;
                t75.Value = item.t75;
                t76.Value = item.t76;

                t77.Value = item.t77;
                t78.Value = item.t78;
                t79.Value = item.t79;
                t80.Value = item.t80;
                t81.Value = item.t81;
                t82.Value = item.t82;
                t83.Value = item.t83;
                t84.Value = item.t84;
                t85.Value = item.t85;

                c1.Checked = item.c1 == "true";
                c2.Checked = item.c2 == "true";
                c3.Checked = item.c3 == "true";
                c4.Checked = item.c4 == "true";
                c5.Checked = item.c5 == "true";
                c6.Checked = item.c6 == "true";
                c7.Checked = item.c7 == "true";

                r1.Value = item.r1;
                r2.Value = item.r2;
                r3.Value = item.r3;
                r4.Value = item.r4;
                r5.Value = item.r5;
                r6.Value = item.r6;
                r7.Value = item.r7;
                r8.Value = item.r8;
                r9.Value = item.r9;
                r10.Value = item.r10;
                r11.Value = item.r11;
                r12.Value = item.r12;
                r13.Value = item.r13;
                r14.Value = item.r14;
                r15.Value = item.r15;
                r16.Value = item.r16;
                r17.Value = item.r17;
                r18.Value = item.r18;
                r19.Value = item.r19;
                r20.Value = item.r20;
                r21.Value = item.r21;

                r22.Value = item.r22;
                r23.Value = item.r23;
                r24.Value = item.r24;

                s1.Value = item.s1;
                s2.Value = item.s2;
                s3.Value = item.s3;
                s4.Value = item.s4;
                s5.Value = item.s5;
                s6.Value = item.s6;
                s7.Value = item.s7;
                s8.Value = item.s8;
                s9.Value = item.s9;
                s10.Value = item.s10;
                s11.Value = item.s11;
                s12.Value = item.s12;
                s13.Value = item.s13;
                s14.Value = item.s14;
                s15.Value = item.s15;
                s16.Value = item.s16;
                s17.Value = item.s17;
                s18.Value = item.s18;
                s19.Value = item.s19;
                s20.Value = item.s20;
                s21.Value = item.s21;

                s22.Value = item.s22;
                s23.Value = item.s23;
                s24.Value = item.s24;
                projectRisk.Value = item.projectRisk;

                db.SaveChanges();
            }

            var emploeeId = SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()).ToString();
            var approvalInfo = db.TApproval.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId
                && x.EmployeeId.ToString() == emploeeId && x.FormType == (t == "1" ? "Risk1" : "Risk2"));
            if (approvalInfo != null)
            {
                t100.Value = approvalInfo.Comments;
                status.InnerText = approvalInfo.Status;
                if (approvalInfo.Status == "Approved" || approvalInfo.Status == "Rejected")
                {
                    syHidden = string.Format("style='visibility:hidden;'");
                    t100.Attributes.Add("readonly", "readonly");
                }
            }
        }
    }

    private void GetRisk1FormNextAppover(string pProjectId, string pSubId, string t)
    {
        var db = new PPPEntities();
        var iPprojectId = Convert.ToInt32(pProjectId);
        var iPsubId = Convert.ToInt32(pSubId);
        var frm = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.type == t);
        var iEmployeeId = -1;
        var endApprove = false;
        if (frm != null)
        {
            #region Init
            var formType = (Request["type"] == "1" ? "Risk1" :"Risk2");
            var L1 = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.FormType == formType && x.EmployeeId.ToString() == frm.t5);
            var L2 = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.FormType == formType && x.EmployeeId.ToString() == frm.t9);
            var L3 = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.FormType == formType && x.EmployeeId.ToString() == frm.t13);
            var L4 = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.FormType == formType && x.EmployeeId.ToString() == frm.t17);
            bool isL3AppendNew = false;
            if (formType == "Risk1" && L1 != null && L1.Status == "New")
            {
                L1.Status = "Approved";
                L1.ApprovedDate = DateTime.Now;
                if (!string.IsNullOrEmpty(frm.t13)) // ALL Risk Classification Forms
                {
                    L3 = new TApproval();
                    L3.ProjectId = iPprojectId;
                    L3.SubId = iPsubId;
                    L3.FormType = formType;
                    L3.EmployeeId = Convert.ToInt32(frm.t13);
                    L3.Status = "New";
                    L3.CreatedDate = DateTime.Now;
                    db.TApproval.Add(L3);
                    iEmployeeId = L3.EmployeeId;
                    isL3AppendNew = true;
                }
            }
            if (formType == "Risk2" && L2 != null &&  L2.Status == "New")
            {
                L2.Status = "Approved";
                L2.ApprovedDate = DateTime.Now;
                if (!string.IsNullOrEmpty(frm.t13)) // ALL Risk Classification Forms
                {
                    L3 = new TApproval();
                    L3.ProjectId = iPprojectId;
                    L3.SubId = iPsubId;
                    L3.FormType = formType;
                    L3.EmployeeId = Convert.ToInt32(frm.t13);
                    L3.Status = "New";
                    L3.CreatedDate = DateTime.Now;
                    db.TApproval.Add(L3);
                    iEmployeeId = L3.EmployeeId;
                    isL3AppendNew = true;
                }
            }
            if (L3 != null && L3.Status == "New" && !isL3AppendNew)
            {
                L3.Status = "Approved";
                L3.ApprovedDate = DateTime.Now;

                if (!string.IsNullOrEmpty(frm.t17))
                {
                    L4 = new TApproval();
                    L4.ProjectId = iPprojectId;
                    L4.SubId = iPsubId;
                    L4.FormType = formType;
                    L4.EmployeeId = Convert.ToInt32(frm.t17);
                    L4.Status = "New";
                    L4.CreatedDate = DateTime.Now;
                    db.TApproval.Add(L4);
                    iEmployeeId = L4.EmployeeId;
                }
                else
                {
                    endApprove = true;
                }
            }
            if (!endApprove && L3.Status == "Approved" && L4 != null && L4.Status == "New")
            {
                L4.Status = "Approved";
                L4.ApprovedDate = DateTime.Now;
                endApprove = true;
            }
            else
            {
                //endApprove = true;
            }
            if (endApprove)
            {
                // 批复完成
                var f = db.TProposalX.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId);
                if (f != null)
                {
                    f.RiskApproveDate = DateTime.Now;
                    if (f.NPISApproveDate != null && f.BidSubmitDate != null)
                    {
                        f.Status = "Approved";
                    }
                }
            }
            #endregion

            db.SaveChanges();

            #region Send Email
            if (iEmployeeId != -1)
            {

                var sys = db.SystemEMail.First();
                var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
                var emialTo = acc.Email;
                var subject = string.Format("Approval/Submission Reminder for {0} Risk", pProjectId);
                var loginUrl = string.Format("{0}://{1}:{2}{3}?employeeId={4}", Request.Url.Scheme, Request.Url.Host, Request.Url.Port, string.Format("{0}Default.aspx", ResolveUrl("~")), iEmployeeId);
                var emailContent = string.Format("<p>Risk Classification Form for project {0} is ready for approval. Please click <a href='{1}' target='_blank'>here</a>.</p><p style='color:gray;'>This is a system generated email from PIMs Online. Please do not reply to this email. </p>", pProjectId, loginUrl);

                var strSmtpServer = sys.Smtp;
                var strFrom = sys.Sender;
                var strFromPass = sys.Password;
                var strTo = emialTo;
                var strSubject = subject;
                var strBody = emailContent;

                var client = new SmtpClient(strSmtpServer);
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
                client.DeliveryMethod = SmtpDeliveryMethod.Network;

                var message = new MailMessage(strFrom, strTo, strSubject, strBody);
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                client.Send(message);
            }
            #endregion
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Forms/css/riskForm.css") %>"/>

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Forms/js/riskForm.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Project/js/project.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <style>
        .riskTable {
            font-size: small;
            table-layout: fixed; 
            /*word-break: break-all;*/
            word-wrap: break-word;
        }
        .risk-level-low {
            background-color: darkgreen;
            color: white;
        }
        .risk-level-moderate {
            background-color: darkorange;
            color: white;
        }
        .risk-level-high {
            background-color: red;
            color: white;
        }
        #projectRisk:hover {
            color: black;
        }
    </style>
    <script>
        $(function() {
            $("#approve").click(function () {
                $.ajax({
                    url: '<%=this.ResolveUrl("~")%>Workbench/Forms/Risk1Form4Approval.aspx?async=1&projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&employeeId=<%=SystemHelper.GetEmployeeId(SystemHelper.DomainUserName())%>&type=1&comments=" + encodeURIComponent($("#t100").val()),
                    type: "post",
                    datatype: "json",
                    success:function() {
                        window.location.href = "../RiskForm-Proposal.aspx";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        /*弹出jqXHR对象的信息*/
                        alert(jqXHR.responseText);

                    }
                });
                return false;
            });
            $("#reject").click(function () {
                $.ajax({
                    url: '<%=this.ResolveUrl("~")%>Workbench/Actions/RiskReject.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&employeeId=<%=SystemHelper.GetEmployeeId(SystemHelper.DomainUserName())%>&type=" + $("#type").val() + "&comments=" + encodeURIComponent($("#t100").val()),
                    type: "post",
                    datatype: "json",
                    success:function() {
                        window.location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        /*弹出jqXHR对象的信息*/
                        alert(jqXHR.status);
                    }
                });
                return false;

            });
            $.fn.ChangeStyle = function () {
                if ($(this).val() === "Low") {
                    $(this).removeClass("risk-level-low").removeClass("risk-level-moderate").removeClass("risk-level-high").addClass("risk-level-low");
                } if ($(this).val() === "Moderate") {
                    $(this).removeClass("risk-level-low").removeClass("risk-level-moderate").removeClass("risk-level-high").addClass("risk-level-moderate");
                } else if ($(this).val() === "High") {
                    $(this).removeClass("risk-level-low").removeClass("risk-level-moderate").removeClass("risk-level-high").addClass("risk-level-high");
                }
            }
            $("#t21").ChangeStyle();
            $("#t24").ChangeStyle();
            $("#t27").ChangeStyle();
            $("#t30").ChangeStyle();
            $("#t33").ChangeStyle();
            $("#t36").ChangeStyle();
            $("#t39").ChangeStyle();
            $("#t42").ChangeStyle();
            $("#t45").ChangeStyle();
            $("#t48").ChangeStyle();
            $("#t51").ChangeStyle();
            $("#t54").ChangeStyle();
            $("#t57").ChangeStyle();
            $("#t60").ChangeStyle();
            $("#t77").ChangeStyle();
            $("#t80").ChangeStyle();
            $("#t83").ChangeStyle();
            $("#projectRisk").ChangeStyle();

            $("textarea").attr('disabled', 'disabled');
            $("input").attr('disabled', 'disabled');
            return false;
        })
    </script>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
	<div class="container">
    	<div class="col col-lg-4 col-md-4">
            <uc1:LeftMenu runat="server" ID="LeftMenu" />
        </div>
        <div class="col col-lg-8 col-md-8 shadow">
<strong>PIMS</strong> > <a href="/Workbench/Default.aspx" class=" btn-default btn-create">My Approval</a> > Risk Classification Form - Proposal<p></p>
    <div>
   		<h2 class="text-center">Risk Classification Form<sup runat="server" id="status" style="color: red" class="pull-right"></sup></h2>

        <div class="text-center"><span class="text-center prompt"> CRF-0008 WORLEYPARSONS Rev 40 </span></div>
		<div class="SectionName">Project/Proposal Detail</div>
		<table class="fullTable" style="border:0px solid rosybrown; ">
			<tr>
				<td width="302" class="risk-detail-title">Project/Proposal Name:</td>
				<td colspan="4" class="underline"><input type="text" id="t1" runat="server" class="text-input"/></td>
			</tr>
			<tr>
				<td class="risk-detail-title">Project/Proposal Description:</td>
				<td colspan="4" class="underline"><input type="text" id="t2" runat="server" class="text-input"/></td>
			</tr>
			<tr>
				<td class="risk-detail-title">Project/Proposal Number:</td>
				<td colspan="2" class="underline"><input type="text" id="t3" runat="server" class="text-input"/></td>
				<td width="78">Revision:</td>
				<td colspan="1" class="underline"><input type="text" id="t4" runat="server" class="text-input"/></td>
			</tr>
			<tr>
				<td class="risk-detail-title">Project/Proposal Stage:</td>
				<td><label><input type="checkbox" id="c1" runat="server" class="cb-style" />Proposal</label></td>
				<td><label><input type="checkbox" id="c2" runat="server" class="cb-style" />Project Award</label></td>
				<td colspan="2"><label><input type="checkbox" id="c3" runat="server" class="cb-style" />Start of new phase/significant project change</label></td>
			</tr>
			<tr>
				<td class="risk-detail-title">Business Line/s involved in the poject:</td>
				<td><label><input type="checkbox" id="c4" runat="server" class="cb-style" />Services</label></td>
				<td><label><input type="checkbox" id="c5" runat="server" class="cb-style" />Major Projects</label></td>
				<td><label><input type="checkbox" id="c6" runat="server" class="cb-style" />Improve</label></td>
                <td><label><input type="checkbox" id="c7" runat="server" class="cb-style" />Advisian</label></td>
			</tr>
		</table>
        <div class="SectionName">Endorsement and Sign-Off</div>
        <table class="fullTable" id="OverallRiskClassification"><tr><td width="17%">Overall Risk Classification</td><td width="83%">
            <input type="text" id="projectRisk" runat="server" class="text-input" readonly="readonly"/>
        </td></tr></table>
        <table class="fullTable" border="1">
  <tr>
    <td rowspan="2" class="overall-risk-classification-title"><strong>PROPOSAL STAGE:</strong><br>Verified as complete & correct by the Proposal Manager					
</td>
    <td class="underline">
        <input type="text" id="t5" runat="server" class="text-input"/>
        <div  class="search-people-result"></div>
    </td>
    <td class="underline"><input type="text" id="t6" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t7" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t8" runat="server" class="text-input"/></td>
  </tr>
  <tr>
    <td valign="top">Name</td>
    <td valign="top">Title</td>
    <td valign="top">Signature</td>
    <td valign="top">Date</td>
  </tr>

  <tr>
    <td rowspan="2" class="overall-risk-classification-title"><strong>PROJECT AWARD, NEW PHASE, or SIGNIFICANT CHANGE: </strong><br>Verified as complete & correct by the Project Manager/Project Director					
</td>
    <td class="underline">
        <input type="text" id="t9" runat="server" class="text-input"/>
        <div  class="search-people-result"></div>
    </td>
    <td class="underline"><input type="text" id="t10" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t11" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t12" runat="server" class="text-input"/></td>
  </tr>
  <tr>
    <td valign="top">Name</td>
    <td valign="top">Title</td>
    <td valign="top">Signature</td>
    <td valign="top">Date</td>
  </tr>
  
  <tr>
    <td rowspan="2" class="overall-risk-classification-title"><strong>ALL Risk Classification Forms: </strong><br>Reviewed & Endorsed by:
 Location Manager /As per the Location Delegation of Authority (as detailed in the Location Business Plan) or 
Advisian Location Manager/Country Manager or 
Improve Relationship Manager or
 Manager of Major Projects
</td>
    <td class="underline">
        <input type="text" id="t13" runat="server" class="text-input"/>
        <div  class="search-people-result"></div>
    </td>
    <td class="underline"><input type="text" id="t14" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t15" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t16" runat="server" class="text-input"/></td>
  </tr>
  <tr>
    <td valign="top">Name</td>
    <td valign="top">Title</td>
    <td valign="top">Signature</td>
    <td valign="top">Date</td>
  </tr>
  
  <tr>
    <td rowspan="2" class="overall-risk-classification-title"><strong>ALL High Risk Classifications: </strong><br>Reviewed & Endorsed as appropriate for the business line - Location Director/ Regional Advisian Director/Improve Director/ Manager of Major Projects			
</td>
    <td class="underline">
        <input type="text" id="t17" runat="server" class="text-input"/>
        <div  class="search-people-result"></div>
    </td>
    <td class="underline"><input type="text" id="t18" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t19" runat="server" class="text-input"/></td>
    <td class="underline"><input type="text" id="t20" runat="server" class="text-input"/></td>
  </tr>
  <tr>
    <td valign="top">Name</td>
    <td valign="top">Title</td>
    <td valign="top">Signature</td>
    <td valign="top">Date</td>
  </tr>
</table>
<div class="SectionName">1.Risk Classification & Required Actions</div>
<table class="fullTable risk1" border="1" >
<thead>
	<tr>
    	<th width="100" rowspan="2">Area</th>
        <th width="400" rowspan="2">Scenario</th>
        <th width="400" rowspan="2">Required Actions</th>
        <th rowspan="2">Risk<br/>Rating</th>
        <th colspan="2">Follow-Up Tracking</th>
    </tr>
	<tr>
    	<th>Item Completed?</th><th>Completed by & Date</th>
    </tr>
</thead>
<tbody>
  <tr>
    <td class="risk1-Title">Health, Safety & Environment (HSE)
    </td>
    <td><textarea id="s1" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="r1" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t21" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t22" class="RS" runat="server"></textarea></td>
    <td><textarea id="t23" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
    <td class="risk1-Title">
R3 (Security & Emergency) & Travel
    </td>
    <td><textarea name="s" readonly="readonly" class="RS" runat="server" id="s2"></textarea>
    </td>
    <td><textarea name="r" readonly="readonly" class="RS" runat="server" id="r2"></textarea></td>
    <td><textarea id="t24" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t25" class="RS" runat="server"></textarea></td>
    <td><textarea id="t26" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
    <td class="risk1-Title">Contract Size
    </td>
    <td><textarea name="s2" readonly="readonly" class="RS" runat="server" id="s3"></textarea></td>
    <td><textarea name="r2" readonly="readonly" class="RS" runat="server" id="r3"></textarea></td>
    <td><textarea id="t27" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t28" class="RS" runat="server"></textarea></td>
    <td><textarea id="t29" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Delegation of Authority
  	</td>
  	<td><textarea name="s3" readonly="readonly" class="RS" runat="server" id="s4"></textarea></td>
  	<td><textarea name="r3" readonly="readonly" class="RS" runat="server" id="r4"></textarea></td>
    <td><textarea id="t30" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t31" class="RS" runat="server"></textarea></td>
    <td><textarea id="t32" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Customer Credit Worthiness
  	</td>
  	<td><textarea name="s4" readonly="readonly" class="RS" runat="server" id="s5"></textarea></td>
  	<td><textarea name="r4" readonly="readonly" class="RS" runat="server" id="r5"></textarea></td>
    <td><textarea id="t33" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t34" class="RS" runat="server"></textarea></td>
    <td><textarea id="t35" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Cash Flow
  	</td>
  	<td><textarea name="s5" readonly="readonly" class="RS" runat="server" id="s6"></textarea></td>
  	<td><textarea name="r5" readonly="readonly" class="RS" runat="server" id="r6"></textarea></td>
    <td><textarea id="t36" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t37" class="RS" runat="server"></textarea></td>
    <td><textarea id="t38" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Capital Cost Estimating
  	</td>
  	<td><textarea name="s6" readonly="readonly" class="RS" runat="server" id="s7"></textarea></td>
  	<td><textarea name="r6" readonly="readonly" class="RS" runat="server" id="r7"></textarea></td>
    <td><textarea id="t39" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t40" class="RS" runat="server"></textarea></td>
    <td><textarea id="t41" class="RS" runat="server"></textarea></td>
  </tr>

  <tr>
  	<td class="risk1-Title">Ethical business practices
  	</td>
  	<td><textarea name="s22" readonly="readonly" class="RS" runat="server" id="s22"></textarea></td>
  	<td><textarea name="r22" readonly="readonly" class="RS" runat="server" id="r22"></textarea></td>
    <td><textarea id="t77" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t78" class="RS" runat="server"></textarea></td>
    <td><textarea id="t79" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Carbon emissions
  	</td>
  	<td><textarea name="s23" readonly="readonly" class="RS" runat="server" id="s23"></textarea></td>
  	<td><textarea name="r23" readonly="readonly" class="RS" runat="server" id="r23"></textarea></td>
    <td><textarea id="t80" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t81" class="RS" runat="server"></textarea></td>
    <td><textarea id="t82" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Social Licence
  	</td>
  	<td><textarea name="s24" readonly="readonly" class="RS" runat="server" id="s24"></textarea></td>
  	<td><textarea name="r24" readonly="readonly" class="RS" runat="server" id="r24"></textarea></td>
    <td><textarea id="t83" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t84" class="RS" runat="server"></textarea></td>
    <td><textarea id="t85" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Contract Terms and Conditions
  	</td>
  	<td><textarea name="s7" readonly="readonly" class="RS" runat="server" id="s8"></textarea></td>
  	<td><textarea name="r7" readonly="readonly" class="RS" runat="server" id="r8"></textarea></td>
    <td><textarea id="t42" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t43" class="RS" runat="server"></textarea></td>
    <td><textarea id="t44" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Core Competency
  	</td>
  	<td><textarea name="s8" readonly="readonly" class="RS" runat="server" id="s9"></textarea></td>
  	<td><textarea name="r8" readonly="readonly" class="RS" runat="server" id="r9"></textarea></td>
    <td><textarea id="t45" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t46" class="RS" runat="server"></textarea></td>
    <td><textarea id="t47" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Construction Management
</td>
  	<td><textarea name="s9" readonly="readonly" class="RS" runat="server" id="s10"></textarea></td>
  	<td><textarea name="r9" readonly="readonly" class="RS" runat="server" id="r10"></textarea></td>
    <td><textarea id="t48" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t49" class="RS" runat="server"></textarea></td>
    <td><textarea id="t50" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Partners
  	</td>
  	<td><textarea name="s10" readonly="readonly" class="RS" runat="server" id="s11"></textarea></td>
  	<td><textarea name="r10" readonly="readonly" class="RS" runat="server" id="r11"></textarea></td>
    <td><textarea id="t51" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t52" class="RS" runat="server"></textarea></td>
    <td><textarea id="t53" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Procurement of goods and sub-contracts / contracts for services
  	</td>
  	<td><textarea name="s11" readonly="readonly" class="RS" runat="server" id="s12"></textarea></td>
  	<td><textarea name="r11" readonly="readonly" class="RS" runat="server" id="r12"></textarea></td>
    <td><textarea id="t54" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t55" class="RS" runat="server"></textarea></td>
    <td><textarea id="t56" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Media or Public Interest
  	</td>
  	<td><textarea name="s12" readonly="readonly" class="RS" runat="server" id="s13"></textarea></td>
  	<td><textarea name="r12" readonly="readonly" class="RS" runat="server" id="r13"></textarea></td>
    <td><textarea id="t57" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t58" class="RS" runat="server"></textarea></td>
    <td><textarea id="t59" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Trade Sanctions
  	</td>
  	<td><textarea name="s13" readonly="readonly" class="RS" runat="server" id="s14"></textarea></td>
  	<td><textarea name="r13" readonly="readonly" class="RS" runat="server" id="r14"></textarea></td>
    <td><textarea id="t60" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t61" class="RS" runat="server"></textarea></td>
    <td><textarea id="t62" class="RS" runat="server"></textarea></td>
  </tr>
</tbody>
</table>
<div class="SectionName">2.Nofifications and Other Requirements</div>
<table class="fullTable risk2" border="1" >
<thead>
	<tr>
    	<th width="120" rowspan="2">Area</th>
        <th width="400" rowspan="2">Scenario</th>
        <th width="400" rowspan="2">Required Actions</th>
        <th colspan="2">Follow-Up Tracking</th>
    </tr>
	<tr>
    	<th>Item Completed?</th><th>Completed by & Date</th>
    </tr>
</thead>
<tbody>
	<tr>
    	<td class="risk2-Title">Tax
    	</td>
    	<td><textarea name="s14" readonly="readonly" class="RS" runat="server" id="s15"></textarea></td>
    	<td><textarea name="r14" readonly="readonly" class="RS" runat="server" id="r15"></textarea></td>
        <td><textarea id="t63" class="RS" runat="server"></textarea></td>
        <td><textarea id="t64" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
    	<td class="risk2-Title">Exchange Rate
    	</td>
    	<td><textarea name="s15" readonly="readonly" class="RS" runat="server" id="s16"></textarea></td>
    	<td><textarea name="r15" readonly="readonly" class="RS" runat="server" id="r16"></textarea></td>
        <td><textarea id="t65" class="RS" runat="server"></textarea></td>
        <td><textarea id="t66" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
    	<td class="risk2-Title">Confidentiality Agreement
    	</td>
    	<td><textarea name="s16" readonly="readonly" class="RS" runat="server" id="s17"></textarea></td>
    	<td><textarea name="r16" readonly="readonly" class="RS" runat="server" id="r17"></textarea></td>
        <td><textarea id="t67" class="RS" runat="server"></textarea></td>
        <td><textarea id="t68" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
	    <td class="risk2-Title">Deferred Revenue
	    </td>
    	<td><textarea name="s17" readonly="readonly" class="RS" runat="server" id="s18"></textarea></td>
    	<td><textarea name="r17" readonly="readonly" class="RS" runat="server" id="r18"></textarea></td>
        <td><textarea id="t69" class="RS" runat="server"></textarea></td>
        <td><textarea id="t70" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
	    <td class="risk2-Title">Facilitation Payments
	    </td>
    	<td><textarea name="s18" readonly="readonly" class="RS" runat="server" id="s19"></textarea></td>
    	<td><textarea name="r18" readonly="readonly" class="RS" runat="server" id="r19"></textarea></td>
        <td><textarea id="t71" class="RS" runat="server"></textarea></td>
        <td><textarea id="t72" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
	    <td class="risk2-Title">New Jurisdiction
	    </td>
    	<td><textarea name="s19" readonly="readonly" class="RS" runat="server" id="s20"></textarea></td>
    	<td><textarea name="r19" readonly="readonly" class="RS" runat="server" id="r20"></textarea></td>
        <td><textarea id="t73" class="RS" runat="server"></textarea></td>
        <td><textarea id="t74" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
    	<td class="risk2-Title">Nuclear
    	</td>
    	<td><textarea name="s20" readonly="readonly" class="RS" runat="server" id="s21"></textarea></td>
    	<td><textarea name="r20" readonly="readonly" class="RS" runat="server" id="r21"></textarea></td>
        <td><textarea id="t75" class="RS" runat="server"></textarea></td>
        <td><textarea id="t76" class="RS" runat="server"></textarea></td>
    </tr>
</tbody>

</table>

        <label>Comments</label>
        <textarea id="t100" runat="server" class="text-input1" cols="3" rows="3" style="background-color: #FF9; width: 100%" ></textarea>
        <div class="text-center">
            <div class="btn-group">
                <a href="javascript:void(0);" class="btn btn-primary Approve" id="approve" <%=syHidden%>>Approve</a>
                <a href="javascript:void(0);" class="btn btn-warning Reject" id="reject" <%=syHidden%>>Reject</a>
            </div>
        </div>        <br/><br/><br/><br/>
        <input type="hidden" id="projectId" runat="server"/>
        <input type="hidden" id="subId" runat="server"/>
        <input type="hidden" id="type" runat="server"/>
    </div>
</div>
	</div>
    </form>
</body>
</html>
