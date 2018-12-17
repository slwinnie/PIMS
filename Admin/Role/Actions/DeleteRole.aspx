<%@ Page Language="C#" %>

<%
    var id = Request["id"];
    var db = new PPPEntities();
    var r = db.TRole.Find(Convert.ToInt32(id));
    if (r != null && r.RoleId > 0)
    {
        db.TRole.Remove(r);
        var ranges = db.TAccountRole.Where(x => x.RoleId == r.RoleId);
        db.TAccountRole.RemoveRange(ranges);
        
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
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Id.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>