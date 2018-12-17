<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%SystemHelper.SetPageNo(this, "CRMT"); %>
<%SystemHelper.SessionCheck(this); %>
<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>

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
    </style>
    <script>
        $(function() {
            //读取当前CRMT Loader的详细信息
            $(".header tr:gt(0)").click(function() {
                var crmdId = $(this).find("td:eq(0)").html();
                console.log(crmdId);
                $(this).siblings().removeClass('selected');
                $(this).addClass('selected');
                $.ajax({
                    url: "./Actions/ProjectJsonData.aspx?crmtid=" + crmdId,
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function(d) {
                        try {
                            console.log("a");
                            $("#crmtTable tr:gt(0)").remove();
                            console.log("b");
                            var jsonLines = JSON.parse(d);
                            $.each(jsonLines, function(n, json) {
                                $("#crmtTable").append("<tr><td>" + json.RowStatus
                                    + "</td><td>" + json.ProjectId
                                    + "</td><td>" + json.BusinessUnit
                                    + "</td><td>" + json.BusinessLine
                                    + "</td><td>" + json.OpportunityLeadSector
                                    + "</td><td>" + json.ProjectName
                                    + "</td><td>" + json.Customer
                                    + "</td><td>" + json.Status
                                    + "</td><td>" + json.BidDueDate
                                    + "</td><td>" + json.AWardDate
                                    + "</td><td>" + json.Go
                                    + "</td><td>" + json.Get
                                    + "</td><td>" + json.WorleyParsonsCV
                                    + "</td><td>" + json.WorleyParsonsEBIT
                                    + "</td><td>" + json.EstimatedWork
                                    + "</td><td>" + json.ContractDuration
                                    + "</td><td>" + json.ContractType
                                    + "</td><td>" + json.BidOffice
                                    + "</td><td>" + json.FacilityLocationCountry
                                    + "</td><td>" + json.WorkshareOffices
                                    + "</td><td>" + json.Scopes
                                    + "</td><td>" + json.OpportunityLeadSubsector
                                    + "</td><td>" + json.Custodian
                                    + "</td><td>" + json.OpportunityPriority
                                    + "</td><td>" + json.ContractCurrency
                                    + "</td></tr>");
                            });


                        } catch (e) {
                            alert(e);
                        }
                    },
                    error: function() {
                        //alert("e2");
                    }
                });
            });

            $(".menu-crmtloader").addClass("active");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <span>Project Initiation</span> > <a href="~/CRMTLoader/Default.aspx" class=" btn-default btn-create" runat="server">CRMT Loader</a><p></p>
    <div class="container">
<h4 class="text-center">CRMT Loader</h4>
    <p class="btn-group">
        <a href="ImportData.aspx" class="btn btn-default btn-create">Import data</a>
    </p>
        <table class="table table-bordered table-hover header">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>ID</th>
                    <th>CRMT Load File</th>
                    <th>Template</th>
                    <th>Loaded By</th>
                    <th>Created Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 20;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var cnt = db.TCRMTLoader.Count();
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });
                    var q = db.TCRMTLoader.OrderByDescending(x=>x.CRMDID).Skip(pageSize*(pageIndex - 1)).Take(pageSize);
                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td></tr>",
                            dr.CRMDID,
                            dr.FileName,
                            dr.Template,
                            dr.LoadedBy, 
                            StringHelper.FmtDate(dr.CreatedDate)
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, db.TCRMTLoader.Count(), 29)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
    </div>
    <div class="container" style="overflow-x: auto">
        <h5>Details</h5>
        <table class="table table-bordered table-hover" id="crmtTable" runat="server">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Row Status</th>
                    <th>Project<br/>ID</th>
                    <th>Business Unit</th>
                    <th>Business<br/>Line</th>
                    <th>Opportunity<br/>Lead Sector</th>
                    <th>Project Name</th>
                    <th>Customer</th>
                    <th>Prospect<br/>Status</th>
                    <th>Bid<br/>Due Date</th>
                    <th>Award Date</th>
                    <th>Go (%)</th>
                    <th>Get (%)</th>
                    <th>WorleyParsons<br/>CV (AUD)</th>
                    <th>WorleyParsons<br/>EBIT (AUD)</th>
                    <th>Estimated<br/>Work (Hrs)</th>
                    <th>Contract<br/>Duration (Wks)</th>
                    <th>Contract Type</th>
                    <th>Bid Office</th>
                    <th>Facility Location<br/> - Country</th>
                    <th>Workshare<br/>Offices (All)</th>
                    <th>Scopes (All)</th>
                    <th>Opportunity<br/>Lead Subsector</th>
                    <th>Custodian</th>
                    <th>Opportunity<br/>Priority</th>
                    <th>Contract<br/>Currency</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
