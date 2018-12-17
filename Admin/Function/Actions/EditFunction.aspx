<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var id = Convert.ToInt32(Request["id"]);
    var acc = db.TFunction.Find(id);
    if (acc != null)
    {
        acc.FunctionName = Request["functionName"];
        acc.Description = Request["description"];
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