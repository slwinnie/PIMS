<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "Proposal Register");
        SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            var db = new PPPEntities();

            editEntity.Items.Add(new ListItem(""));
            editEntity.Items.Add(new ListItem("WPC"));
            editEntity.Items.Add(new ListItem("WPC BJ"));
            editEntity.Items.Add(new ListItem("WPC SH"));
            editEntity.Items.Add(new ListItem("LYG"));
            editEntity.Items.Add(new ListItem("LYG BJ"));
            editEntity.Items.Add(new ListItem("LYG SH"));
            editEntity.Items.Add(new ListItem("LYG CD"));
            editEntity.Items.Add(new ListItem("LYG NJ"));
            editEntity.Items.Add(new ListItem("LYG TJ"));
            editEntity.Items.Add(new ListItem("CD WPC"));
            editEntity.Items.Add(new ListItem("TJ WPC"));
            editEntity.Items.Add(new ListItem("UNET BJ"));

            editCategory.Items.Add(new ListItem(""));
            editCategory.Items.Add(new ListItem("Work in Hands"));
            editCategory.Items.Add(new ListItem("Prospect"));
            editCategory.Items.Add(new ListItem("Blue Sky"));

            editClassification.Items.Add(new ListItem(""));
            editClassification.Items.Add(new ListItem("Small"));
            editClassification.Items.Add(new ListItem("Medium"));
            editClassification.Items.Add(new ListItem("Large"));

            editHSECategory.Items.Add(new ListItem(""));
            editHSECategory.Items.Add(new ListItem("N/A"));
            editHSECategory.Items.Add(new ListItem("WP-Primacy"));
            editHSECategory.Items.Add(new ListItem("WP-Non-Primacy"));



        }
    }

    private string TransCSG(string csgId)
    {
        switch (csgId)
        {
            case "CC":
                return "CC-Chemicals";
            case "HU":
                return "HU-Hydrocarbons Upstream";
            case "HH":
                return "HH-Hydrocarbons Downstream";
            case "PP":
                return "PP-Power";
            case "PH":
                return "PH-Power Workshare";
            case "MM":
                return "MM-Minerals&amp;Metals";
            case "MH":
                return "MH-Minerals&amp;Metals Workshare";
            case "IE":
                return "IE-Infrastructure";
            case "IH":
                return "IH-Infrastructure Workshare";
            case "LC":
                return "LC-LYG";
        }
        return csgId;
    }

    private string TransOffice(string officeId)
    {
        switch (officeId)
        {
            case "11":
                return "11-Beijing Office";
            case "12":
                return "12-Shanghai Office";
            case "13":
                return "13-Nanjing Office";
            case "14":
                return "14-Tianjin Office";
            case "20":
                return "20-Chengdu Office";
            case "21":
                return "21-PAS (21 including Procurement)";
            case "31":
                return "31-GDC BJ";
            case "33":
                return "33-GDC NJ";
            case "34":
                return "34-GDC TJ";
            case "41":
                return "41-Advisian BJ";
            case "53":
                return "53-International Chemicals NJ";
        }
        return officeId;
    }

    private string TransPhase(string phaseId)
    {
        switch (phaseId)
        {
            case "A":
                return "A-Advisory";
            case "C":
                return "C-Consulting / Selected (Pre-FEED)";
            case "D":
                return "D-Execute, FEED/Identify/Evaluate/Define EPCM/EPC, PMC/DED/Deliver";
            case "M":
                return "M-Major Project";
        }
        return phaseId;
    }

    private string TransPm(string pmId)
    {
        var db = new PPPEntities();
        try
        {
            var pp = db.TPeople.Find(Convert.ToInt32(pmId));
            if (pp != null)
            {
                return pmId + "-" + pp.PeopleNameEn;
            }
        }
        catch (Exception ex)
        {
            // ignored
        }

        return pmId;
    }    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/SpryTabbedPanels.css") %>"/>

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/ProjectRegister/js/proposalRegister.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/SpryTabbedPanels.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <style>
         .HeaderLinearBackground { 
           background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
         }
        .selected{
            background-color:bisque;
            /*border: 2px solid #5cb85c;*/
            font-weight: bold;
            /*background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));*/
        }
        .roTitle {
            /*-webkit-transform: rotate(-90deg); 
            -moz-transform: rotate(-90deg);*/ 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">

<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <span>Proposal Register</span>
<h4 class="text-center">Proposal Register</h4>
    <div class="container">

<!-- Tab Start -->
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Proposal</li>
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="1" onclick="javascript:location.href='ProjectRegister.aspx?projectId=<%=Request["ProjectId"] %>';">Project</li>
    <li class="btn btn-success pull-right" tabindex="2" style="-ms-border-radius: 0 !important; border-radius: 0 !important; padding: 4px 9px;" onclick="javascript:location.href='CreateProject.aspx';">Export</li>
  </ul>
  <div class="TabbedPanelsContentGroup" style="border:0px solid white">
  <div class="TabbedPanelsContent" style="overflow-x: auto; padding-left: 0; padding-top:0">
      <!-- 当前页正文 开始 -->
        <table class="table table-bordered table-hover header" style="width: 100%">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Action(s)</th>
                    <th>CSG</th>
                    <th>Year</th>
                    <th>Office</th>
                    <th>Phase</th>
                    <th>Serial No.</th>
                    <th>Proposal No.</th>
                    <th>Names of Immediate Client / Owner</th>
                    <th>Proposal Name</th>
                    <th>Proposal Description</th>
                    <th>SOW</th>
                    <th>TOC</th>
                    <th>Country</th>
                    <th>Location (City)</th>
                    <th>HOMH (Estimated)</th>
                    <th>Currency</th>
                    <th>CV (Estimated)</th>
                    <th>PC (Estimated)</th>
                    <th>BDD</th>
                    <th>Duration (mths)</th>
                    <th>Proposal Manager</th>
                    <th>GO%</th>
                    <th>Get%</th>
                    <th>TIC (Millions)</th>
                    <th>Risk</th>
                    <th>Bid Bond (if any)</th>
                    <th>EDA</th>
                    <th>Competitors</th>
                    <th>Remarks</th>
                    <th>Person Resp.</th>
                    <th>Modified</th>
                    <th>Report Date</th>
                    <th>HSE Responsibility</th>
                    <th>Status</th>
                    <th>Customer Contact Name</th>
                    <th>Tel No.</th>
                    <th>CRMT ID</th>
                    <th>Archive</th>
                    <th>Item Type</th>
                    <th>Fill Date</th>
                    <th>Entity<br/>(TimeSheet)</th>
                    <th>Category<br/>(TimeSheet)</th>
                    <th>Classification<br />(TimeSheet)</th>
                    <th>HSECategory<br/>(TimeSheet)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 20;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var cnt = db.TProposalRegister.Count();
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });
                    var q = db.TProposalRegister.OrderByDescending(x => x.CRMTID).Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        sb.AppendFormat("<tr><td style='width:150px;display:inline-block;border:0;border-top:1px solid lightgray;'><div class='btn-group'><a class='btn btn-sm btn-primary Edit-Row'>Edit</a><a class='btn btn-sm btn-success Update-Row' title ='Update current proposal information to the timesheet system'>Update</a></div></td><td><span data-id='{0}'>{39}</span></td><td>{1}</td><td style='width:150px; '><span data-id='{2}'>{40}<span></td><td ><span data-id='{3}'>{41}</span></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td><td>{13}</td><td>{14}</td><td>{15}</td><td>{16}</td><td>{17}</td><td>{18}</td><td><span data-id='{19}'>{42}</span></td><td>{20}</td><td>{21}</td><td>{22}</td><td>{23}</td><td>{24}</td><td>{25}</td><td>{26}</td><td>{27}</td><td>{28}</td><td>{29}</td><td>{30}</td><td>{31}</td><td>{32}</td><td>{33}</td><td>{34}</td><td>{35}</td><td>{36}</td><td>{37}</td><td>{38}</td><td>{43}</td><td>{44}</td><td>{45}</td><td>{46}</td></tr>",
                            dr.CSG,
                            dr.Year,
                            dr.Office,
                            dr.Phase, 
                            dr.SerialNo,
                            dr.ProposalNo,
                            dr.NamesOfImmediateClientOrOwner,
                            dr.ProposalName,
                            dr.ProposalDescription,
                            dr.Sow,
                            dr.Toc,
                            dr.Country,
                            dr.Location,
                            dr.HOMH,
                            dr.Currency,
                            dr.CV,
                            dr.PC,
                            dr.BDD,
                            dr.Duration,
                            dr.ProposalManager,
                            dr.Go,
                            dr.Get,
                            dr.TIC,
                            dr.Risk,
                            dr.BidBond,
                            dr.EDA,
                            dr.Competitors,
                            dr.Remarks,
                            dr.PersonResp,
                            dr.Modified,
                            dr.ReportDate,
                            dr.HSEResponsibility,
                            dr.Status,
                            dr.CustomerContactName,
                            dr.TelNo,
                            dr.CRMTID,
                            dr.Archive,
                            dr.ItemType,
                            StringHelper.FmtDate(dr.FillDate),
                            TransCSG(dr.CSG),
                            TransOffice(dr.Office),
                            TransPhase(dr.Phase),
                            TransPm(dr.ProposalManager),
                            dr.TSEntity,
                            dr.TSCategory,
                            dr.TSClassification,
                            dr.TSHSECategory
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, cnt, 129)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
    </div>
    <div class="TabbedPanelsContent"></div>

      <div>

    </div>
      <!-- 当前页正文 结束 -->
  </div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1
 = new Spry.Widget.TabbedPanels("TabbedPanels1");

