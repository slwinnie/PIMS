<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    if (db.TFunction.Any())
    {
        Response.Write((db.TFunction.Max(x=>x.Id) + 1).ToString());
    }
    else
    {
        Response.Write("1");
    }
%>