<%@ Page Language="C#" %>
<%@ Import Namespace="System.Security.Cryptography.Xml" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "Form");
        SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            var iprojectId = Convert.ToInt32(Request["projectId"]);
            var isubId = Convert.ToInt32(Request["subId"]);
            type.Value = Request["type"];
            projectId.Value = Request["projectId"];
            subId.Value = Request["subId"];
            var db = new PPPEntities();

            var pi = db.TProjectX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
            if (pi != null && pi.ProjectType == "Workshare")
            {
                // 跳转到Workshare Risk Form
                Response.Redirect(string.Format("RiskForm-Workshare.aspx?projectId={0}&subId={1}&type={2}", iprojectId, isubId, type.Value));
                return;
            }

            var t = Request["type"];
            var item = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId && x.type == t);
            if (item == null)
            {
                item = new RiskClassificationForm();
                item.ProjectId = iprojectId;
                item.SubId = isubId;
                item.type = Request["type"];
                item.t1 = t1.Value;
                item.t2 = t2.Value;
                item.t3 = t3.Value;
                item.t4 = t4.Value;
                item.t5 = t5.Value;
                item.t6 = t6.Value;
                item.t7 = t7.Value;
                item.t8 = t8.Value;
                item.t9 = t9.Value;
                item.t10 = t10.Value;
                item.t11 = t11.Value;
                item.t12 = t12.Value;
                item.t13 = "13101"; // li.ma
                item.t14 = t14.Value;
                item.t15 = t15.Value;
                item.t16 = t16.Value;
                item.t17 = t17.Value;
                item.t18 = t18.Value;
                item.t19 = t19.Value;
                item.t20 = t20.Value;
                item.t21 = t21.Value;
                item.t22 = t22.Value;
                item.t23 = t23.Value;
                item.t24 = t24.Value;
                item.t25 = t25.Value;
                item.t26 = t26.Value;
                item.t27 = t27.Value;
                item.t28 = t28.Value;
                item.t29 = t29.Value;
                item.t30 = t30.Value;
                item.t31 = t31.Value;
                item.t32 = t32.Value;
                item.t33 = t33.Value;
                item.t34 = t34.Value;
                item.t35 = t35.Value;
                item.t36 = t36.Value;
                item.t37 = t37.Value;
                item.t38 = t38.Value;
                item.t39 = t39.Value;
                item.t40 = t40.Value;
                item.t41 = t41.Value;
                item.t42 = t42.Value;
                item.t43 = t43.Value;
                item.t44 = t44.Value;
                item.t45 = t45.Value;
                item.t46 = t46.Value;
                item.t47 = t47.Value;
                item.t48 = t48.Value;
                item.t49 = t49.Value;
                item.t50 = t50.Value;
                item.t51 = t51.Value;
                item.t52 = t52.Value;
                item.t53 = t53.Value;
                item.t54 = t54.Value;
                item.t55 = t55.Value;
                item.t56 = t56.Value;
                item.t57 = t57.Value;
                item.t58 = t58.Value;
                item.t59 = t59.Value;
                item.t60 = t60.Value;
                item.t61 = t61.Value;
                item.t62 = t62.Value;
                item.t63 = t63.Value;
                item.t64 = t64.Value;
                item.t65 = t65.Value;
                item.t66 = t66.Value;
                item.t67 = t67.Value;
                item.t68 = t68.Value;
                item.t69 = t69.Value;
                item.t70 = t70.Value;
                item.t71 = t71.Value;
                item.t72 = t72.Value;
                item.t73 = t73.Value;
                item.t74 = t74.Value;
                item.t75 = t75.Value;
                item.t76 = t76.Value;

                item.t77 = t77.Value;
                item.t78 = t78.Value;
                item.t79 = t79.Value;
                item.t80 = t80.Value;
                item.t81 = t81.Value;
                item.t82 = t82.Value;
                item.t83 = t83.Value;
                item.t84 = t84.Value;
                item.t85 = t85.Value;

                item.s1 = s1.Value;
                item.s2 = s2.Value;
                item.s3 = s3.Value;
                item.s4 = s4.Value;
                item.s5 = s5.Value;
                item.s6 = s6.Value;
                item.s7 = s7.Value;
                item.s8 = s8.Value;
                item.s9 = s9.Value;
                item.s10 = s10.Value;
                item.s11 = s11.Value;
                item.s12 = s12.Value;
                item.s13 = s13.Value;
                item.s14 = s14.Value;
                item.s15 = s15.Value;
                item.s16 = s16.Value;
                item.s17 = s17.Value;
                item.s18 = s18.Value;
                item.s19 = s19.Value;
                item.s20 = s20.Value;
                item.s21 = s21.Value;

                item.s22 = s22.Value;
                item.s23 = s23.Value;
                item.s24 = s24.Value;

                item.r1 = r1.Value;
                item.r2 = r2.Value;
                item.r3 = r3.Value;
                item.r4 = r4.Value;
                item.r5 = r5.Value;
                item.r6 = r6.Value;
                item.r7 = r7.Value;
                item.r8 = r8.Value;
                item.r9 = r9.Value;
                item.r10 = r10.Value;
                item.r11 = r11.Value;
                item.r12 = r12.Value;
                item.r13 = r13.Value;
                item.r14 = r14.Value;
                item.r15 = r15.Value;
                item.r16 = r16.Value;
                item.r17 = r17.Value;
                item.r18 = r18.Value;
                item.r19 = r19.Value;
                item.r20 = r20.Value;
                item.r21 = r21.Value;

                item.r22 = r22.Value;
                item.r23 = r23.Value;
                item.r24 = r24.Value;
                item.projectRisk = projectRisk.Value;

                db.RiskClassificationForm.Add(item);

                if (type.Value == "1")
                {
                    var projInfo = db.TProposalX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                    if (projInfo != null)
                    {
                        t1.Value = projInfo.ProjectName;
                        t2.Value = projInfo.ProposalDescription;
                        //t3.Value = projInfo.ProjectId.ToString();

                        item.t1 = projInfo.ProjectName;
                        item.t2 = projInfo.ProposalDescription;
                        //item.t3 = projInfo.ProjectId.ToString();
                        if (projInfo.BusinessLine == "Services")
                        {
                            c4.Checked = true;
                            item.c4 = "true";
                        }
                        else if (projInfo.BusinessLine == "Major Projects" || projInfo.BusinessLine.StartsWith("Major"))
                        {
                            c5.Checked = true;
                            item.c5 = "true";
                        }
                        else if (projInfo.BusinessLine == "Improve")
                        {
                            c6.Checked = true;
                            item.c6 = "true";
                        }
                        else if (projInfo.BusinessLine == "Advisian")
                        {
                            c7.Checked = true;
                            item.c7 = "true";
                        }
                    }
                }
                else
                {
                    var projInfo = db.TProjectX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                    if (projInfo != null)
                    {
                        t1.Value = projInfo.ProjectName;
                        t2.Value = projInfo.ProjectDescription;
                        //t3.Value = projInfo.ProjectId.ToString();

                        item.t1 = projInfo.ProjectName;
                        item.t2 = projInfo.ProjectDescription;
                        //item.t3 = projInfo.ProjectId.ToString();
                        if (!string.IsNullOrEmpty(projInfo.BusinessLine))
                        {
                            if (projInfo.BusinessLine == "Services")
                            {
                                c4.Checked = true;
                                item.c4 = "true";
                            }
                            else if (projInfo.BusinessLine == "Major Projects" || projInfo.BusinessLine.StartsWith("Major"))
                            {
                                c5.Checked = true;
                                item.c5 = "true";
                            }
                            else if (projInfo.BusinessLine == "Improve")
                            {
                                c6.Checked = true;
                                item.c6 = "true";
                            }
                            else if (projInfo.BusinessLine == "Advisian")
                            {
                                c7.Checked = true;
                                item.c7 = "true";
                            }
                        }
                    }
                }

                db.SaveChanges();
            }
            else
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
                t13.Value = item.t13;
                t14.Value = item.t14;
                t15.Value = item.t15;
                t16.Value = item.t16;
                //t17.Value = PeopleHelper.GetPeopleName(item.t17);
                t17.Value = item.t17;
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

            if (type.Value == "1")
            {
                var ppx = db.TProposalX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                if (ppx != null)
                {
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
            else
            {
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
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Forms/css/riskForm.css") %>"/>

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/jquery-ui.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Project/js/project.js")%>" ></script>
    <script src="<%=ResolveUrl(string.Format("~/Forms/js/riskForm.js?_={0}", DateTime.Now.Ticks.ToString())) %>")></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
   
    <title><%=SystemHelper.SystemName %></title>
    
    <style>
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
        $(function () {
            $.fn.ChangeStyle = function() {
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
        });
    </script>

</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
    <!-- 导航地图::开始 -->
    <div>
        <% if (Request["type"] == "1")
           {
        %>
            <strong>PIMS</strong> > <a href="../Project/Default.aspx">Project Initiation</a> > <a href="../Project/ProposalInitiation.aspx?projectId=<%=Request["projectId"]%>">Proposal</a> > Risk Classification Form
        <%
           }
           else
           {
            %>
            <strong>PIMS</strong> > <a href="../Project/Default.aspx">Project Initiation</a> > <a href="../Project/ProjectInitiation.aspx?projectId=<%=Request["projectId"]%>">Project</a> > Risk Classification Form
        <%}%>
    </div>
    <!-- 导航地图::结束 -->
    <div class="container">
        <div class="text-right">
            <div class="btn-group">
                <a href="javascript:void(0);" class="btn btn-primary save-change">Save change</a>
                <a href="javascript:void(0);" class="btn btn-default ready-for-approval">Ready for Approval</a>
                <a href="javascript:void(0);" class="btn btn-default expediting">Expediting</a>
                <a href="javascript:void(0);" class="btn btn-default reverse">Reverse</a>
                <% if (Request["type"] == "2")
                   {
                       %><a href="javascript:void(0);" class="btn btn-default copyFromProposal">Copy from proposal</a><%
                   }
                %>
            </div>
        </div>
   		<h2 class="text-center">Risk Classification Form</h2>
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
<%--        <input type="text" id="t13" runat="server" class="text-input"/>
        <div  class="search-people-result"></div>--%>
        <select id="t13" class="form-control1" runat="server" style="width: 100%; height: 26px; ">
            <option value="13101">Ma Li</option>
            <option value="10038">Edward Hao Jie</option>
        </select>
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
    <td class="underline" valign="bottom">
        <%--<input type="text" id="t17" runat="server" class="text-input"/>--%>
        <select runat="server" id="t17" style="width: 100%; height: 26px; ">
            <option value=""></option>
            <option value="10004">Tom Liao Shenli</option>
            <option value="13246">Chen Li</option>
            <option value="10090">Henry Xing Hairui</option>
            <option value="16328">Jane Zhu Yuanzheng</option>
        </select>
        <%--<div  class="search-people-result"></div>--%>
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
    <td class="risk1-Title">Health, Safety & Environment (HSE)<br/>
        <a href="javascript:void(0);" class="btn btn-primary table Health"> Select Scenario</a>
    </td>
    <td><textarea id="s1" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="r1" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t21" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t22" class="RS" runat="server"></textarea></td>
    <td><textarea id="t23" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
    <td class="risk1-Title">
R3 (Security & Emergency) & Travel<br/>
<a href="javascript:void(0);" class="btn btn-primary table R3"> Select Scenario</a>
    </td>
    <td><textarea name="s" readonly="readonly" class="RS" runat="server" id="s2"></textarea>
    </td>
    <td><textarea name="r" readonly="readonly" class="RS" runat="server" id="r2"></textarea></td>
    <td><textarea id="t24" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t25" class="RS" runat="server"></textarea></td>
    <td><textarea id="t26" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
    <td class="risk1-Title">Contract Size<br/>
        <a href="javascript:void(0);" class="btn btn-primary table ContractSize"> Select Scenario</a>
    </td>
    <td><textarea name="s2" readonly="readonly" class="RS" runat="server" id="s3"></textarea></td>
    <td><textarea name="r2" readonly="readonly" class="RS" runat="server" id="r3"></textarea></td>
    <td><textarea id="t27" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t28" class="RS" runat="server"></textarea></td>
    <td><textarea id="t29" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Delegation of Authority<br/>
          <a href="javascript:void(0);" class="btn btn-primary table Delegation"> Select Scenario</a>
  	</td>
  	<td><textarea name="s3" readonly="readonly" class="RS" runat="server" id="s4"></textarea></td>
  	<td><textarea name="r3" readonly="readonly" class="RS" runat="server" id="r4"></textarea></td>
    <td><textarea id="t30" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t31" class="RS" runat="server"></textarea></td>
    <td><textarea id="t32" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Customer Credit Worthiness<br/>
          <a href="javascript:void(0);" class="btn btn-primary table CustomerCredit"> Select Scenario</a>
  	</td>
  	<td><textarea name="s4" readonly="readonly" class="RS" runat="server" id="s5"></textarea></td>
  	<td><textarea name="r4" readonly="readonly" class="RS" runat="server" id="r5"></textarea></td>
    <td><textarea id="t33" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t34" class="RS" runat="server"></textarea></td>
    <td><textarea id="t35" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Cash Flow<br/>
          <a href="javascript:void(0);" class="btn btn-primary table CashFlow"> Select Scenario</a>
  	</td>
  	<td><textarea name="s5" readonly="readonly" class="RS" runat="server" id="s6"></textarea></td>
  	<td><textarea name="r5" readonly="readonly" class="RS" runat="server" id="r6"></textarea></td>
    <td><textarea id="t36" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t37" class="RS" runat="server"></textarea></td>
    <td><textarea id="t38" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Capital Cost Estimating<br/>
          <a href="javascript:void(0);" class="btn btn-primary table Capital"> Select Scenario</a>
  	</td>
  	<td><textarea name="s6" readonly="readonly" class="RS" runat="server" id="s7"></textarea></td>
  	<td><textarea name="r6" readonly="readonly" class="RS" runat="server" id="r7"></textarea></td>
    <td><textarea id="t39" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t40" class="RS" runat="server"></textarea></td>
    <td><textarea id="t41" class="RS" runat="server"></textarea></td>
  </tr>

  <tr>
  	<td class="risk1-Title">Ethical business practices<br/>
          <a href="javascript:void(0);" class="btn btn-primary table EthicalBusinessPractices"> Select Scenario</a>
  	</td>
  	<td><textarea name="s22" readonly="readonly" class="RS" runat="server" id="s22"></textarea></td>
  	<td><textarea name="r22" readonly="readonly" class="RS" runat="server" id="r22"></textarea></td>
    <td><textarea id="t77" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t78" class="RS" runat="server"></textarea></td>
    <td><textarea id="t79" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Carbon emissions<br/>
          <a href="javascript:void(0);" class="btn btn-primary table CarbonEmissions"> Select Scenario</a>
  	</td>
  	<td><textarea name="s23" readonly="readonly" class="RS" runat="server" id="s23"></textarea></td>
  	<td><textarea name="r23" readonly="readonly" class="RS" runat="server" id="r23"></textarea></td>
    <td><textarea id="t80" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t81" class="RS" runat="server"></textarea></td>
    <td><textarea id="t82" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Social Licence<br/>
          <a href="javascript:void(0);" class="btn btn-primary table SocialLicence"> Select Scenario</a>
  	</td>
  	<td><textarea name="s24" readonly="readonly" class="RS" runat="server" id="s24"></textarea></td>
  	<td><textarea name="r24" readonly="readonly" class="RS" runat="server" id="r24"></textarea></td>
    <td><textarea id="t83" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t84" class="RS" runat="server"></textarea></td>
    <td><textarea id="t85" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Contract Terms and Conditions<br/>
          <a href="javascript:void(0);" class="btn btn-primary table ContractTerms"> Select Scenario</a>
  	</td>
  	<td><textarea name="s7" readonly="readonly" class="RS" runat="server" id="s8"></textarea></td>
  	<td><textarea name="r7" readonly="readonly" class="RS" runat="server" id="r8"></textarea></td>
    <td><textarea id="t42" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t43" class="RS" runat="server"></textarea></td>
    <td><textarea id="t44" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Core Competency<br/>
          <a href="javascript:void(0);" class="btn btn-primary table CoreCompetency"> Select Scenario</a>
  	</td>
  	<td><textarea name="s8" readonly="readonly" class="RS" runat="server" id="s9"></textarea></td>
  	<td><textarea name="r8" readonly="readonly" class="RS" runat="server" id="r9"></textarea></td>
    <td><textarea id="t45" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t46" class="RS" runat="server"></textarea></td>
    <td><textarea id="t47" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Construction Management<br/>
          <a href="javascript:void(0);" class="btn btn-primary table ConstructionManagement"> Select Scenario</a>
</td>
  	<td><textarea name="s9" readonly="readonly" class="RS" runat="server" id="s10"></textarea></td>
  	<td><textarea name="r9" readonly="readonly" class="RS" runat="server" id="r10"></textarea></td>
    <td><textarea id="t48" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t49" class="RS" runat="server"></textarea></td>
    <td><textarea id="t50" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Partners<br/>
          <a href="javascript:void(0);" class="btn btn-primary table Partners"> Select Scenario</a>
  	</td>
  	<td><textarea name="s10" readonly="readonly" class="RS" runat="server" id="s11"></textarea></td>
  	<td><textarea name="r10" readonly="readonly" class="RS" runat="server" id="r11"></textarea></td>
    <td><textarea id="t51" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t52" class="RS" runat="server"></textarea></td>
    <td><textarea id="t53" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Procurement of goods and sub-contracts / contracts for services<br/>
          <a href="javascript:void(0);" class="btn btn-primary table Procurement"> Select Scenario</a>
  	</td>
  	<td><textarea name="s11" readonly="readonly" class="RS" runat="server" id="s12"></textarea></td>
  	<td><textarea name="r11" readonly="readonly" class="RS" runat="server" id="r12"></textarea></td>
    <td><textarea id="t54" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t55" class="RS" runat="server"></textarea></td>
    <td><textarea id="t56" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Media or Public Interest<br/>
          <a href="javascript:void(0);" class="btn btn-primary table MediaOrPublic"> Select Scenario</a>
  	</td>
  	<td><textarea name="s12" readonly="readonly" class="RS" runat="server" id="s13"></textarea></td>
  	<td><textarea name="r12" readonly="readonly" class="RS" runat="server" id="r13"></textarea></td>
    <td><textarea id="t57" class="RS" runat="server" readonly="readonly"></textarea></td>
    <td><textarea id="t58" class="RS" runat="server"></textarea></td>
    <td><textarea id="t59" class="RS" runat="server"></textarea></td>
  </tr>
  <tr>
  	<td class="risk1-Title">Trade Sanctions<br/>
          <a href="javascript:void(0);" class="btn btn-primary table TradeSanctions"> Select Scenario</a>
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
    	<td class="risk2-Title">Tax<br/>
            <a href="javascript:void(0);" class="btn btn-primary table Tax"> Select Scenario</a>
    	</td>
    	<td><textarea name="s14" readonly="readonly" class="RS" runat="server" id="s15"></textarea></td>
    	<td><textarea name="r14" readonly="readonly" class="RS" runat="server" id="r15"></textarea></td>
        <td><textarea id="t63" class="RS" runat="server"></textarea></td>
        <td><textarea id="t64" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
    	<td class="risk2-Title">Exchange Rate<br/>
            <a href="javascript:void(0);" class="btn btn-primary table ExchangeRate"> Select Scenario</a>
    	</td>
    	<td><textarea name="s15" readonly="readonly" class="RS" runat="server" id="s16"></textarea></td>
    	<td><textarea name="r15" readonly="readonly" class="RS" runat="server" id="r16"></textarea></td>
        <td><textarea id="t65" class="RS" runat="server"></textarea></td>
        <td><textarea id="t66" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
    	<td class="risk2-Title">Confidentiality Agreement<br/>
            <a href="javascript:void(0);" class="btn btn-primary table ConfidentialityAgreement"> Select Scenario</a>
    	</td>
    	<td><textarea name="s16" readonly="readonly" class="RS" runat="server" id="s17"></textarea></td>
    	<td><textarea name="r16" readonly="readonly" class="RS" runat="server" id="r17"></textarea></td>
        <td><textarea id="t67" class="RS" runat="server"></textarea></td>
        <td><textarea id="t68" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
	    <td class="risk2-Title">Deferred Revenue<br/>
            <a href="javascript:void(0);" class="btn btn-primary table DeferredRevenue"> Select Scenario</a>
	    </td>
    	<td><textarea name="s17" readonly="readonly" class="RS" runat="server" id="s18"></textarea></td>
    	<td><textarea name="r17" readonly="readonly" class="RS" runat="server" id="r18"></textarea></td>
        <td><textarea id="t69" class="RS" runat="server"></textarea></td>
        <td><textarea id="t70" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
	    <td class="risk2-Title">Facilitation Payments<br/>
            <a href="javascript:void(0);" class="btn btn-primary table FacilitationPayments"> Select Scenario</a>
	    </td>
    	<td><textarea name="s18" readonly="readonly" class="RS" runat="server" id="s19"></textarea></td>
    	<td><textarea name="r18" readonly="readonly" class="RS" runat="server" id="r19"></textarea></td>
        <td><textarea id="t71" class="RS" runat="server"></textarea></td>
        <td><textarea id="t72" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
	    <td class="risk2-Title">New Jurisdiction<br/>
            <a href="javascript:void(0);" class="btn btn-primary table NewJurisdiction"> Select Scenario</a>
	    </td>
    	<td><textarea name="s19" readonly="readonly" class="RS" runat="server" id="s20"></textarea></td>
    	<td><textarea name="r19" readonly="readonly" class="RS" runat="server" id="r20"></textarea></td>
        <td><textarea id="t73" class="RS" runat="server"></textarea></td>
        <td><textarea id="t74" class="RS" runat="server"></textarea></td>
    </tr>
	<tr>
    	<td class="risk2-Title">Nuclear<br/>
            <a href="javascript:void(0);" class="btn btn-primary table Nuclear"> Select Scenario</a>
    	</td>
    	<td><textarea name="s20" readonly="readonly" class="RS" runat="server" id="s21"></textarea></td>
    	<td><textarea name="r20" readonly="readonly" class="RS" runat="server" id="r21"></textarea></td>
        <td><textarea id="t75" class="RS" runat="server"></textarea></td>
        <td><textarea id="t76" class="RS" runat="server"></textarea></td>
    </tr>
</tbody>

</table>
            <div class="reject hidden">
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
                <% if (Request["type"] == "2")
                   {
                       %><a href="javascript:void(0);" class="btn btn-default copyFromProposal">Copy from proposal</a><%
                   }
                %>
            </div>
        </div>
        <br/><br/><br/><br/>
        <input type="hidden" id="projectId" runat="server"/>
        <input type="hidden" id="subId" runat="server"/>
        <input type="hidden" id="type" runat="server"/>
        <input type="hidden" id="islocked" runat="server" />
        <input type="hidden" id="isAllApproved" runat="server" />
    </div>
        
<!-- 对话框开始 Health, Safety & Environment (HSE) -->
        <div class="modal " id="modalDialog-Health">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Health, Safety & Environment (HSE)</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelHealth">No site or field based activity, or company personnel on site except for visits or observations,<br/>
OR<br/>
We are using WorleyParsons systems and processes and carrying out activities in WorleyParsons owned construction facilities (i.e. Rosenberg & Cord).</a>
                                        </td>
                                        <td>
1. CONSULT with Location Assurance Business Partner or Business Line Equivalent  to determine if a Project HSE Management plan is required. <br/>
NOTE:  The office HSE plans and Location R3 Plan apply to the work.
                                            </td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelHealth">Company Personnel onsite but without primacy over contractors and Joint Venture Partners<br/>
OR<br/>
Any field based activities other than observations
<br/>
OR<br/>
Control over health, safety and/or environment for site based activities for customers/partners/contractors/subcontractors with acceptable safety performance history <1.0 TRCFR (based on 200,000 exposure hrs)
</a></td>
                                        <td>
1. CONSULT with the Regional / Business Line Assurance Director for the Business Line or for Services the Region's HSE Director (or nominated equivalent) prior to bid submission and during contract setup.
<br/>
2. DELIVERABLES: 
- Customer, Team and Contractor HSE alignment workshops before commencement of site activities and
- A HSE management plan and
- Documented HSE Program (e.g. HSE S-curve)
- Define Contractor HSE specification 
(For Small projects, refer to WPMP task list for consolidated HSE deliverable list)
<br/>
3. FORMAL RISK MANAGEMENT is required
</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelHealth">Control over health, safety and/or environment for site based activities for customers and with contractors or subcontractors with performance history of TRCFR > 1.0 
<br/>
OR<br/>
Has had any significant environmental incidents in the past 2 years (significant harm with local effect, recovery time longer than 1 year)
<br/>
OR <br/>
Where the contractor or subcontractor has not been chosen 
<br/>
OR<br/>
Exposure to asbestos containing materials or asbestos abatement management is in scope of work</a>
                                        </td>
                                        <td>
1. APPROVAL before proceeding with bid is required for where TRCFR > 1.0 as this is a Special Risk. (Refer to the Special Risks Standard).
<br/>
2. APPROVAL from GMD and General Legal Counsel is required when work scope involves asbestos.
<br/>
3. CONSULT with the Regional / Business Line Assurance Director for the business line or in Services the Regions HSE Director (or nominated equivalent) prior to bid submission and during contract setup.
<br/>
4. DELIVERABLES: 
- Customer, Team and Contractor HSE alignment workshops before commencement of site activities and<br/>
- A HSE management plan and <br/>
- Documented HSE Program (e.g. HSE S-curve)<br/>
- Define Contractor HSE specification <br/>
5. FORMAL RISK MANAGEMENT is required
                                        </td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Health, Safety & Environment (HSE) -->
        
<!-- 对话框开始 R3 (Security & Emergency) & Travel -->
        <div class="modal " id="modalDialog-R3">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">R3 (Security & Emergency) & Travel</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelR3">Work is being conducted in a WorleyParsons controlled office in an existing WorleyParsons Location / area of operation and there is no site or field based activity, or company personnel on site except for visits or observations.
                                                <br/>
AND<br/>
On the R3 Risk Forecast Matrix, all five risk areas (Travel, Political, Operational, Security & Terrorism) are "Insignificant" or "Low".  (Search the Matrix on the R3 intranet portal).</a>
                                        </td>
                                        <td>Existing Location R3 Plans will cover office based work.<br/>
                                            <br/>
CONSULT with the Regional R3 Director for your region / business line (R3group@worleyparsons.com) to prepare R3 Assistance Cards and to determine if any additional planning, monitoring or support is required, before commencement of any site visits.
                                            </td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelR3">On the R3 Risk Forecast Matrix one or more of the five risk areas (Travel, Political, Operational, Security & Terrorism) is 'Medium' and none are "High" or "Extreme". (Search the Matrix on the R3 intranet portal).
<br/>
OR<br/>
The project is being executed in a country that is not part of an existing WorleyParsons Location / area of operation. 
<br/>
OR<br/>
There are site or field based activities other than observations. </a></td>
                                        <td>CONSULT with the Regional R3 Director for your region / business line (R3group@worleyparsons.com) to determine the specific Security, Emergency and Travel planning and/or other risk mitigation requirements, prior to bid submission and before commencement of site activities.
</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelR3">On the R3 Risk Forecast Matrix one or more of the five risk areas (Travel, Political, Operational, Security, Terrorism)  is "High" or "Extreme". (Search the Matrix on the R3 intranet portal).
<br/>
OR<br/>
We have control over or responsibility (contractual, duty of care) for project Security and/or Emergency Management.</a>
                                        </td>
                                        <td>CONSULT with the Regional R3 Director for your region / business line (R3group@worleyparsons.com) to determine the specific Security, Emergency and Travel planning and/or other risk mitigation requirements, prior to bid submission and before commencement of site activities.
<br/>
AND<br/>
If "Extreme", then<br/>
APPROVAL from the Business Line GMD and Global R3 Director is required during proposal phase prior to signing contract as this is a Special Risk.</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 R3 (Security & Emergency) & Travel -->

<!-- 对话框开始 Contract Size -->
        <div class="modal " id="modalDialog-ContractSize">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Contract Size</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelContractSize">Small Project
<br />
Reimbursable Engineering or Consulting/Advisory Services only  < USD$2M
<br />
Reimbursable other and Lump Sum including NTE (Not to exceed) and GMAX (Guaranteed Max Price) < USD$1M
</td>
						<td>NOTE: Refer to EMS WPMP requirements for Small Projects.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelContractSize">Medium Project
<br />
Reimbursable Engineering or Consulting/Advisory Services only USD$2M to < USD$30M
<br />
Reimbursable Other USD$1M to < USD$10M
<br />
Lump Sum including NTE (Not to exceed) and GMAX (Guaranteed Max Price) USD$1M to < USD$10M</a></td>
                                        <td>1. FORMAL RISK MANAGEMENT is required
<br />
NOTE: Refer to EMS WPMP requirements for Medium Projects.</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelContractSize">Large Project
<br />
Reimbursable Engineering or Consulting/Advisory Services only >= USD$30M
<br />
Reimbursable Other >= USD$10M
<br />
Lump Sum including NTE (Not to exceed) and GMAX (Guaranteed Max Price) >= USD$10M</a>
                                        </td>
                                        <td>1. FORMAL RISK MANAGEMENT is required
<br />
NOTE: Refer to EMS WPMP requirements for Large Projects.</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Contract Size -->
        
<!-- 对话框开始 Delegation of Authority -->
        <div class="modal " id="modalDialog-Delegation">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Delegation of Authority</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelDelegation">Within the Delegation of Authority Matrix</a></td>
						<td>NOTE: No additional approvals are required</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelDelegation">Outside the Delegation of Authority Matrix limits but within CEO delegated authority</a></td>
                                        <td>1. At BID: APPROVAL to bid and execute contract as per Delegation of Authority before proceeding with bid. 
<br />
2. FORMAL RISK MANAGEMENT is required</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelDelegation">Outside CEO delegated authority
<br />
Lump sum construction contracts > USD$100M OR<br />
Lump sum EPC contracts > USD$150M OR  <br />
Lump sum services only > USD$300M</a>
                                        </td>
                                        <td>1. At BID: APPROVAL to bid and execute contract from the WorleyParsons Board of Directors before proceeding with bid.
<br />
2. FORMAL RISK MANAGEMENT is required
</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Delegation of Authority -->

<!-- 对话框开始 Customer Credit Worthiness -->
        <div class="modal " id="modalDialog-CustomerCredit">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Customer Credit Worthiness</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCustomerCredit">Customer Credit Check Approved as Favourable</a></td>
						<td>If Credit Approval is favourable no further approvals are required.
<br/>
NOTE: 
a. Credit approval must be sought for New Customers before bidding and where necessary credit enhancement such as down payments, letters of credit etc. obtained. <br/>
b. If customer is active, confirm with Accounts Receivable that a credit check has been done within the past 6 months.<br/>
c. If customer is inactive, their credit check must be updated before bidding.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCustomerCredit">Customer Credit Check is Adverse</a></td>
                                        <td>1. At BID: APPROVAL from the Location Director or Business Line equivalent and Regional Finance Director or Business Line Finance Director to extend credit prior to proceeding with bid. 
<br/>
NOTE: <br/>
a. Credit approval must be sought for New Customers before bidding and where necessary credit enhancement such as down payments, letters of credit etc. obtained.<br/>
b. If customer is considered active by the bidding office, confirm with Accounts Receivable that a credit check has been done within the past 6 months.<br/>
c. If customer is considered inactive by the bidding office, their credit check must be updated before bidding.</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Customer Credit Worthiness -->
        
<!-- 对话框开始 Cash Flow -->
        <div class="modal " id="modalDialog-CashFlow">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Cash Flow</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCashFlow">Potential exposures to negative cash flow  < USD$200k of direct project costs no longer than 75% of the project </a></td>
						<td>No further action necessary.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCashFlow">Potential exposures to negative cash flow  > USD$200K and < USD$2M</a></td>
                                        <td>1. DELIVERABLE: Cash management must be included in the formal or informal risk register and a cash flow curve included in the MPRD.</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCashFlow">Potential exposures to negative cash flow > USD $2M or there is a difference of more than USD10m between the currency in which payments are received and the currency in which expenditure occurred</a>
                                        </td>
                                        <td>1. APPROVAL is required during proposal phase prior to  signing contract as this is a Special Risk.
                                            <br/>
2. DELIVERABLE: Cash management must be included in the formal or informal risk register and a cash flow curve included in the MPRD.
</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Cash Flow -->

<!-- 对话框开始 Capital Cost Estimating -->
        <div class="modal " id="modalDialog-Capital">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Capital Cost Estimating</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCapital">No Capital Cost Estimating in scope of work</a></td>
                                        <td>No further action</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCapital">Capital Cost Estimating Services being provided</a></td>
                                        <td>DELIVERABLE: CAPEX Plan and CAPEX class estimate appropriate for the current phase of the project</td>
<td>Moderate</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Capital Cost Estimating -->
        
<!-- 对话框开始 Contract Terms and Conditions -->
        <div class="modal " id="modalDialog-ContractTerms">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Contract Terms and Conditions</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelContractTerms">Contract is on company standard terms and conditions or blanket approval obtained in the last 5 years</a></td>
						<td>NOTE: Complete Contract Sign Off Checklist and obtain approvals as appropriate during proposal phase prior to signing contract.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelContractTerms">Contract is on non standard terms and conditions but no Special Risks or the contract contains Special Risks for which the CEO has delegated approval to the RMDs or equivalent.</a></td>
                                        <td>NOTE: Complete Contract Sign Off Checklist and obtain approvals as appropriate during proposal phase prior to signing contract.</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelContractTerms">Contract contains Special Risks as defined by the Special Risks Standard</a>
                                        </td>
                                        <td>1. APPROVAL as per the Special Risks Standard is required during proposal phase prior to signing contract.
<br />
2. FORMAL RISK MANAGEMENT is required
<br />
NOTE: Complete Contract Sign Off Checklist and obtain approvals as appropriate during proposal phase prior to signing contract.
</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Contract Terms and Conditions -->

<!-- 对话框开始 Core Competency -->
        <div class="modal " id="modalDialog-CoreCompetency">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Core Competency</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCoreCompetency">The Location or Business Line has successfully performed similar services in the same contract form, within the relevant CSG and within the last 5 years.</a></td>
						<td>1. ACTION: Engage location functional and systems leads for input during bid preparation and contract setup.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCoreCompetency">The Location or Business Line has not successfully performed similar services in the same contract form, within the relevant CSG and within the last 5 years OR deviations from the company’s procedures or prescribed systems tools and processes are proposed</a></td>
                                        <td>1. ACTION: Engage Location or Business Line Functional leads for input during bid preparation and contract setup
<br />
2. FORMAL RISK MANAGEMENT is required</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCoreCompetency">The contract is for services outside the company's core competency</a>
                                        </td>
                                        <td>This is a Special Risk. 
<br />
1. APPROVAL from CEO  for Major Projects & Integrated Solutions (MPIS) or GMD for Services/Advisian is required during proposal phase prior to signing contract.
<br />
2. ACTION: Engagement of the Location or Business Line Functional Leads and Business Line Management during the bid preparation and contract setup is required. 
<br />
3. FORMAL RISK MANAGEMENT is required
</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Core Competency -->
        
<!-- 对话框开始 Construction Management -->
        <div class="modal " id="modalDialog-ConstructionManagement">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Construction Management</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelConstructionManagement">No construction management activity<br />
OR<br />
We are using WorleyParsons systems and processes and carrying out construction activities in WorleyParsons owned construction facilities (i.e. Rosenberg & Cord).</a></td>
						<td>No further action necessary.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelConstructionManagement">Responsibility to manage, supervise or oversee construction or fabrication activity in a project or program management consultancy (PMC) role</a></td>
                                        <td>1. CONSULT R3 at BID and then for development of R3 Plans prior to commencement of site activities.
<br />
2. DELIVERABLE: <br />
- Construction Management Plan<br />
- Construction Readiness Review before commencement of site activities.<br />
<br />
3. FORMAL RISK MANAGEMENT is required
<br />
NOTE: The requirements of EMS as relevant to construction apply.
</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelConstructionManagement">Full responsibility for construction management (EPCM, EPC or CM)</a>
                                        </td>
                                        <td>1. CONSULT R3 at BID and then for development of R3 Plans prior to commencement of site activities.
<br />
2. ACTION: Engage Location Construction representatives and Business Line Construction Manager (or equivalent) during bid preparation and contract setup. 
<br />
3. DELIVERABLE: <br />
- Construction Management Plan<br />
- Construction Readiness Review before commencement of site activities.<br />
- Construction Contractor Mobilization Readiness Review before commencement of site activities.<br />
<br />
4. FORMAL RISK MANAGEMENT is required<br />
<br />
NOTE: The requirements of EMS as relevant to construction apply.
</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Construction Management -->
        
<!-- 对话框开始 Partners -->
        <div class="modal " id="modalDialog-Partners">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Partners</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelPartners">No joint venture, consortium or partner arrangements (either proposed or existing)</a></td>
						<td>No further action necessary.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelPartners">New permanent or project joint venture, consortium or partner arrangements with company beneficial interest greater than or equal to 50%</a></td>
                                        <td>1. At BID: APPROVAL as per DOA  is required prior to proceeding. 

2. CONSULT with t Regional / Business Line Assurance Director (or nominated equivalent) and Regional R3 Director. (Refer to HSE and R3 criteria above as beneficial interest >= 50% usually implies WorleyParsons has a HSE controlling role)</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelPartners">Project joint venture partners with company beneficial interest less than 50%</a>
                                        </td>
                                        <td>1. APPROVAL from CEO is required during proposal phase prior to signing contract as this is a Special Risk</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Partners -->
        
<!-- 对话框开始 Procurement of goods and sub-contracts / contracts for services -->
        <div class="modal " id="modalDialog-Procurement">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Procurement of goods and sub-contracts / contracts for services</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelProcurement">No procurement or procurement services</a></td>
						<td>No further action necessary.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelProcurement">Procurement services with purchase orders for the purchase of goods on customer paper<br/>
OR<br/>
Procurement on WorleyParsons Group paper only for Rosenberg and Cord</a></td>
                                        <td>1. ACTION: Engage Location or Business Line Procurement representatives during bid preparation and contract setup, at the level appropriate for the size and complexity of the procurement scope.

NOTE: The requirements of EMS as relevant to procurement apply.</td>
<td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelProcurement">Procurement of goods on Worley Parsons Group paper
OR<br/>
Contract / Sub-contracts for services on WorleyParsons Group paper where supplier terms are shorter than customer<br/>
payment terms</a>
                                        </td>
                                        <td>1. ACTION: Refer to the Special Risks Standard as this may be a Special Risk requiring approval.
<br/>
2 ACTION: For medium and large projects, include outgoings of procurement and / or contractors and sub-contractors in cash flow models
<br/>
NOTE: The requirements of EMS as relevant to procurement apply.</td>
<td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Procurement of goods and sub-contracts / contracts for services -->
        
<!-- 对话框开始 Media or Public Interest -->
        <div class="modal " id="modalDialog-MediaOrPublic">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Media or Public Interest</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelMediaOrPublic">No potential media or public interest in Project or Customer</a></td>
						                <td>No further action necessary.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelMediaOrPublic">Customer or Project has the potential to attract adverse media or public attention.</a></td>
                                        <td>1. NOTIFY Global Director Investor Relations</td>
                                        <td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelMediaOrPublic">Customer or Project has or is highly likely to attract adverse media or public attention.</a></td>
                                        <td>1. APPORVAL from Global Director Investor Relations before proceeding with bid</td>
                                        <td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Media or Public Interest -->
        
<!-- 对话框开始 Trade Sanctions -->
        <div class="modal " id="modalDialog-TradeSanctions">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Trade Sanctions</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelTradeSanctions">The contract or project does not involve any stakeholder that is incorporated, established or located in a sanctioned country or a sanctioned non-state organization (e.g. Hezbollah and Al-Qaeda). Stakeholders include agents, Customers, end-users, partners, suppliers, consortium members etc.

Anticipated payment pathways do not involve a person (such as a bank or other financial intermediary) incorporated, established or located in a sanctioned country.  

WorleyParsons table of sanctioned countries and sanctioned non-state organizations can be found at 
ONE>Sanctions>Sanctions Information>Sanctioned Countries Table</a></td>
						                <td>No further action required</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelTradeSanctions">The contract or project involves a stakeholder that is incorporated, established or located in a sanctioned country or a sanctioned non-state organization 

Anticipated payment pathways involve a person (such as a bank or other financial intermediary) incorporated, established or located in a Sanctioned Country.
Manageable risk may exist but can be mitigated by reasonable steps taken by the project manager.

WorleyParsons table of sanctioned countries and sanctioned non-state organizations can be found at 
ONE>Sanctions>Sanctions Information>Sanctioned Countries Table

</a></td>
                                        <td>At BID: APPROVAL from RMD or equivalent to commence sanctions due diligence. 

NOTE: Compliance with the Sanctions Due Diligence Procedure (CGP-0001) is required
</td>
                                        <td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelTradeSanctions">The contract or project involves a stakeholder that is incorporated, established or located in a sanctioned country or a sanctioned non-state organization 

Anticipated payment pathways involve a person (such as a bank or other financial intermediary) incorporated, established or located in a sanctioned country.

WorleyParsons table of sanctioned countries and sanctioned non-state organizations can be found at 
ONE>Sanctions>Sanctions Information>Sanctioned Countries Table
</a></td><td>1. At BID: APPROVAL from CEO is required during proposal phase prior to signing contract if this is a Special Risk.

NOTE: Compliance with the Sanctions Due Diligence Procedure (CGP-0001) is required</td>
                                        <td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Trade Sanctions -->
        
<!-- 对话框开始 Tax -->
        <div class="modal " id="modalDialog-Tax">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Tax</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelTax">All work under the contract will be performed within the Contracting Office Country for a client whose contracting party is resident in the same country.
<br/>
OR<br/>
The only cross border services under the contract will be performed by a WorleyParsons GDC office and the Contracting Office is either the US, Australia, Canada, UK or United Arab Emirates (UAE) and no employees are required to be mobilized under the contract.</a></td>
						                <td>No further action required</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelTax">The only cross border services under the contract will be performed by a WorleyParsons GDC office (other than where the Contracting Office is the US, Australia, Canada, the UK or UAE and employees are not required to be mobilized under the contract).

OR
The client’s contracting entity is an entity that is resident outside the WorleyParsons Contracting Office country.

OR
The contract requires that part of the services be performed by WorleyParsons outside the Contracting Office country (other than by a GDC office).

OR
WorleyParsons is performing work as part of a joint venture or consortium arrangement, or work is being performed by a third party subcontractor of WP who is resident in a country outside the Contracting Office country.</a></td>
                                        <td>ACTION: Complete a Tax Information Checklist and forward to your local Regional Tax Manager to obtain tax advice. Please complete this step as soon as possible to allow sufficient time for the relevant tax issues to be considered.</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Tax -->
        
<!-- 对话框开始 Exchange Rate -->
        <div class="modal " id="modalDialog-ExchangeRate">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Exchange Rate</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelExchangeRate">Expenditures of less than ten percent (10%) of the contract value will be made in a currency other than that of the contract currency.</a></td>
						                <td>No further action necessary.</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelExchangeRate">Expenditures of over ten percent (10%) of the contract value will be made in a currency other than that of the contract currency.

OR
The value of the labour/non-labour services requested is expected to be greater than USD500,000 (or equivalent)
</a></td>
                                        <td>1. CONSULT with Corporate Treasury.</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Exchange Rate -->
        
<!-- 对话框开始 Confidentiality Agreement -->
        <div class="modal " id="modalDialog-ConfidentialityAgreement">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Confidentiality Agreement</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelConfidentialityAgreement">The proposal/project does not have a prescribed confidentiality agreement</a></td>
						                <td>No further action required</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelConfidentialityAgreement">The proposal/project requires the Company to enter into a confidentiality agreement which is within the limits for local review and signature as per the Legal Requests for Confidentiality Agreements Standard. </a></td>
                                        <td>1. ACTION: Review of the confidentiality agreement may be done locally.</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelConfidentialityAgreement">The proposal/project requires the Company to enter into a confidentiality agreement which is outside the limits for local review and signature as per the Legal Requests for Confidentiality Agreements Standard or the confidentiality requirements introduce a conflict of interest that may have the potential to impact our ability to bid future work with that customer across any of the Business Lines (e.g. if the customer prohibits a contractor from completing detailed design or EPCM work if they completed the pre FEED or FEED work)</a></td>
                                        <td>1. ACTION: Review of the confidentiality agreement by Legal Counsel</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Confidentiality Agreement -->
        
<!-- 对话框开始 Deferred Revenue -->
        <div class="modal " id="modalDialog-DeferredRevenue">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Deferred Revenue</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelDeferredRevenue">No upfront billing of customer is involved.</a></td>
						                <td>No further action required</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelDeferredRevenue">The proposal/project involves billing the customer upfront for services to be delivered over a fixed period.</a></td>
                                        <td>1. CONSULT with Corporate Finance as provisions for deferred revenue will be required. (Refer to the Accounting for Deferred Revenue Standard).</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Deferred Revenue -->
        
<!-- 对话框开始 Facilitation Payments -->
        <div class="modal " id="modalDialog-FacilitationPayments">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Facilitation Payments</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelFacilitationPayments">There is no risk of facilitation payments being requested. See Facilitation Payments Standard for guidance. </a></td>
						                <td>No further action required</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelFacilitationPayments">There is a risk of facilitation payments being requested.  See Facilitation Payments Standard for guidance. </a></td>
                                        <td>1. NOTIFY Location Manager or equivalent Business Line Manager of:<br/>
- this risk and also  <br/>
- if a facilitation payment is or has been made.</td><br/>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Facilitation Payments -->
        
<!-- 对话框开始 New Jurisdiction -->
        <div class="modal " id="modalDialog-NewJurisdiction">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">New Jurisdiction</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelNewJurisdiction">The proposal/project does not involve a new jurisdiction.</a></td>
						                <td>No further action required</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelNewJurisdiction">The proposal/project involves either of the following in a new jurisdiction: creating a taxable presence, including establishing an entity (in joint venture or wholly owned); or leasing, buying or otherwise acquiring office accommodation.</a></td>
                                        <td>1. APPROVAL from Board. 
<br/>
NOTE: Refer to the New Jurisdictions Standard. The Company Secretary maintains a register of jurisdictions.</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 New Jurisdiction -->

<!-- 对话框开始 Nuclear -->
        <div class="modal " id="modalDialog-Nuclear">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Nuclear</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelNuclear">No technical services for a nuclear reactor, enrichment plant or fuel fabrication plant.</a></td>
						                <td>No further action required</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelNuclear">Company is providing technical services for a nuclear reactor, enrichment plant or fuel fabrication plant.</a></td>
                                        <td>1. At Bid: NOTIFY General Counsel or Legal/Contract Director for the region and provide a completed copy of the Prospective Nuclear Project Notification form</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Nuclear -->

<!-- 对话框开始 Ethical business practices -->
        <div class="modal " id="modalDialog-EthicalBusinessPractices">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Ethical business practices</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelEthicalBusinessPractices">There are no legally confirmed judgements for breaches of Ethical business practices for the Customer in any of the jurisdictions in which it operates.  

NOTE: Refer to Responsible Business Assessment Standard REP-0001 for guidance.</a></td>
						                <td>No further action required</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelEthicalBusinessPractices">Customer is operating legally within jurisdictions of project and customer has legally confirmed judgement (not alleged) for breaches of ethical business practices in any jurisdictions of their operations.

NOTE: Refer to EMS Responsible Business Assessment Standard REP-0001 for guidance.</a></td>
                                        <td>At BID: CONSULT the RMD/GMD</td>
                                        <td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelEthicalBusinessPractices">Customer is not operating legally within the jurisdictions of project and has a legally confirmed judgement (not alleged) for breaches of ethical business practices in the jurisdictions of the project (e.g. HSE, Code of Conduct, Corruption/Bribery, Supply Chain, Human Rights, Environmental or Discrimination) 

NOTE: Refer to Responsible Business Assessment Standard REP-0001 for guidance.</a></td>
                                        <td>At BID: APPROVAL from RMD/GMD required before proceeding with bid.</td>
                                        <td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Ethical business practices -->

<!-- 对话框开始 Carbon emissions -->
        <div class="modal " id="modalDialog-CarbonEmissions">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Carbon Emissions</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCarbonEmissions">The project scope includes new/expanded use of ‘Low’ intensity activities.

NOTE: Intensity levels are determined by ‘Emissions intensity table for new projects’ located in the Responsible Business Assessment Standard REP-0001for guidance.</a></td>
						                <td>No further action necessary.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelCarbonEmissions">The project scope includes new/expanded use of ‘Medium’ intensity activities (as) OR High’ intensity technologies in other services.  

NOTE: Intensity levels are determined by ‘Emissions intensity table for new projects’ located in the Responsible Business Assessment Standard REP-0001 for guidance.</a></td>
                                        <td>At BID: APPROVAL from the Location Director or Business Line equivalent and apply Risk Management processes	</td>
                                        <td>Moderate</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Carbon emissions -->

<!-- 对话框开始 Social Licence -->
        <div class="modal " id="modalDialog-SocialLicence">
            <div class="modal-dialog" style="border: 0px solid red; width: 900px;">
                <div class="modal-content" style="border: 0px solid red; width: 100%; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Social Licence</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 400px;">Scenario</th>
                                        <th>Required Actions</th>
                                        <th>Risk Rating</th>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelSocialLicence">The customer has control over its social license.

NOTE: Refer to EMS Responsible Business Assessment Standard REP-0001 for guidance.
</a></td>
						                <td>No further action necessary.</td>
                                        <td>Low</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelSocialLicence">There is a possibility that the customer could lose control of its social license and is not actively managing its position.

NOTE: Refer to EMS Responsible Business Assessment Standard REP-0001 for guidance.</a></td>
                                        <td>At BID: CONSULT the RMD / GMD and apply Risk Management processes</td>
                                        <td>Moderate</td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0)" class="SelSocialLicence">The customer has lost control if its social license to operate according to the media, responsible investment viability, employee feedback or community representatives.

NOTE: Refer to EMS Responsible Business Assessment Standard REP-0001 for guidance.</a></td>
                                        <td>At BID: APPROVAL from the RMD / GMD and apply Risk Management processes</td>
                                        <td>High</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Social Licence -->

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
                            <label >Confirm exediting current Risk Form?</label>
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
    </form>
</body>
</html>
