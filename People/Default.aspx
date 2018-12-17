<%@ Page Language="C#" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%@ Register Src="~/ResourceMenu.ascx" TagPrefix="uc1" TagName="ResourceMenu" %>
<!DOCTYPE html>

<script runat="server">

    private void btnSearch_OnServerClick(object sender, EventArgs e)
    {
        Response.Redirect("~/People/Default.aspx?searchKey=" + searchKey.Value.Trim());
    }

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "People");
        SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            searchKey.Value = Request["searchKey"];
        }

    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/font-awesome.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/People/js/people.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script>
        $(function () {

            $(".menu-people").addClass("active");


            $(".sync-data").click(function () {
                $("#sync").removeClass('hidden');
                $(".sync-data").addClass('disabled');
                $.ajax({
                    url: 'SyncData.aspx',
                    type: "post",
                    datatype: "json",
                    success: function (d) {
                        var json = JSON.parse(d);
                        if (json.ErrorCode === "0") {
                            // Success
                            alert(json.ErrorMessage);
                        } else {
                            // Error
                            alert(json.ErrorMessage);
                        }
                        $(".sync-data").removeClass('disabled');
                        $("#sync").addClass('hidden');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        /*弹出jqXHR对象的信息*/
                        alert(jqXHR.responseText);
                        //alert(jqXHR.status);
                        //alert(jqXHR.readyState);
                        //alert(jqXHR.statusText);
                        ///*弹出其他两个参数的信息*/
                        //alert(textStatus);
                        //alert(errorThrown);
                        $(".sync-data").removeClass('disabled');
                    }
                });
                return false;
            });

            $(".btn-search").click(function() {
                //window.location.href = '/People/Default.aspx?searchKey=' + $("#searchKey").val();
                //window.navigate('/People/Default.aspx?searchKey=' + $("#searchKey").val());
            });
        });
    </script>
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
<uc1:ResourceMenu runat="server" ID="ResourceMenu" />
<strong>PIMS / System Management</strong> > People
    <div class="container">
<!-- 导航菜单::开始 -->
<!-- 导航菜单::结束 -->
<h4 class="text-center">People</h4>
        <div>
<div class="col-md-4 col-lg-4 text-left" style="padding-left: 0"><a href="#" class="btn btn-success sync-data"><i id="sync" class="icon-refresh icon-spin hidden"></i> Sync Data</a></div>
<div class="input-group col-md-4 col-lg-4">
        <input type="text" class="form-control" placeholder="Type key word" id="searchKey" runat="server"/>
        <span class="input-group-btn">
            <button class="btn btn-primary btn-search" id="btnSearch" runat="server" OnServerClick="btnSearch_OnServerClick">Search</button>
        </span>
 </div>
<div class="col-md-4 col-lg-4"></div>
        </div>
        <table class="table table-bordered table-hover header">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Employee<br/>ID</th>
                    <th>People Name<br/>Chs / Eng</th>
                    <th>Office</th>
                    <th>Discipline</th>
                    <th>Title</th>
                    <th>Email</th>
                    <th>Opration</th>
                    <th>Line Manager</th>
                    <th>Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 20;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var cnt = db.TPeople.Count(x=>x.EmployeeId.ToString().Contains(searchKey.Value)
                        || x.PeopleNameEn.ToString().Contains(searchKey.Value)
                        || x.PeopleNameChs.ToString().Contains(searchKey.Value)
                        || x.Title.ToString().Contains(searchKey.Value)
                        || x.Email.ToString().Contains(searchKey.Value)
                        || x.Dispiline.ToString().Contains(searchKey.Value)
                        || x.Office.ToString().Contains(searchKey.Value)
                        || x.StaffType.ToString().Contains(searchKey.Value)
                        );
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });

                    var q = db.TPeople.Where(
                        x => x.EmployeeId.ToString().Contains(searchKey.Value)
                        || x.PeopleNameEn.ToString().Contains(searchKey.Value)
                        || x.PeopleNameChs.ToString().Contains(searchKey.Value)
                        || x.Title.ToString().Contains(searchKey.Value)
                        || x.Email.ToString().Contains(searchKey.Value)
                        || x.Dispiline.ToString().Contains(searchKey.Value)
                        || x.Office.ToString().Contains(searchKey.Value)
                        || x.Operation.ToString().Contains(searchKey.Value)
                        || x.StaffType.ToString().Contains(searchKey.Value)
                        ).OrderByDescending(x => x.EmployeeId).Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        var item = db.TPeople.Find(dr.LineManagerId);
                        sb.AppendFormat("<tr><td>{0}</td><td>{1} {2}</td><td>{3}</td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8} {9} {10}</td><td>{11}</td></tr>",
                            dr.EmployeeId,
                            dr.PeopleNameChs,
                            dr.PeopleNameEn, 
                            dr.Office,
                            dr.Dispiline,
                            dr.Title,
                            dr.Email,
                            dr.Operation,
                            dr.LineManagerId,
                            item == null ? "" : item.PeopleNameChs,
                            item == null ? "" : item.PeopleNameEn,
                            dr.StaffType
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, cnt, 29)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
    </div>
    <div>

    </div>
    </form>
</body>
</html>
