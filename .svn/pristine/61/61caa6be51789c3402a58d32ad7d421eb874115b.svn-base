<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var id = Convert.ToInt32(Request["id"]);
    var r = db.TRole.Find(id);
    if (r != null)
    {
        r.Role = Request["role"];
        r.Description = Request["description"];
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());    

        return;
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid function.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }

%>