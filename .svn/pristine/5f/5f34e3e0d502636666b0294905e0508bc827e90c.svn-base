<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="People_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Workbench/js/workbench.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    
    <script>
        $(function() {
            $("#searchKey").keyup(function () {
                var ownerId= $(this).attr("id");
                $.ajax({
                    url: "Actions/searchPeople.aspx?top=10&searchKey=" + $(this).val(),
                    type: "post",
                    success: function(d) {
                        try {
                            $("#" + ownerId).next().html("");
                            var rst = JSON.parse(d);
                            if (rst.length === 0) return false;
                            var html = "<table class='table table-condensed table-hover' style='background-color:white;padding:0;margin:0;'>";
                            $.each(rst, function(i, item) {
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
                //console.log($("#searchKey").data("empid"));
                //console.log($("#searchKey").data("empname"));
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="col col-lg-4 col-md-4 col-xs-4 ">
    <label>PM</label>
    <input type="text" id="searchKey" class="form-control" autocomplete="off"/>
    <div  class="search-people-result"></div>
<div style="background-color: red; width: 500px; height: 500px;"></div>
    </div>
        </div>
    </form>
</body>
</html>
;