<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.Entity" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "Project Register");
        SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            //
            //foreach (TPeople p in db.TPeople.OrderBy(x => x.EmployeeId))
            //{
            //    var li = new ListItem(p.EmployeeId.ToString() + "  " + p.PeopleNameEn, p.EmployeeId.ToString());
            //    editPm.Items.Add(li);
            //}

            editWorkshare.Items.Add(new ListItem("No"));
            editWorkshare.Items.Add(new ListItem("Yes"));
            editProjectStatus.Items.Add(new ListItem("Project Executing"));
            editProjectStatus.Items.Add(new ListItem("Project Closed"));
            editRisk.Items.Add(new ListItem("Low"));
            editRisk.Items.Add(new ListItem("Moderate"));
            editRisk.Items.Add(new ListItem("High"));

            editType.Items.Add(new ListItem("Chemical"));
            editType.Items.Add(new ListItem("Hydrocarbon"));
            editType.Items.Add(new ListItem("Infrastructure"));
            editType.Items.Add(new ListItem("Metals&Minerals"));
            editType.Items.Add(new ListItem("Power"));
            editType.Items.Add(new ListItem("Overhead"));
            editContractType.Items.Add(new ListItem(""));
            editContractType.Items.Add(new ListItem("Reimbursable Schedule of Rates"));
            editContractType.Items.Add(new ListItem("Lump Sum"));
            editContractType.Items.Add(new ListItem("Cost Plus"));
            editContractType.Items.Add(new ListItem("Target Incentives"));
            editContractType.Items.Add(new ListItem("Other"));
            editContractType.Items.Add(new ListItem("N/A (Proposal)"));

            editServiceType.Items.Add(new ListItem(""));
            editServiceType.Items.Add(new ListItem("Study"));
            editServiceType.Items.Add(new ListItem("E"));
            editServiceType.Items.Add(new ListItem("P"));
            editServiceType.Items.Add(new ListItem("EP"));
            editServiceType.Items.Add(new ListItem("EPCM"));
            editServiceType.Items.Add(new ListItem("C"));
            editServiceType.Items.Add(new ListItem("CM"));
            editServiceType.Items.Add(new ListItem("PMC"));

            editProjectSize.Items.Add(new ListItem(""));
            editProjectSize.Items.Add(new ListItem("Small"));
            editProjectSize.Items.Add(new ListItem("Medium"));
            editProjectSize.Items.Add(new ListItem("Large"));

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

            //filterOffice

            var db = new PPPEntities();
            var q = (from x in db.TProjectRegister
                     select x.Year);
            if (q.Any())
            {
                q = q.Distinct();
            }
            var lst = new List<int>();
            foreach (var item in q)
            {
                var iv = 0;

                if (item != string.Empty && int.TryParse(item, out iv))
                {
                    lst.Add(Convert.ToInt32(item));
                }
            }
            lst.Sort();

            foreach (var item in lst)
            {
                filterYear.Items.Add(new ListItem(item.ToString().PadLeft(2, '0')));
            }
            filterYear.Items.Insert(0, new ListItem(""));


            var v = (from u in db.TProjectRegister
                     select u.Office);
            if (v.Any())
            {
                v = v.Distinct();
            }
            foreach (var x in v)
            {
                filterOffice.Items.Add(new ListItem(TransCodeHelper.TransOffice(x), x));
            }
            filterOffice.Items.Insert(0, new ListItem(""));
            ;

            financeReport.HRef = "Actions/FinanceReport.aspx?1=1";
            //if (!string.IsNullOrEmpty(Request["year"]))
            //{
            //    financeReport.HRef += "year=" + Request["year"];
            //}
            //if (!string.IsNullOrEmpty(Request["status"]))
            //{
            //    financeReport.HRef += "status=" + Request["status"];
            //}
            //if (!string.IsNullOrEmpty(Request["csg"]))
            //{
            //    financeReport.HRef += "csg=" + Request["csg"];
            //}
            //if (!string.IsNullOrEmpty(Request["searchKey"]))
            //{
            //    financeReport.HRef += "searchKey=" + Request["searchKey"];
            //}
        }
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
    <script src="<%=ResolveUrl("~/ProjectRegister/js/projectRegister.js")%>" ></script>
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
    
    <script>
        $(function() {
            $("#filterYear").val(GetQueryString("year"));
            $("#projectStatus").val(GetQueryString("status"));
            $("#filterCsg").val(GetQueryString("csg"));
            $("#filterOffice").val(GetQueryString("office"));
            $("#searchKey").val(GetQueryString("searchKey"));

            $("#projectStatus, #filterYear, #filterOffice, #filterCsg").change(function () {
                document.location.href = "ProjectRegister.aspx?year=" + $("#filterYear").val()
                    + "&status=" + $("#projectStatus").val()
                    + "&csg=" + $("#filterCsg").val()
                    + "&office=" + $("#filterOffice").val()
                    + "&searchKey=" + $("#searchKey").val()
                ;
            });

            $(".search").click(function () {
                document.location.href = "ProjectRegister.aspx?year=" + $("#filterYear").val()
                    + "&status=" + $("#projectStatus").val()
                    + "&csg=" + $("#filterCsg").val()
                    + "&office=" + $("#filterOffice").val()
                    + "&searchKey=" + $("#searchKey").val()
                ;
            });

            $("#financeReport").click(function () {
                $("#financeReport").attr("href", "Actions/FinanceReport.aspx?year=" + GetQueryString("year")
                    + "&csg=" + GetQueryString("csg")
                    + "&office=" + GetQueryString("office")
                    + "&status=" + GetQueryString("status")
                    + "&searchKey=" + GetQueryString("searchKey")
                    );
            })

        });

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <span>Project Register</span>
<h4 class="text-center">Project Register</h4>
<div class="container" >
    <div class="" style="margin: 20px !important; ">
    <div class="col-lg-3 col-md-3 col-xs-3">
        <div class="input-group">
            <span class="input-group-addon">
                CSG
            </span>
            <select id="filterCsg" runat="server" class="form-control" style="-moz-min-width: 80px; -ms-min-width: 80px; -o-min-width: 80px; -webkit-min-width: 80px; min-width: 80px;">
                <option value=""></option>
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
        </div>
    </div>
    <div class="col-lg-2 col-md-2 col-xs-2">
        <div class="input-group">
            <span class="input-group-addon">
                Office
            </span>
            <select runat="server" id="filterOffice" name="filterOffice" class="form-control">

            </select>
        </div>
    </div>
    <div class="col-lg-2 col-md-2 col-xs-2">
        <div class="input-group">
            <span class="input-group-addon">
                Year
            </span>
            <select id="filterYear" runat="server" class="form-control" style="-moz-min-width: 70px; -ms-min-width: 70px; -o-min-width: 70px; -webkit-min-width: 70px; min-width: 70px;">
            </select>
        </div>
    </div>
    <div class="col-lg-2 col-md-2 col-xs-2">
        <div class="input-group">
            <span class="input-group-addon">
                Status
            </span>
            <select id="projectStatus" runat="server" class="form-control">
                <option></option>
                <option>To be Close</option>
                <option>Executing</option>
                <option>Closed</option>
            </select>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-xs-3">
        <div class="input-group">
            <input class="form-control" id="searchKey" runat="server" />
            <span class="input-group-btn">
                <a href="javascript:void(0);" class="btn btn-primary search">Search</a>
            </span>
        </div>
    </div>
    </div>
