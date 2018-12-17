<%@ Page Language="C#" %>
<%
    var id = Request["id"];
    var db = new PPPEntities();
    var acc = db.TFunction.Find(Convert.ToInt32(id));
    if (acc != null && acc.Id > 0)
    {
        db.TFunction.Remove(acc);
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