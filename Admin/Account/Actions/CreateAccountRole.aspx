<%@ Page Language="C#" %>
<%
    var roleId = Convert.ToInt32(Request["roleId"]);
    var no = Convert.ToInt32(Request["no"]);
    var accountId = Convert.ToInt32(Request["accountId"]);

    var db = new PPPEntities();
    if (db.TAccountRole.Any(x => x.AccountId == accountId && x.RoleId == roleId))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Role.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    {
        var r = new TAccountRole();
        r.No = no;
        r.RoleId = roleId;
        r.AccountId = accountId;
        db.TAccountRole.Add(r);
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());    
    }
%>