</div>    
    <div class="container1" style="border:1px dotted lightgray; margin:5px; padding:5px;background-color:lightcyan">
        <a class="btn btn-default Finance-Report" runat="server" id="financeReport" >Finance Report</a>
    </div>
    <div class="container1" >

<!-- Tab Start -->
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0" onclick="javascript:location.href='Default.aspx?projectId=<%=Request["ProjectId"] %>';">Proposal</li>
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="1">Project</li>
  </ul>
  <div class="TabbedPanelsContentGroup" style="border:0px solid white">
  <div class="TabbedPanelsContent"></div>
  <div class="TabbedPanelsContent" style="overflow-x: auto; padding-left: 0; padding-top:0">
      <!-- 当前页正文 开始 -->
        <table class="table table-bordered table-hover header" style="width: 4500px;">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Action(s)</th>
                    <th>CSG</th>
                    <th>Year</th>
                    <th>Office</th>
                    <th>Phase</th>
                    <th>Serial No.</th>
                    <th>Project No.</th>
                    <th>Proposal No.</th>
                    <th>Client Name</th>
                    <th>Project Name</th>
                    <th style="width: 350px;">Project Description</th>
                    <th>SOW</th>
                    <th>Project Location</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Contract Type</th>
                    <th>Type</th>
                    <th>Service Type</th>
                    <th>Contract Holder</th>
                    <th>Currency</th>
                    <th>CV</th>
                    <th>Project Size</th>
                    <th>PM</th>
                    <th>Risk</th>
                    <th>HSE Responsibility</th>
                    <th>Project Information</th>
                    <th>Award Month</th>
                    <th>Created By</th>
                    <th>Modified</th>
                    <th>Created</th>
                    <th>Sponsor</th>
                    <th>Closed Date</th>
                    <th>Project Status</th>
                    <th>Manhours</th>
                    <th>Workshare</th>
                    <th>Final CV (in RMB)</th>
                    <th>Final Manhours</th>
                    <th>CRMT ID</th>
                    <th>Registered Date</th>
                    <th>Customer Contact Name</th>
                    <th>Tel No</th>
                    <th>Item Type</th>
                    <th>Entity<br/>(TimeSheet)</th>
                    <th>Category<br/>(TimeSheet)</th>
                    <th>Classification<br />(TimeSheet)</th>
                    <th>HSECategory<br/>(TimeSheet)</th>
                    
                    <th>Customer Subsector</th>
                    <th>Capability Subsector</th>
                    <th>Asset type</th>
                    <th>Country of Asset</th>
                    <th>Customer Type</th>
                    <th>Business Line</th>
                    <th>Billing Type</th>
                    <th>Scope of Services</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 10;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页

                    var q = db.TProjectRegister.AsEnumerable();
                    var pYear = Request["year"];
                    var pStatus = Request["status"];
                    var pCsg = Request["csg"];
                    var pOffice = Request["office"];
                    var pSearchKey = Request["searchKey"];
                    if (!string.IsNullOrEmpty(pYear))
                    {
                        q = q.Where(x => x.Year == pYear);
                    }
                    if (!string.IsNullOrEmpty(pStatus))
                    {
                        q = q.Where(x => x.ProjectStatus == pStatus);
                    }
                    if (!string.IsNullOrEmpty(pCsg))
                    {
                        q = q.Where(x => x.CSG == pCsg);
                    }
                    if (!string.IsNullOrEmpty(pOffice))
                    {
                        q = q.Where(x => x.Office == pOffice);
                    }
                    if (!string.IsNullOrEmpty(pSearchKey))
                    {
                        q = q.Where(x => x.ClientName.Contains(pSearchKey) || x.ProjectName.Contains(pSearchKey) || x.ProjectNo.Contains(pSearchKey));
                    }

                    var cnt = q.Count();
                    q = q.OrderByDescending(x => x.CRMTID).Skip(pageSize * (pageIndex - 1)).Take(pageSize);

                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });

                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        int ii = 0;
                        var pm = "";
                        if (int.TryParse(dr.PM, out ii))
                        {
                            var empId = Convert.ToInt32(dr.PM);
                            var ppl = db.TPeople.FirstOrDefault(x => x.EmployeeId == empId);
                            pm = ppl.PeopleNameEn;
                        }
                        else
                        {
                            pm = dr.PM;
                        }
                        var customerSubsector = string.Empty;
                        var capabilitySubsector = string.Empty;
                        var assetType = string.Empty;
                        var countryOfAsset = string.Empty;
                        var customerType = string.Empty;
                        var businessLine = string.Empty;
                        var billingType = string.Empty;
                        var scopeOfServices = string.Empty;

                        var pp = db.TProjectX.Where(x => x.ProjectNo == dr.ProjectNo).OrderByDescending(x=>x.SubId);
                        TProjectX projectInfo = null;
                        if (pp.Any())
                        {
                            projectInfo = pp.First();

                            var subId = projectInfo.SubId;
                            var projectId = projectInfo.ProjectId;
                            var npis = db.NPISForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);

                            customerSubsector = TransCodeHelper.TransCustomerSubsector(npis.t49);
                            capabilitySubsector = TransCodeHelper.TransCapabilitySubsector(npis.t50);
                            assetType = npis.t55;
                            countryOfAsset = npis.t54;
                            customerType = npis.t12;
                            businessLine = npis.t4;
                            billingType = npis.t29;
                            scopeOfServices = npis.t53;
                        }

                        sb.AppendFormat("<tr><td style='width:150px;display:inline-block;'><div class='btn-group'><a class='btn btn-sm btn-primary Edit-Row'>Edit</a><a class='btn btn-sm btn-danger to-be-close' title =''>To be Close</a></div></td><td><span data-id='{0}'>{41}</span></td><td>{1}</td><td><span data-id='{2}'>{42}</span></td><td><span data-id='{3}'>{43}</span></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td style='width:200px;'>{9}</td><td style='width:500px;'>{10}</td><td >{11}</td><td>{12}</td><td>{13}</td><td>{14}</td><td>{15}</td><td>{16}</td><td>{17}</td><td>{18}</td><td>{19}</td><td>{20}</td><td><span data-id='{21}'>{44}</span></td><td>{22}</td><td>{23}</td><td>{24}</td><td>{25}</td><td>{26}</td><td>{27}</td><td>{28}</td><td>{29}</td><td>{30}</td><td>{31}</td><td>{32}</td><td>{33}</td><td>{34}</td><td>{35}</td><td>{36}</td><td>{37}</td><td>{38}</td><td>{39}</td><td>{40}</td><td>{45}</td><td>{46}</td><td>{47}</td><td>{48}</td><td>{49}</td><td>{50}</td><td>{51}</td><td>{52}</td><td>{53}</td><td>{54}</td><td>{55}</td><td>{56}</td></tr>",
                            dr.CSG,
                            dr.Year,
                            dr.Office,
                            dr.Phase,
                            dr.SerialNo,
                            dr.ProjectNo,
                            dr.ProposalNo,
                            dr.ClientName,
                            dr.ProjectName,
                            dr.ProjectDescription,
                            dr.Sow,
                            dr.ProjectLocation,
                            StringHelper.FmtDate(dr.StartDate),
                            StringHelper.FmtDate(dr.EndDate),
                            dr.ContractType,
                            dr.Type,
                            dr.ServiceType,
                            dr.ContractHolder,
                            dr.Currency,
                            dr.CV,
                            dr.ProjectSize,
                            pm,
                            dr.Risk,
                            dr.HSEResponsibility,
                            dr.ProjectInformation,
                            dr.AwardMonth,
                            dr.CreatedBy,
                            dr.Modified,
                            dr.Created,
                            dr.Sponsor,
                            StringHelper.FmtDate(dr.ClosedDate),
                            dr.ProjectStatus,
                            dr.Manhours,
                            dr.Workshare,
                            dr.FinalCV,
                            dr.FinalManhours,
                            dr.CRMTID,
                            StringHelper.FmtDate(dr.RegisteredDate),
                            dr.CustomerContactName,
                            dr.TelNo,
                            dr.ItemType,
                            TransCodeHelper.TransCSG(dr.CSG),
                            TransCodeHelper.TransOffice(dr.Office),
                            TransCodeHelper.TransPhase(dr.Phase),
                            pm,
                            dr.TSEntity,
                            dr.TSCategory,
                            dr.TSClassification,
                            dr.TSHSECategory,
                            customerSubsector,
                            capabilitySubsector,
                            assetType,
                            countryOfAsset,
                            customerType,
                            businessLine,
                            billingType,
                            scopeOfServices
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, cnt, 129)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
      <div class="text-center">
