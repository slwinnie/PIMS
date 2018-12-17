<%@ Page Language="C#" %>
<%
    var accountId = Convert.ToInt32(Request["accountId"]);
    var roleId = Convert.ToInt32(Request["roleId"]);
    var db = new PPPEntities();
    var acc = db.TAccountRole.FirstOrDefault(x => x.AccountId == accountId && x.RoleId == roleId);
    if (acc != null)
    {
        db.TAccountRole.Remove(acc);
        db.SaveChanges();
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Role.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>