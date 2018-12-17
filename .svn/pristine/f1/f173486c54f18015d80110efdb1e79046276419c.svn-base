<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(SystemHelper.DomainUserName()))
            {
                if (!string.IsNullOrEmpty(Request["go"]))
                {
                    Response.Redirect(Request["go"]);
                }
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
    <div>
        <span>User:</span><%=SystemHelper.DomainUserName() %>
    </div>
    </form>
</body>
</html>