<%--        <button type="button" class="btn btn-primary to-be-close">To be Close</button>--%>
      </div>
      <!-- 当前页正文 结束 -->
  </div>
  </div>
</div>
<script type="text/javascript">
    var TabbedPanels1
        = new Spry.Widget.TabbedPanels("TabbedPanels1");
    TabbedPanels1.showPanel(1);
</script>
<!-- Tab End -->
    </div>
    <div>
    </div>
        
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
                                <label>Project No.</label>
                                <input type="text" id="editProjectNo" name="editProjectNo" runat="server" class="form-control"  />
                                <label>Proposal No.</label>
                                <input type="text" id="editProposalNo" name="editProposalNo" runat="server" class="form-control" />
                                <label>Client / Owner</label>
                                <input type="text" id="editClientOwner" name="editClientOwner" runat="server" class="form-control" />
                                <label>Project Name</label>
                                <input type="text" id="editProjectName" name="editProjectName" runat="server" class="form-control" />
                                <label>Project Description</label>
                                <input type="text" id="editProjectDescription" name="editProjectDescription" runat="server" class="form-control" />
                                <label>SOW</label>
                                <input type="text" id="editSow" name="editSow" runat="server" class="form-control" />
                                <label>Project Location</label>
                                <input type="text" id="editProjectLocation" name="editProjectLocation" runat="server" class="form-control" />
                                <label>Start</label>
                                <input type="text" id="editStartDate" name="editStartDate" runat="server" class="form-control" />
                                <label>End</label>
                                <input type="text" id="editEndDate" name="editEndDate" runat="server" class="form-control" />
                                <label>ContractType</label>
                                <asp:DropDownList runat="server" id="editContractType" name="editContractType" class="form-control" />
                                <label>Type</label>
                                <asp:DropDownList runat="server" id="editType" name="editType" class="form-control" />
                                <label>Service Type</label>
                                <asp:DropDownList runat="server" id="editServiceType" name="editServiceType" class="form-control" />
                                <label>Contract Holder</label>
                                <input type="text" id="editContractHolder" name="editContractHolder" runat="server" class="form-control" />
                                <label>Currency</label>
                                <input type="text" id="editCurrency" name="editCurrency" runat="server" class="form-control" />
                                <label>CV</label>
                                <input type="text" id="editCV" name="editCV" runat="server" class="form-control" />
                                <label>Project Size</label>
                                <asp:DropDownList runat="server" id="editProjectSize" name="editProjectSize" class="form-control" />
                                <label>Project Manager</label>
                                <input type="text" id="editPm" name="editCV" runat="server" class="form-control" />
                                <div  class="search-people-result"></div>
                                <label>Risk</label>
                                <asp:DropDownList runat="server" id="editRisk" name="editRisk" class="form-control" />
                                <label>HSE Responsibility</label>
                                <input type="text" id="editHSEResponsibility" name="editHSEResponsibility" runat="server" class="form-control" />
                                <label>Project Information</label>
                                <input type="text" id="editProjectInformation" name="editProjectInformation" runat="server" class="form-control" />
                                <label>Award Month</label>
                                <input type="text" id="editAwardMonth" name="editAwardMonth" runat="server" class="form-control" />
                                <label>Created By</label>
                                <input type="text" id="editCreatedBy" name="editCreatedBy" runat="server" class="form-control" readonly="readonly" />
                                <label>Modified</label>
                                <input type="text" id="editModifiedt" name="editModifiedt" runat="server" class="form-control" readonly="readonly" />
                                <label>Created</label>
                                <input type="text" id="editCreated" name="editCreated" runat="server" class="form-control" readonly="readonly" />
                                <label>Sponsor</label>
                                <input type="text" id="editSponsor" name="editSponsor" runat="server" class="form-control" />
                                <label>Closed Date</label>
                                <input type="text" id="editClosedDate" name="editClosedDate" runat="server" class="form-control" />
                                <label>Project Status</label>
                                <%--<input type="text" id="editProjectStatus" name="editProjectStatus" runat="server" class="form-control" />--%>
                                <asp:DropDownList runat="server" id="editProjectStatus" name="editProjectStatus" class="form-control" />
                                <label>Manhours</label>
                                <input type="text" id="editManhours" name="editManhours" runat="server" class="form-control" />
                                <label>Workshare</label>
<%--                                <input type="text" id="editWorkshare" name="editWorkshare" runat="server" class="form-control" />--%>
                                <asp:DropDownList runat="server" id="editWorkshare" name="editWorkshare" class="form-control" />
                                <label>Final CV</label>
                                <input type="text" id="editFinalCV" name="editFinalCV" runat="server" class="form-control" />
                                <label>Final Manhours</label>
                                <input type="text" id="editFinalManhours" name="editFinalManhours" runat="server" class="form-control" />
                                <label>RegisteredDate</label>
                                <input type="text" id="editRegisteredDate" name="editRegisteredDate" runat="server" class="form-control" />
                                <label>Customer Contact Name</label>
                                <input type="text" id="editCustomerContactName" name="editCustomerContactName" runat="server" class="form-control" />
                                <label>Tel No.</label>
                                <input type="text" id="editTelNo" name="editTelNo" runat="server" class="form-control" />
                                <label>Item Type</label>
                                <input type="text" id="editItemType" name="editItemType" runat="server" class="form-control" />

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
