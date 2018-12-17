<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            crmtId.Value = Request["projectId"];
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
    <script src="<%=ResolveUrl("~/Project/js/project.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <script>
        $(function() {
            $(".delete").click(function() {
                var empId = $(this).parent().parent().parent().find("td:eq(0) span").data("id");
                $.ajax({
                    url: "Actions/DeleteCRMTOwner.aspx?projectId=" + $("#crmtId").val() + "&employeeId=" + empId,
                    type: "post",
                    datatype: "json",
                    success: function(d) {
                        var rst = JSON.parse(d);
                        alert(rst.ErrorMessage);
                        location.reload();
                    },
                    error:function() {
                        alert("Error.");
                    }
                });
                return false;
            });

            $(".add").click(function () {
                var empId = $(this).parent().parent().parent().find("td:eq(0) span").data("id");

                $.ajax({
                    url: "Actions/Add2MyProject.aspx?projectId=" + $("#crmtId").val() + "&employeeId=" + $("#newOwner").data("empid"),
                    type: "post",
                    datatype: "json",
                    success: function (d) {
                        var rst = JSON.parse(d);
                        alert(rst.ErrorMessage);
                        location.reload();
                    },
                    error: function () {
                        alert("Error.");
                    }
                });
                return false;
            });

            $("#newOwner").keyup(function () {
                var ownerId = $(this).attr("id");
                $.ajax({
                    url: "../People/Actions/searchPeople.aspx?top=10&searchKey=" + $(this).val(),
                    type: "post",
                    success: function (d) {
                        try {
                            $("#" + ownerId).next().html("");
                            var rst = JSON.parse(d);
                            if (rst.length === 0) return false;
                            var html = "<table class='table table-bordered1 table-condensed table-hover' style='background-color:white;padding:0;margin:0;border:1px solid gray;'>";
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
            $("body").on("click", ".search-result-item", function () {
                var ownerId = "#" + $(this).data("owner");
                $(ownerId).data("empid", $(this).parent().parent().find("td:eq(0) a").html());
                $(ownerId).data("empname", $(this).parent().parent().find("td:eq(1) a").html());
                $(ownerId).val($(this).parent().parent().find("td:eq(1) a").html());
                $(this).parent().parent().parent().html("");
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
    <div>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <a href="Default.aspx"> Project Initiation</a> > <span>CRMT Owner(s)</span>
    </div>
    <div class="container">
        <h4 class="text-center">CRMT Owner(s)</h4>
        <div class="clearfix"></div>
        <div class="col col-lg-4 col-md-4"></div>
        <div class="col col-lg-4 col-md-4">
            <label>CRMT ID</label>
            <input type="text" runat="server" class="form-control" id="crmtId" readonly="readonly"/>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr class="HeaderLinearBackground">
                        <th>Owner</th>
                        <th>Action(s)</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    var db = new PPPEntities();
                    var projectId = Convert.ToInt32(crmtId.Value);
                    var myCrmt = db.TProjectOwner.Where(x => x.ProjectId == projectId);
                    foreach (var dr in myCrmt)
                    {
                        var p = db.TPeople.First(x => x.EmployeeId == dr.EmployeeId);
                        var empName = p != null ? p.PeopleNameEn : dr.EmployeeId.ToString();
                        %>
                    <tr><td><span data-id="<%=dr.EmployeeId %>"><%=empName %></span></td><td><%=string.Format("<div class='btn-group'><a href='javascript:void(0);' class='btn btn-danger btn-xs delete'>Delete</a></div>")
 %></td></tr>
                    <%
                    }
                     %>
                </tbody>
            </table>
            <label>New Owner</label>
            <input type="text" runat="server" class="form-control" id="newOwner" />
            <div  class="search-people-result"></div>
            <div class="text-center">
                <a href="javascript:void(0);" class="btn btn-primary add clear-border-radius">Add Owner</a>
            </div>
        </div>
        <div class="col col-lg-4 col-md-4"></div>
    </div>
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-Delete">
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
    </form>
</body>
</html>
