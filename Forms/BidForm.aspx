﻿<%@ Page Language="C#" %>

<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "Form");
        SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            var db = new PPPEntities();
            var ceo = db.SysDictionary.FirstOrDefault(x => x.Section == "FormApproval" && x.KeyName == "CEO");
            var csgExecutiveDirector = db.SysDictionary.Where(x => x.Section == "FormApproval" && x.KeyName == "CSG Executive Director");
            var regionManagingDirector = db.SysDictionary.Where(x => x.Section == "FormApproval" && x.KeyName == "Region Managing Director");
            var locationManager = db.SysDictionary.Where(x => x.Section == "FormApproval" && x.KeyName == "Location Manager").ToList();
            var locationOrRegionCsgOrBdDirector = db.SysDictionary.Where(x => x.Section == "FormApproval" && x.KeyName == "Location or Region CSG or BD Director");
            var managerOfProjectsOrProposal = db.SysDictionary.Where(x => x.Section == "FormApproval" && x.KeyName == "Manager of Projects or Proposal");

            // CEO
            t57.Items.Add(new ListItem("", ""));
            if (ceo != null)
            {
                t57.Items.Add(new ListItem(ceo.KeyValue, ceo.KeyValue));
            }
            // CSG Executive Director
            t59.Items.Add(new ListItem("", ""));
            foreach (var r in csgExecutiveDirector)
            {
                t59.Items.Add(new ListItem(r.KeyValue, r.KeyValue));
            }
            // Region Managing Director
            t61.Items.Add(new ListItem("", ""));
            foreach (var r in regionManagingDirector)
            {
                t61.Items.Add(new ListItem(r.KeyValue, r.KeyValue));
            }
            // Location Manager
            t63.Items.Add(new ListItem("", ""));
            foreach (var r in locationManager)
            {
                t63.Items.Add(new ListItem(r.KeyValue, r.KeyValue));
            }
            // Location or Region CSG or BD Director
            t65.Items.Add(new ListItem("", ""));
            foreach (var r in locationOrRegionCsgOrBdDirector)
            {
                t65.Items.Add(new ListItem(r.KeyValue, r.Email));
            }
            // Manager of Projects or Proposal
            //t67.Items.Add(new ListItem("", ""));
            //foreach (var r in managerOfProjectsOrProposal)
            //{
            //    t67.Items.Add(new ListItem(r.KeyValue, r.KeyValue));
            //}

            var iprojectId = Convert.ToInt32(Request["projectId"]);
            var isubId = Convert.ToInt32(Request["subId"]);
            projectId.Value = Request["projectId"];
            subId.Value = Request["subId"];
            var projectInfo = db.TProject.FirstOrDefault(x => x.ProjectId == iprojectId);
            if (projectInfo == null)
            {
                return;
            }

            var ppx = db.TProposalX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
            if (ppx!=null)
            {
                if (ppx.BidSubmitDate != null)
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

            var item = db.BIDForm.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
            if (item == null)
            {
                // Create default.
                var bidForm = new BIDForm();
                bidForm.ProjectId = iprojectId;
                bidForm.SubId = isubId;
                bidForm.c1 = "false";
                bidForm.c2 = "false";
                bidForm.c3 = "false";
                bidForm.c4 = "false";
                bidForm.c5 = "false";
                bidForm.c6 = "false";
                bidForm.c7 = "false";
                bidForm.c8 = "false";
                bidForm.c9 = "false";
                bidForm.c10 = "false";
                bidForm.c11 = "false";
                bidForm.c12 = "false";
                bidForm.c13 = "false";
                bidForm.c14 = "false";
                bidForm.c15 = "false";
                bidForm.c16 = "false";
                bidForm.c17 = "false";
                bidForm.c18 = "false";
                bidForm.c19 = "false";
                bidForm.c20 = "false";
                bidForm.c21 = "false";
                bidForm.c22 = "false";
                bidForm.c23 = "false";
                bidForm.c24 = "false";
                bidForm.c25 = "false";
                bidForm.c26 = "false";
                bidForm.c27 = "false";
                bidForm.c28 = "false";
                bidForm.c29 = "false";
                bidForm.c30 = "false";
                bidForm.c31 = "false";
                bidForm.c32 = "false";
                bidForm.c33 = "false";
                bidForm.c34 = "false";
                bidForm.c35 = "false";
                bidForm.c36 = "false";
                bidForm.c37 = "false";
                bidForm.c38 = "false";
                bidForm.c39 = "false";
                bidForm.c40 = "false";
                bidForm.c41 = "false";
                bidForm.c42 = "false";
                bidForm.c43 = "false";
                bidForm.c44 = "false";
                bidForm.c45 = "false";
                bidForm.c46 = "false";
                bidForm.c47 = "false";
                bidForm.c48 = "false";
                bidForm.c49 = "false";
                bidForm.c50 = "false";
                bidForm.c51 = "false";
                bidForm.c52 = "false";
                bidForm.c53 = "false";
                bidForm.c54 = "false";
                bidForm.c55 = "false";
                bidForm.c56 = "false";
                bidForm.c57 = "false";
                bidForm.c58 = "false";
                bidForm.c59 = "false";
                bidForm.c60 = "false";
                bidForm.c61 = "false";
                bidForm.c62 = "false";
                bidForm.c63 = "false";
                bidForm.c64 = "false";
                bidForm.c65 = "false";
                //bidForm.c66 = "false";
                //bidForm.c67 = "false";
                bidForm.c68 = "false";
                bidForm.c69 = "false";
                //bidForm.c70 = "false";
                //bidForm.c71 = "false";
                bidForm.c72 = "false";
                bidForm.c73 = "false";
                bidForm.c74 = "false";
                bidForm.c75 = "false";
                bidForm.c76 = "false";
                bidForm.c77 = "false";
                bidForm.c78 = "false";
                bidForm.c79 = "false";
                bidForm.c80 = "false";
                bidForm.c81 = "false";
                bidForm.c82 = "false";
                bidForm.c83 = "false";
                bidForm.c84 = "false";
                bidForm.c85 = "false";
                bidForm.c86 = "false";

                bidForm.t57 = "";
                bidForm.t59 = "";
                bidForm.t61 = "";
                bidForm.t63 = "";
                bidForm.t65 = "";
                bidForm.t67 = "";
                bidForm.t69 = "";
                #region 更新已知项
                bidForm.t1 = projectInfo.OpportunityLeadSector;
                t1.Value = projectInfo.OpportunityLeadSector;
                bidForm.t3 = projectInfo.Custodian;
                t3.Value = projectInfo.Custodian;
                bidForm.t4 = projectInfo.OpportunityLeadSubsector;
                t4.Value = projectInfo.OpportunityLeadSubsector;
                bidForm.t13 = projectInfo.WorleyParsonsCV;
                t13.Value = projectInfo.WorleyParsonsCV;
                bidForm.t14 = projectInfo.EstimatedWork;
                t14.Value = projectInfo.EstimatedWork;
                bidForm.t15 = projectInfo.WorleyParsonsEBIT;
                t15.Value = projectInfo.WorleyParsonsEBIT;
                bidForm.t19 = projectInfo.Go;
                t19.Value = projectInfo.Go;
                bidForm.t20 = projectInfo.Get;
                t20.Value = projectInfo.Get;

                if (projectInfo.ContractCurrency.StartsWith("US"))
                {
                    // USD
                    c21.Checked = true;
                    bidForm.c21 = "true";
                }
                else if (projectInfo.ContractCurrency.StartsWith("Australian"))
                {
                    // AUD
                    c25.Checked = true;
                    bidForm.c25 = "true";
                }
                //else if (projectInfo.ContractCurrency.StartsWith("UK"))
                //{
                //    // GBP
                //    c23.Checked = true;
                //    bidForm.c23 = "true";
                //}
                //else if (projectInfo.ContractCurrency.Contains("Canadian"))
                //{
                //    // CAD
                //    //c24.Checked = true;
                //    bidForm.c24 = "true";
                //}
                else if (projectInfo.ContractCurrency.Contains("Euro"))
                {
                    // EUR
                    c22.Checked = true;
                    bidForm.c22 = "true";
                }
                else if (projectInfo.ContractCurrency.Contains("Rand")
                    || projectInfo.ContractCurrency.Contains("Chinese")
                    || projectInfo.ContractCurrency.StartsWith("Brazilian"))
                {
                    // OTHER
                    c26.Checked = true;
                    bidForm.c26 = "true";
                    t55.Value = projectInfo.ContractCurrency;
                    bidForm.t55 = projectInfo.ContractCurrency;
                }
                else
                {
                    c26.Checked = true;
                    bidForm.c26 = "true";
                    t55.Value = projectInfo.ContractCurrency;
                    bidForm.t55 = projectInfo.ContractCurrency;
                }

                if (projectInfo.ContractType.Contains("Cost Reimbursable & Lump Sum"))
                {
                    // +
                    c27.Checked = true;
                    bidForm.c27 = "true";
                    c29.Checked = true;
                    bidForm.c29 = "true";
                }
                else if (projectInfo.ContractType.Contains("Cost Reimbursable"))
                {
                    // CR
                    c27.Checked = true;
                    bidForm.c27 = "true";
                }
                else if (projectInfo.ContractType.Contains("Lump Sum Turn Key"))
                {
                    // LSTK
                    c30.Checked = true;
                    bidForm.c30 = "true";
                }
                else if (projectInfo.ContractType.StartsWith("Lump Sum"))
                {
                    // LS
                    c29.Checked = true;
                    bidForm.c29 = "true";
                }
                else if (projectInfo.ContractType.Contains("Yet To Be Determined"))
                {
                    // OTHERS
                    c31.Checked = true;
                    bidForm.c31 = "true";
                    t56.Value = projectInfo.ContractCurrency;
                    bidForm.t56 = projectInfo.ContractCurrency;
                }
                else if (projectInfo.ContractType.Contains("Cost Plus Fee"))
                {
                    // CPF
                    c28.Checked = true;
                    bidForm.c28 = "true";
                }
                else
                {
                    // OTHERS
                    c31.Checked = true;
                    bidForm.c31 = "true";
                    t56.Value = projectInfo.ContractCurrency;
                    bidForm.t56 = projectInfo.ContractCurrency;
                }
                #endregion

                var proposalInfo = db.TProposalX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                if (proposalInfo != null)
                {
                    txtProjectName.Value = proposalInfo.ProjectName;
                    txtWorkShareOffice.Value = proposalInfo.WorkshareOffices;
                    txtCustomer.Value = proposalInfo.Customer;
                    txtFacilityLocationCountry.Value = proposalInfo.FacilityLocationCountry;

                    txtBidDate.Value = StringHelper.FmtDate(proposalInfo.BidDueDate);
                    txtAwardDate.Value = StringHelper.FmtDate(proposalInfo.AWardDate);
                    txtContractDuration.Value = proposalInfo.ContractDuration;
                }

                db.BIDForm.Add(bidForm);
                db.SaveChanges();
            }
            else
            {
                // Read.
                c1.Checked = Convert.ToBoolean(item.c1);
                c2.Checked = Convert.ToBoolean(item.c2);
                c3.Checked = Convert.ToBoolean(item.c3);
                c4.Checked = Convert.ToBoolean(item.c4);
                c5.Checked = Convert.ToBoolean(item.c5);
                c6.Checked = Convert.ToBoolean(item.c6);
                c7.Checked = Convert.ToBoolean(item.c7);
                c8.Checked = Convert.ToBoolean(item.c8);
                c9.Checked = Convert.ToBoolean(item.c9);
                c10.Checked = Convert.ToBoolean(item.c10);
                c11.Checked = Convert.ToBoolean(item.c11);
                c12.Checked = Convert.ToBoolean(item.c12);
                c13.Checked = Convert.ToBoolean(item.c13);
                c14.Checked = Convert.ToBoolean(item.c14);
                c15.Checked = Convert.ToBoolean(item.c15);
                c16.Checked = Convert.ToBoolean(item.c16);
                c17.Checked = Convert.ToBoolean(item.c17);
                c18.Checked = Convert.ToBoolean(item.c18);
                c19.Checked = Convert.ToBoolean(item.c19);
                c20.Checked = Convert.ToBoolean(item.c20);
                c21.Checked = Convert.ToBoolean(item.c21);
                c22.Checked = Convert.ToBoolean(item.c22);
                c23.Checked = Convert.ToBoolean(item.c23);
                //c24.Checked = Convert.ToBoolean(item.c24);
                c25.Checked = Convert.ToBoolean(item.c25);
                c26.Checked = Convert.ToBoolean(item.c26);
                c27.Checked = Convert.ToBoolean(item.c27);
                c28.Checked = Convert.ToBoolean(item.c28);
                c29.Checked = Convert.ToBoolean(item.c29);
                c30.Checked = Convert.ToBoolean(item.c30);
                c31.Checked = Convert.ToBoolean(item.c31);
                c32.Checked = Convert.ToBoolean(item.c32);
                c33.Checked = Convert.ToBoolean(item.c33);
                c34.Checked = Convert.ToBoolean(item.c34);
                c35.Checked = Convert.ToBoolean(item.c35);
                c36.Checked = Convert.ToBoolean(item.c36);
                c37.Checked = Convert.ToBoolean(item.c37);
                c38.Checked = Convert.ToBoolean(item.c38);
                c39.Checked = Convert.ToBoolean(item.c39);
                c40.Checked = Convert.ToBoolean(item.c40);
                c41.Checked = Convert.ToBoolean(item.c41);
                c42.Checked = Convert.ToBoolean(item.c42);
                c43.Checked = Convert.ToBoolean(item.c43);
                c44.Checked = Convert.ToBoolean(item.c44);
                c45.Checked = Convert.ToBoolean(item.c45);
                c46.Checked = Convert.ToBoolean(item.c46);
                c47.Checked = Convert.ToBoolean(item.c47);
                c48.Checked = Convert.ToBoolean(item.c48);
                c49.Checked = Convert.ToBoolean(item.c49);
                c50.Checked = Convert.ToBoolean(item.c50);
                c51.Checked = Convert.ToBoolean(item.c51);
                c52.Checked = Convert.ToBoolean(item.c52);
                c53.Checked = Convert.ToBoolean(item.c53);
                c54.Checked = Convert.ToBoolean(item.c54);
                c55.Checked = Convert.ToBoolean(item.c55);
                c56.Checked = Convert.ToBoolean(item.c56);
                c57.Checked = Convert.ToBoolean(item.c57);
                c58.Checked = Convert.ToBoolean(item.c58);
                c59.Checked = Convert.ToBoolean(item.c59);
                c60.Checked = Convert.ToBoolean(item.c60);
                c61.Checked = Convert.ToBoolean(item.c61);
                c62.Checked = Convert.ToBoolean(item.c62);
                c63.Checked = Convert.ToBoolean(item.c63);
                c64.Checked = Convert.ToBoolean(item.c64);
                c65.Checked = Convert.ToBoolean(item.c65);
                //c66.Checked = Convert.ToBoolean(item.c66);
                //c67.Checked = Convert.ToBoolean(item.c67);
                c68.Checked = Convert.ToBoolean(item.c68);
                c69.Checked = Convert.ToBoolean(item.c69);
                //c70.Checked = Convert.ToBoolean(item.c70);
                //c71.Checked = Convert.ToBoolean(item.c71);
                c72.Checked = Convert.ToBoolean(item.c72);
                c73.Checked = Convert.ToBoolean(item.c73);
                c74.Checked = Convert.ToBoolean(item.c74);
                c75.Checked = Convert.ToBoolean(item.c75);
                c76.Checked = Convert.ToBoolean(item.c76);
                c77.Checked = Convert.ToBoolean(item.c77);
                c78.Checked = Convert.ToBoolean(item.c78);
                c79.Checked = Convert.ToBoolean(item.c79);
                c80.Checked = Convert.ToBoolean(item.c80);
                c81.Checked = Convert.ToBoolean(item.c81);
                c86.Checked = Convert.ToBoolean(item.c86);

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
                t12.Value = StringHelper.FmtNumber(item.t12);
                t13.Value = StringHelper.FmtNumber(item.t13);
                t14.Value = StringHelper.FmtNumber(item.t14);
                t15.Value = StringHelper.FmtNumber(item.t15);
                t16.Value = StringHelper.FmtNumber(item.t16);
                t17.Value = item.t17;
                t18.Value = StringHelper.FmtNumber(item.t18);
                t19.Value = item.t19;
                t20.Value = item.t20;
                t21.Value = item.t21;
                t22.Value = StringHelper.FmtNumber(item.t22);
                t23.Value = item.t23;
                t24.Value = item.t24;
                t25.Value = item.t25;
                t26.Value = item.t26;
                t27.Value = StringHelper.FmtNumber(item.t27);
                t28.Value = item.t28;
                t29.Value = StringHelper.FmtNumber(item.t29);
                t30.Value = StringHelper.FmtNumber(item.t30);
                t31.Value = StringHelper.FmtNumber(item.t31);
                t32.Value = item.t32;
                t33.Value = StringHelper.FmtNumber(item.t33);
                t34.Value = item.t34;
                t35.Value = StringHelper.FmtNumber(item.t35);
                t36.Value = item.t36;
                t37.Value = StringHelper.FmtNumber(item.t37);
                t38.Value = StringHelper.FmtNumber(item.t38);
                t39.Value = StringHelper.FmtNumber(item.t39);
                t40.Value = StringHelper.FmtNumber(item.t40);
                t41.Value = StringHelper.FmtNumber(item.t41);
                t42.Value = item.t42;
                t43.Value = StringHelper.FmtNumber(item.t43);
                t44.Value = item.t44;
                t45.Value = StringHelper.FmtNumber(item.t45);
                t46.Value = item.t46;
                t47.Value = StringHelper.FmtNumber(item.t47);
                t48.Value = item.t48;
                t49.Value = StringHelper.FmtNumber(item.t49);
                t50.Value = item.t50;
                t51.Value = StringHelper.FmtNumber(item.t51);
                t52.Value = item.t52;
                t53.Value = item.t53;
                t54.Value = item.t54;
                t55.Value = item.t55;
                t56.Value = item.t56;

                t57.Value = PeopleHelper.GetPeopleName(item.t57);

                t58.Value = item.t58;
                t59.Value = PeopleHelper.GetPeopleName(item.t59);

                t60.Value = item.t60;
                t61.Value = PeopleHelper.GetPeopleName(item.t61);

                t62.Value = item.t62;
                t63.Value = PeopleHelper.GetPeopleName(item.t63);

                t64.Value = item.t64;
                t65.Value = PeopleHelper.GetPeopleName(item.t65);

                t66.Value = item.t66;
                t67.Value = PeopleHelper.GetPeopleName(item.t67);

                t68.Value = item.t68;
                t69.Value = PeopleHelper.GetPeopleName(item.t69);

                t70.Value = item.t70;
                t71.Value = item.t71;
                t72.Value = item.t72;
                t73.Value = item.t73;
                t74.Value = item.t74;
                t75.Value = item.t75;
                t76.Value = item.t76;
                t77.Value = item.t77;

                txtBidDate.Value = item.t78;
                txtAwardDate.Value = item.t79;
                txtContractDuration.Value = item.t80;

                txtProjectName.Value = item.t81;
                txtWorkShareOffice.Value = item.t82;
                txtCustomer.Value = item.t83;
                txtFacilityLocationCountry.Value = item.t84;
                txtBidOffice.Value = item.t85;

                rejectBy.InnerText = item.RejectBy;
                rejectComments.InnerText = item.RejectComment;
                if (!string.IsNullOrEmpty(item.RejectBy))
                {
                    rejectSection.Visible = true;
                }
                else
                {
                    rejectSection.Visible = false;
                }
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Forms/css/bidForm.css") %>" />

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/jquery-ui.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Project/js/project.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/g.js")%>"></script>
    <script src="<%=ResolveUrl("~/Forms/js/bidForm.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>"></script>

    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
    <form id="form1" runat="server" onload="form1_OnLoad">
        <!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" ID="Menu" />
        <!-- 导航菜单::结束 -->
        <!-- 导航地图::开始 -->
        <div><strong>PIMS</strong> > <a href="<%=ResolveUrl("~/Project/Default.aspx") %>">Project Initiation</a> > <a href="<%=ResolveUrl(string.Format("~/Project/ProposalInitiation.aspx?projectId={0}", Request["projectId"])) %>">Proposal</a> > BID/NO BID FORM </div>
        <!-- 导航地图::结束 -->
        <div class="container">
            <div class="text-right">
                <div class="btn-group">
                    <a href="javascript:void(0);" class="btn btn-primary save-change">Save change</a>
                    <a href="javascript:void(0);" class="btn btn-default ready-for-approval">Ready for Approval</a>
                    <a href="javascript:void(0);" class="btn btn-default expediting">Expediting</a>
                    <a href="javascript:void(0);" class="btn btn-default reverse">Reverse</a>
                </div>
            </div>
            <h2 class="text-center">BID/NO BID FORM</h2>
            <div class="note1">
                A replica of this form is contained in the Customer Relationship Manager Tool (CRMT). All changes to this form must be reflected on the CRMT form by contacting crmt@worleyparsons.com. 
            </div>
            <table class="fullTable">
                <tr class="topLine">
                    <td class="title">CSG</td>
                    <td colspan="3">
                        <input type="text" id="t1" runat="server" class="text-input" /></td>
                    <td class="title">Date<span class='date-format'>(yyyy/mm/dd)</span></td>
                    <td>
                        <input type="text" id="t2" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine bottomLine">
                    <td class="title">Custodian</td>
                    <td>
                        <input type="text" id="t3" runat="server" class="text-input" /></td>
                    <td class="title">Sub-sector/Industry</td>
                    <td>
                        <input type="text" id="t4" runat="server" class="text-input" /></td>
                    <td class="title">Rev</td>
                    <td>
                        <input type="text" id="t5" runat="server" class="text-input" /></td>
                </tr>
            </table>
            <div class="SectionName">PROJECT SUMMARY</div>
            <table class="fullTable">
                <tr class="topLine">
                    <td class="title">Project Title</td>
                    <td colspan="3">
                        <input type="text" id="txtProjectName" runat="server" class="text-input text-input-readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Customer</td>
                    <td>
                        <input type="text" id="txtCustomer" runat="server" class="text-input text-input-readonly" /></td>
                    <td class="title">Proposed Execution Office</td>
                    <td>
                        <input type="text" id="txtWorkShareOffice" runat="server" class="text-input text-input-readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Site Location/Region</td>
                    <td>
                        <input type="text" id="txtFacilityLocationCountry" runat="server" class="text-input text-input-readonly" /></td>
                    <td class="title">Proposed Bidding Office</td>
                    <td>
                        <input type="text" id="txtBidOffice" runat="server" class="text-input text-input-readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td colspan="2">&nbsp;</td>
                    <td class="title">Project Funded?</td>
                    <td>
                        <label>Yes <input type="checkbox" id="c1" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;<label>No <input type="checkbox" id="c2" runat="server" class="cb-style" /></label></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Worleyparsons Scope</td>
                    <td colspan="3">
                        <label>Study <input type="checkbox" id="c3" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>E <input type="checkbox" id="c4" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>P <input type="checkbox" id="c5" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>EP <input type="checkbox" id="c6" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>EPCM <input type="checkbox" id="c7" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>C <input type="checkbox" id="c8" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>CM <input type="checkbox" id="c9" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>PMC <input type="checkbox" id="c10" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>EPC <input type="checkbox" id="c86" runat="server" class="cb-style" /></label>
                    </td>
                </tr>
                <tr class="topLine">
                    <td class="title">Phase(WPMP)</td>
                    <td colspan="3">
                        <label>Identify <input type="checkbox" id="c11" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>Evaluate <input type="checkbox" id="c12" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>Define <input type="checkbox" id="c13" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>Excute <input type="checkbox" id="c14" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>Operate <input type="checkbox" id="c15" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>Consulting <input type="checkbox" id="c16" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>Deliver <input type="checkbox" id="c17" runat="server" class="cb-style" /></label>&nbsp;&nbsp;&nbsp;
                        <label>Improve <input type="checkbox" id="c18" runat="server" class="cb-style" /></label>
                    </td>
                </tr>
                <tr class="topLine">
                    <td class="title">Special Staffing Needs </td>
                    <td colspan="3">
                        <input type="text" id="t6" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Security Risk/R3 Issues</td>
                    <td colspan="3">
                        <input type="text" id="t7" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">HVE/Workshare Opportunity </td>
                    <td colspan="3">
                        <input type="text" id="t8" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine bottomLine">
                    <td class="title">Nuclear Scope**</td>
                    <td>&nbsp;</td>
                    <td colspan="2">
                        <label>Sanctioned Country<input type="checkbox" id="c19" runat="server" class="cb-style" /></label>
                        <label>Government Project<input type="checkbox" id="c20" runat="server" class="cb-style" /></label>
                    </td>
                </tr>
            </table>
            <div class="note1">
                ** A Prospective Nuclear Project Notification Form is to be completed for contract opportunities associated with the Nuclear Industry, and issued to the General Counsel ANZ/AME and USLAC. 
            </div>
            <div class="SectionName">KEY DATES  (* Indicates Required Field) </div>
            <table class="fullTable">
                <tr class="topLine">
                    <td>Qualifications Due<span class='date-format'>(yyyy/mm/dd)</span></td>
                    <td>
                        <input type="text" id="t9" runat="server" class="text-input" /></td>
                    <td>Bid Due Date<span class='date-format'>(yyyy/mm/dd)</span>*</td>
                    <td>
                        <input type="text" id="txtBidDate" runat="server" class="text-input text-input-readonly" /></td>
                    <td>Award Date<span class='date-format'>(yyyy/mm/dd)</span>* </td>
                    <td>
                        <input type="text" id="txtAwardDate" runat="server" class="text-input text-input-readonly" /></td>
                </tr>
                <tr class="topLine bottomLine">
                    <td>RFP Release Date<span class='date-format'>(yyyy/mm/dd)</span>* </td>
                    <td>
                        <input type="text" id="t10" runat="server" class="text-input" /></td>
                    <td>Presentation Date<span class='date-format'>(yyyy/mm/dd)</span></td>
                    <td>
                        <input type="text" id="t11" runat="server" class="text-input" /></td>
                    <td>Project Duration Week*  </td>
                    <td>
                        <input type="text" id="txtContractDuration" runat="server" class="text-input text-input-readonly" /></td>
                </tr>
            </table>
            <div class="SectionName">COMMERCIAL</div>
            <table class="fullTable">
                <tr class="topLine">
                    <td colspan="6"><strong>Currency Stated In:</strong>
                        <label>USD<input type="checkbox" id="c21" runat="server" class="cb-style" /></label>
                        <label>EUR<input type="checkbox" id="c22" runat="server" class="cb-style" /></label>
                        <label>CNY<input type="checkbox" id="c23" runat="server" class="cb-style" /></label>
                        <%--					<label>CAD<input type="checkbox" id="c24" runat="server" class="cb-style" /></label>--%>
                        <label>AUD<input type="checkbox" id="c25" runat="server" class="cb-style" /></label>
                        <label>Other<input type="checkbox" id="c26" runat="server" class="cb-style" />
                            (please specify) </label>
                        <input type="text" id="t55" runat="server" class="text-input" />
                    </td>
                </tr>
                <tr class="topLine">
                    <td colspan="6"><strong>Contract Type: </strong>
                        <label>CR – Cost Reimbursable<input type="checkbox" id="c27" runat="server" class="cb-style" /></label>
                        <label>CPF – Cost Plus Fee<input type="checkbox" id="c28" runat="server" class="cb-style" /></label>
                        <label>LS – Lump Sum<input type="checkbox" id="c29" runat="server" class="cb-style" /></label>
                        <label>LSTK – Lump Sum Turn Key<input type="checkbox" id="c30" runat="server" class="cb-style" /></label>
                        <label>Other<input type="checkbox" id="c31" runat="server" class="cb-style" />
                            (please specify) </label>
                        <input type="text" id="t56" runat="server" class="text-input" />
                    </td>
                </tr>
                <tr class="topLine">
                    <td class="title">Estimated Total Installed Cost</td>
                    <td colspan="5">
                        <input type="text" id="t12" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Estimated Contract Value</td>
                    <td colspan="2">
                        <input type="text" id="t13" runat="server" class="text-input" /></td>
                    <td class="title">Home Location Manhours</td>
                    <td colspan="2">
                        <input type="text" id="t14" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Estimated EBIT </td>
                    <td colspan="2">
                        <input type="text" id="t15" runat="server" class="text-input" /></td>
                    <td class="title">Potential HVE Manhours</td>
                    <td colspan="2">
                        <input type="text" id="t16" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Basis (Multiplier, etc.) </td>
                    <td colspan="2">
                        <input type="text" id="t17" runat="server" class="text-input" /></td>
                    <td class="title">Estimated License Fee</td>
                    <td colspan="2">
                        <input type="text" id="t18" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Go Probability (%) </td>
                    <td>
                        <input type="text" id="t19" runat="server" class="text-input" /></td>
                    <td class="title">Get Probability (%) </td>
                    <td>
                        <input type="text" id="t20" runat="server" class="text-input" /></td>
                    <td class="title">Go-Get Probability (%) </td>
                    <td>
                        <input type="text" id="t21" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title" colspan="6">PROPOSAL </td>
                </tr>
                <tr class="topLine">
                    <td class="title">Estimated Proposal Cost (CNY)</td>
                    <td colspan="2">
                        <input type="text" id="t22" runat="server" class="text-input" /></td>
                    <td class="title">Proposal Manager </td>
                    <td colspan="2">
                        <input type="text" id="t23" runat="server" class="text-input" />
                        <div  class="search-people-result"></div>
                    </td>
                </tr>
                <tr class="topLine">
                    <td class="title">Proposed Project Manager</td>
                    <td colspan="2">
                        <input type="text" id="t24" runat="server" class="text-input" />
                        <div  class="search-people-result"></div>
                    </td>
                    <td class="title">JV Partner(s)</td>
                    <td colspan="2">
                        <input type="text" id="t25" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Competition/Location</td>
                    <td colspan="5">
                        <input type="text" id="t26" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine bottomLine">
                    <td class="title">
                        <label>Review<br />
                            Requirements</label>
                    </td>
                    <td>
                        <label>Manager Review<input type="checkbox" id="c32" runat="server" class="cb-style" /></label>OR
                    </td>
                    <td>
                        <label>Red Team (Technical) and<br />
                            Green Team (Commercial).
                            <br />
                            <span class="ref">Mandatory for all  Major Proposals</span><input type="checkbox" id="c33" runat="server" class="cb-style" /></label>OR
                    </td>
                    <td colspan="3">
                        <label>Executive Proposal Review (EPR)<br />
                            <span class="ref">May be required for very large or high risk proposals</span><input type="checkbox" id="c34" runat="server" class="cb-style" /></label>
                    </td>
                </tr>
            </table>
            <div class="SectionName">CONTRACT RISKS AND LIABILITIES <span class="ref">(Populate for applicable risk/s or mark as N/A)</span> </div>
            <table class="fullTable" style="width: 100%">
                <tr class="topLine">
                    <td width="192" class="title">Bid Bonds</td>
                    <td width="362">
                        <input type="text" id="t27" runat="server" class="text-input" /></td>
                    <td width="206" class="title">Foreign Content (if any)</td>
                    <td width="317">
                        <input type="text" id="t28" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Performance Bonds</td>
                    <td>
                        <input type="text" id="t29" runat="server" class="text-input" /></td>
                    <td class="title">Duties/Import Fees</td>
                    <td>
                        <input type="text" id="t30" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Performance Guarantees</td>
                    <td>
                        <input type="text" id="t31" runat="server" class="text-input" /></td>
                    <td class="title">Bid Currency & Exchange Rate</td>
                    <td>
                        <input type="text" id="t32" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Letter of Credit</td>
                    <td>
                        <input type="text" id="t33" runat="server" class="text-input" /></td>
                    <td class="title">Applicable Law</td>
                    <td>
                        <input type="text" id="t34" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Advance Payment Bonds</td>
                    <td>
                        <input type="text" id="t35" runat="server" class="text-input" /></td>
                    <td class="title">Local Tax Impacts</td>
                    <td>
                        <input type="text" id="t36" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Retention Bonds</td>
                    <td>
                        <input type="text" id="t37" runat="server" class="text-input" /></td>
                    <td class="title">License Fees</td>
                    <td>
                        <input type="text" id="t38" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Parent Company Guarantee</td>
                    <td>
                        <input type="text" id="t39" runat="server" class="text-input" /></td>
                    <td class="title">Agent Fees</td>
                    <td>
                        <input type="text" id="t40" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Liquidated Damages</td>
                    <td>
                        <input type="text" id="t41" runat="server" class="text-input" /></td>
                    <td class="title">Facilitation Payments</td>
                    <td>
                        <input type="text" id="t42" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Consequential Damages</td>
                    <td>
                        <input type="text" id="t43" runat="server" class="text-input" /></td>
                    <td class="title">Financing</td>
                    <td>
                        <input type="text" id="t44" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Insurances</td>
                    <td>
                        <input type="text" id="t45" runat="server" class="text-input" /></td>
                    <td class="title">Payment Terms</td>
                    <td>
                        <input type="text" id="t46" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Bid Validity</td>
                    <td>
                        <input type="text" id="t47" runat="server" class="text-input" /></td>
                    <td class="title">Negative Cash Flows</td>
                    <td>
                        <input type="text" id="t48" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Penalties</td>
                    <td>
                        <input type="text" id="t49" runat="server" class="text-input" /></td>
                    <td class="title">Other Risks</td>
                    <td>
                        <input type="text" id="t50" runat="server" class="text-input" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Total Liability Cap</td>
                    <td>
                        <input type="text" id="t51" runat="server" class="text-input" /></td>
                    <td class="title">Customer Credit Worthiness</td>
                    <td>
                        <label>High<input type="checkbox" id="c38" runat="server" class="cb-style" /></label>
                        <label>Medium<input type="checkbox" id="c39" runat="server" class="cb-style" /></label>
                        <label>Low<input type="checkbox" id="c40" runat="server" class="cb-style" /></label>
                    </td>
                </tr>
                <tr class="topLine">
                    <td class="title" colspan="4">Contract Type and Project Classification<label>Major<input type="checkbox" id="c35" runat="server" class="cb-style" /></label>
                        <label>Minor<input type="checkbox" id="c36" runat="server" class="cb-style" /></label>
                        <label>Miscellaneous<input type="checkbox" id="c37" runat="server" class="cb-style" /></label></td>
                </tr>
                <tr class="topLine">
                    <td colspan="4" class="title">Risk Classification <span class="ref">(per risk classification form) </span></td>
                </tr>
                <tr class="topLine bottomLine">
                    <td class="title">Projects and Improve Contracts</td>
                    <td colspan="3">
                        <label>High<input type="checkbox" id="c41" runat="server" class="cb-style" /></label>
                        <label>Moderate<input type="checkbox" id="c42" runat="server" class="cb-style" /></label>
                        <label>Low<input type="checkbox" id="c43" runat="server" class="cb-style" /></label>
                    </td>
                </tr>
            </table>
            <div class="SectionName">BID NO-BID DECISION <span class="ref">(Check as appropriate) </span></div>
            <table width="1110" class="fullTable">
                <tr class="topLine">
                    <td width="66">
                        <label>Bid<input type="checkbox" id="c44" runat="server" class="cb-style" /></label></td>
                    <td width="419">Request proposal number and update the
                        <br />
                        <span class="ref">Customer Relationship Manager Tool (CRMT) Opportunity Manager</span></td>
                    <td width="404" rowspan="2">Comments:<br />
                        <%--			    <input type="text" id="t52" runat="server" class="text-input"/>--%>
                        <textarea id="t52" runat="server"></textarea>
                    </td>
                </tr>
                <tr class="topLine bottomLine">
                    <td>
                        <label>No Bid<input type="checkbox" id="c45" runat="server" class="cb-style" /></label></td>
                    <td>Close out and update status in the
                        <br />
                        <span class="ref">Customer Relationship Manager Tool (CRMT)Opportunity Manager</span></td>
                </tr>
            </table>
            <div class="SectionName">Attachments<span class="ref">(Check if attached and insert additional documents as applicable)</span></div>
            <table class="fullTable">
                <tr class="topLine">
                    <td class="title">Completed/Approved Risk Classification Form</td>
                    <td>
                        <input type="checkbox" id="c46" runat="server" class="cb-style" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Strategy Memo</td>
                    <td>
                        <input type="checkbox" id="c47" runat="server" class="cb-style" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Proposal Budget</td>
                    <td>
                        <input type="checkbox" id="c48" runat="server" class="cb-style" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Proposal Strategy</td>
                    <td>
                        <input type="checkbox" id="c49" runat="server" class="cb-style" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Preliminary Project Execution Strategy</td>
                    <td>
                        <input type="checkbox" id="c50" runat="server" class="cb-style" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">JV Agreement/Memo of Understanding</td>
                    <td>
                        <input type="checkbox" id="c51" runat="server" class="cb-style" /></td>
                </tr>
                <tr class="topLine">
                    <td class="title">Completed/Approved Credit Check Request Form</td>
                    <td>
                        <input type="checkbox" id="c52" runat="server" class="cb-style" /></td>
                </tr>
                <tr class="topLine bottomLine">
                    <td class="title">
                        <input type="text" id="t53" runat="server" placeholder="Other(Replace “Other” with attached document title & delete this text) " class="text-input" />
                    </td>
                    <td>
                        <input type="checkbox" id="c53" runat="server" class="cb-style" /></td>
                </tr>
            </table>
            <a href="javascript:void(0)" class="btn btn-primary clear-border-radius btn-add-attachment">Add attachment</a>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Attach Description</th>
                        <th>Upload By</th>
                        <th>Upload Date</th>
                        <th>Action(s)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var db = new PPPEntities();
                        var iprojectId = Convert.ToInt32(Request["projectId"]);
                        var isubId = Convert.ToInt32(Request["subId"]);
                        projectId.Value = Request["projectId"];
                        subId.Value = Request["subId"];
                        var atts = db.BNBAttach.Where(x => x.ProjectId == iprojectId && x.SubId == isubId).OrderBy(x => x.Seq);
                        foreach (BNBAttach att in atts)
                        {
                    %>
                    <tr>
                        <td><span class="hidden"><%=att.ProjectId%></span><span class="hidden"><%=att.SubId%></span><span class="hidden"><%=att.Seq%></span> <a href="<%=string.Format("{0}Forms/BNBFiles/{1}", ResolveUrl("~"), att.FileName) %>"><%=att.Description %></a></td>
                        <td><%=att.UploadBy %></td>
                        <td><%=StringHelper.FmtDate(att.UploadDate) %></td>
                        <td><a href="javascript:void(0)" class="btn btn-xs btn-danger delete-attach-row">Delete</a></td>
                    </tr>
                    <%
                    } %>
                </tbody>
            </table>
            <div class="SectionName">APPROVALS<span class="ref">(Refer Regional / Location DoA and check required approvals)</span></div>
            <table class="fullTable">
                <tr class="topLine">
                    <td colspan="2" class="title text-center">Approve</td>
                    <td colspan="2" class="title text-center">Endorse</td>
                    <td colspan="4" class="title text-center"></td>
                </tr>
                <tr class="topLine">
                    <td class="title text-center">Yes</td>
                    <td class="title text-center">No</td>
                    <td class="title text-center">Yes</td>
                    <td class="title text-center">No</td>
                    <td class="title">Title</td>
                    <td class="title">Name</td>
                    <td class="title">Signature</td>
                    <td class="title">Date</td>
                </tr>
                <tr class="topLine">
                    <td>
                        <input type="checkbox" id="c54" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c55" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c56" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c57" runat="server" class="cb-style" /></td>
                    <td class="title">CEO</td>
                    <td>
<%--                        <input type="text" id="t57" runat="server" class="text-input" autocomplete="off" />--%>
                        <select runat="server" id="t57" class="table"></select>
                        <div  class="search-people-result"></div>
                    </td>
                    <td>
                        <input type="text" id="t71" runat="server" class="text-input" readonly="readonly" /></td>
                    <td>
                        <input type="text" id="t58" runat="server" class="text-input" readonly="readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td>
                        <input type="checkbox" id="c58" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c59" runat="server" class="cb-style" />
                        <div  class="search-people-result"></div></td>
                    <td>
                        <input type="checkbox" id="c60" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c61" runat="server" class="cb-style" /></td>
                    <td class="title">CSG Executive Director</td>
                    <td>
                        <%--<input type="text" id="t59" runat="server" class="text-input" autocomplete="off" />--%>
                        <select runat="server" id="t59" class="table"></select>
                        <div  class="search-people-result"></div>
                    </td>
                    <td>
                        <input type="text" id="t72" runat="server" class="text-input" readonly="readonly" /></td>
                    <td>
                        <input type="text" id="t60" runat="server" class="text-input" readonly="readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td>
                        <input type="checkbox" id="c62" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c63" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c64" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c65" runat="server" class="cb-style" /></td>
                    <td class="title">Region Managing Director</td>
                    <td>
                        <%--<input type="text" id="t61" runat="server" class="text-input" autocomplete="off" />--%>
                        <select runat="server" id="t61" class="table"></select>
                        <div  class="search-people-result"></div>
                    </td>
                    <td>
                        <input type="text" id="t73" runat="server" class="text-input" readonly="readonly" /></td>
                    <td>
                        <input type="text" id="t62" runat="server" class="text-input" readonly="readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td>
                        <input type="checkbox" id="c66" runat="server" class="cb-style" checked="True"  disabled="True" /></td>
                    <td>
                        <input type="checkbox" id="c67" runat="server" class="cb-style" checked="False" disabled="True" /></td>
                    <td>
                        <input type="checkbox" id="c68" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c69" runat="server" class="cb-style" /></td>
                    <td class="title">Location Manager</td>
                    <td>
                        <%--<input type="text" id="t63" runat="server" class="text-input" autocomplete="off" />--%>
                        <select runat="server" id="t63" class="table"></select>
                        
                    </td>
                    <td>
                        <input type="text" id="t74" runat="server" class="text-input" readonly="readonly" /></td>
                    <td>
                        <input type="text" id="t64" runat="server" class="text-input" readonly="readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td>
                        <input type="checkbox" id="c70" runat="server" class="cb-style" checked="True" disabled="True"/></td>
                    <td>
                        <input type="checkbox" id="c71" runat="server" class="cb-style" checked="False" disabled="True"/></td>
                    <td>
                        <input type="checkbox" id="c72" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c73" runat="server" class="cb-style" /></td>
                    <td class="title">Location/Region CSG/BD Director</td>
                    <td>
                        <%--<input type="text" id="t65" runat="server" class="text-input" autocomplete="off" />--%>
                        <select runat="server" id="t65" class="table"></select>
                        <div  class="search-people-result"></div>
                    </td>
                    <td>
                        <input type="text" id="t75" runat="server" class="text-input" readonly="readonly" /></td>
                    <td>
                        <input type="text" id="t66" runat="server" class="text-input" readonly="readonly" /></td>
                </tr>
                <tr class="topLine">
                    <td>
                        <input type="checkbox" id="c74" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c75" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c76" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c77" runat="server" class="cb-style" /></td>
                    <td class="title">Manager of Projects/Proposals</td>
                    <td>
                        <input type="text" id="t67" runat="server" class="text-input" autocomplete="off" />
<%--                        <select runat="server" id="t67" class="table"></select>--%>
                        <div  class="search-people-result"></div>
                    </td>
                    <td>
                        <input type="text" id="t76" runat="server" class="text-input" readonly="readonly" /></td>
                    <td>
                        <input type="text" id="t68" runat="server" class="text-input" readonly="readonly" /></td>
                </tr>
                <tr class="topLine bottomLine">
                    <td>
                        <input type="checkbox" id="c78" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c79" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c80" runat="server" class="cb-style" /></td>
                    <td>
                        <input type="checkbox" id="c81" runat="server" class="cb-style" /></td>
                    <td class="title">
                        <input type="text" id="t54" runat="server" class="text-input" placeholder="Other - (Replace other with position title)" /></td>
                    <td>
                        <input type="text" id="t69" runat="server" class="text-input" autocomplete="off" />
                        <div  class="search-people-result"></div>
                    </td>
                    <td>
                        <input type="text" id="t77" runat="server" class="text-input" readonly="readonly" /></td>
                    <td>
                        <input type="text" id="t70" runat="server" class="text-input" readonly="readonly" /></td>
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
            <br />
            <br />
            <br />
            <br />
            <input type="hidden" id="projectId" runat="server" />
            <input type="hidden" id="subId" runat="server" />
            <input type="hidden" id="islocked" runat="server" />
            <input type="hidden" id="isAllApproved" runat="server" />
        </div>
        <!-- 对话框开始 -->
        <div class="modal " id="modalDialog-delete-attach">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Delete confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Confirm delete current item?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger delete-attach">Delete</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <!-- 对话框结束 -->

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
                            <label >Confirm exediting current Bid/NoBid Form?</label>
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
    <form id="frmUploadFile">
        <!-- 对话框开始 -->
        <div class="modal " id="modalDialog-add-attach">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Add attachment</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <label for="fu">File Name <span style="color:red;">*</span></label>
                            <input type="file" id="fu" name="fu" class="form-control" />
<%--                            <label for="no">No</label>
                            <input type="text" id="no" name="no" class="form-control" />--%>
                            <label for="fuDesc">Attach Description <span style="color:red;">*</span></label>
                            <input type="text" id="fuDesc" name="fuDesc" class="form-control" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnDelete" type="button" class="btn btn-primary add-attach">Save</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <!-- 对话框结束 -->
    </form>
</body>
</html>