</script>
<!-- Tab End -->

        
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Edit</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <label>CRMT ID</label>
                                <input type="text" id="editCrmtId" name="editCrmtId" runat="server" class="form-control" readonly="readonly"/>
                                <label class="">CSG</label>
                                <select runat="server" id="editCsg" name="editCsg" class="form-control">
                                    <option value="CC">CC-Chemicals</option>
                                    <option value="HU">HU-Hydrocarbons Upstream</option>
                                    <option value="HH">HH-Hydrocarbons Downstream</option>
                                    <option value="PP">PP-Power</option>
                                    <option value="PH">PH-Power Workshare</option>
                                    <option value="MM">MM-Minerals&amp;Metals</option>
                                    <option value="MH">MH-Minerals&amp;Metals Workshare</option>
                                    <option value="IE">IE-Infrastructure</option>
                                    <option value="IH">IH-Infrastructure Workshare</option>
                                    <option value="LC">LC-LYG</option>
                                </select>
                                <label class="">Year</label>
                                <input type="text" class="form-control" id="editYear" runat="server"/>
                                <label class="">Office</label>
                                <select id="editOffice" name="editOffice" runat="server" class="form-control" >
                                    <option value="11">11-Beijing Office</option>
                                    <option value="12">12-Shanghai Office</option>
                                    <option value="13">13-Nanjing Office</option>
                                    <option value="14">14-Tianjin Office</option>
                                    <option value="20">20-Chengdu Office</option>
                                    <option value="21">21-PAS (21 including Procurement)</option>
                                    <option value="31">31-GDC BJ</option>
                                    <option value="33">33-GDC NJ</option>
                                    <option value="34">34-GDC TJ</option>
                                    <option value="41">41-Advisian BJ</option>
                                    <option value="53">53-International Chemicals NJ</option>
                                </select>
                                <label class="">Phase</label>
                                <select id="editPhase" name="editPhase" runat="server" class="form-control" >
                                    <option value="A">A-Advisory</option>
                                    <option value="C">C-Consulting / Selected (Pre-FEED)</option>
                                    <option value="D">D-Execute, FEED/Identify/Evaluate/Define EPCM/EPC, PMC/DED/Deliver</option>
                                    <option value="M">M-Major Project</option>
                                </select>
                                <label>Serials Number</label>
                                <input type="text" id="editSerialNo" name="editSerialNo" runat="server" class="form-control" />
                                <label>Proposal No.</label>
                                <input type="text" id="editProposalNo" name="editProposalNo" runat="server" class="form-control" readonly="readonly" />
                                <label>Names of Immediate Client / Owner</label>
                                <input type="text" id="editClientOwner" name="editClientOwner" runat="server" class="form-control" />
                                <label>Proposal Name</label>
                                <input type="text" id="editProposalName" name="editProposalName" runat="server" class="form-control" />
                                <label>Proposal Description</label>
                                <input type="text" id="editProposalDescription" name="editProposalDescription" runat="server" class="form-control" />
                                <label>SOW</label>
                                <input type="text" id="editSow" name="editSow" runat="server" class="form-control" />
                                <label>TOC</label>
                                <input type="text" id="editToc" name="editToc" runat="server" class="form-control" />
                                <label>Country</label>
                                <input type="text" id="editCountry" name="editCountry" runat="server" class="form-control" />
                                <label>Location (City)</label>
                                <input type="text" id="editLocation" name="editLocation" runat="server" class="form-control" />
                                <label>HOMH (Estimated)	</label>
                                <input type="text" id="editHomh" name="editHomh" runat="server" class="form-control" />
                                <label>CURRENCY</label>
                                <input type="text" id="editCurrency" name="editCurrency" runat="server" class="form-control" />
                                <label>CV (Estimated)</label>
                                <input type="text" id="editCV" name="editCV" runat="server" class="form-control" />
                                <label>PC (Estimated)</label>
                                <input type="text" id="editPC" name="editPC" runat="server" class="form-control" />
                                <label>BDD</label>
                                <input type="text" id="editBDD" name="editBDD" runat="server" class="form-control" />
                                <label>Duration (mths)	</label>
                                <input type="text" id="editDuration" name="editDuration" runat="server" class="form-control" />
                                <label>Proposal Manager	</label>
                                <%--<asp:DropDownList runat="server" id="editProposalManager" name="editProposalManager" class="form-control" />--%>
                                <input type="text" id="editProposalManager" runat="server" class="form-control" />
                                <div  class="search-people-result"></div>
                                <label>GO %</label>
                                <input type="text" id="editGo" name="editGo" runat="server" class="form-control" />
                                <label>Get %</label>
                                <input type="text" id="editGet" name="editGet" runat="server" class="form-control" />
                                <label>TIC (Millions)</label>
                                <input type="text" id="editTIC" name="editTIC" runat="server" class="form-control" />
                                <label>Risk</label>
                                <input type="text" id="editRisk" name="editRisk" runat="server" class="form-control" />
                                <label>Bid Bond (if any)</label>
                                <input type="text" id="editBidBond" name="editBidBond" runat="server" class="form-control" />
                                <label>EDA</label>
                                <input type="text" id="editEda" name="editEda" runat="server" class="form-control" />
                                <label>Competitors</label>
                                <input type="text" id="editCompetitors" name="editCompetitors" runat="server" class="form-control" />
                                <label>Remarks</label>
                                <input type="text" id="editRemarks" name="editRemarks" runat="server" class="form-control" />
                                <label>Person Resp.</label>
                                <input type="text" id="editPersonResp" name="editPersonResp" runat="server" class="form-control" />
                                <label>Report Date</label>
                                <input type="text" id="editReportDate" name="editReportDate" runat="server" class="form-control" />
                                <label>HSE Responsibility</label>
                                <input type="text" id="editHSEResponsibility" name="editHSEResponsibility" runat="server" class="form-control" />
                                <label>Status</label>
                                <input type="text" id="editStatus" name="editStatus" runat="server" class="form-control" readonly="readonly" />
                                <label>Customer Contact Name</label>
                                <input type="text" id="editCustomerContactName" name="editCustomerContactName" runat="server" class="form-control" />
                                <label>Tel No.</label>
                                <input type="text" id="editTelNo" name="editTelNo" runat="server" class="form-control" readonly="readonly" />
                                <label>Archive</label>
                                <input type="text" id="editArchive" name="editArchive" runat="server" class="form-control" />
                                <label>Item Type</label>
                                <input type="text" id="editItemType" name="editItemType" runat="server" class="form-control" />
                                <label>Fill Date</label>
                                <input type="text" id="editFillDate" name="editFillDate" runat="server" class="form-control" />
                                <label>Entity</label>
                                <asp:DropDownList runat="server" id="editEntity" name="editEntity" class="form-control" />
                                <label>Category</label>
                                <asp:DropDownList runat="server" id="editCategory" name="editCategory" class="form-control" />
                                <label>Classification</label>
                                <asp:DropDownList runat="server" id="editClassification" name="editClassification" class="form-control" />
                                <label>HSECategory</label>
                                <asp:DropDownList runat="server" id="editHSECategory" name="editHSECategory" class="form-control" />
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnSave" type="button" class="btn btn-primary">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
    </form>
</body>
</html>
