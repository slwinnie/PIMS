<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    if (db.TRole.Any())
    {
        Response.Write((db.TRole.Max(x => x.RoleId) + 1).ToString());
    }
    else
    {
        Response.Write("1");
    }
%>