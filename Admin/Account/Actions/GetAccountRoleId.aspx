<%@ Page Language="C#" %>

<%
    var accountId = Convert.ToInt32(Request["accountId"]);
    
    var db = new PPPEntities();
    if (db.TAccountRole.Any(x => x.AccountId == accountId))
    {
        var maxId = db.TAccountRole.Where(x => x.AccountId == accountId).Max(x => x.No) + 1;
        Response.Write(maxId);
    }
    else
    {
        Response.Write("1");
    }
%>