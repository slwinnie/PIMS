<%@ Page Language="C#" %>

<%
    var r = Request["role"];
    var description = Request["description"];
    var id = Convert.ToInt32(Request["id"]);

    var db = new PPPEntities();
    if (db.TRole.Any(x => x.RoleId == id))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid EmployeeId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    if (db.TRole.Any(x => x.Role == r))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Account.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    if (string.IsNullOrEmpty(r))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Function.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    else
    {
        var rl = new TRole();
        rl.RoleId = id;
        rl.Role = r;
        rl.Description = description;
        db.TRole.Add(rl);
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());    
    }
%>
