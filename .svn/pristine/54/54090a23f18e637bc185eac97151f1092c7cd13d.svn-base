<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/Content/bootstrap.css"/>
    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="table table-bordered table-responsive">
    <%
        var proxy = new cnbeiwpweb02v.TS_StaffInfoForProjectSoapClient();
        try
        {
            var dataList = proxy.get_staffInfo_All();
            foreach (var data in dataList)
            {
                %><tr>
                    <td><%=data.staffCode %></td>
                    <td><%=data.staffCNName %></td>
                    <td><%=data.staffENName %></td>
                    <td><%=data.office %></td>
                    <td><%=data.title %></td>
                    <td><%=data.discipline %></td>
                    <td><%=data.Email %></td>
                    <td><%=data.lineManager %></td>
                    <td><%=data.Operation %></td>
            </tr>
            <%
            }
            
        }
        catch (Exception ex)
        {

            throw;
        }
         %>
        </table>
    </div>
    </form>
</body>
</html>
