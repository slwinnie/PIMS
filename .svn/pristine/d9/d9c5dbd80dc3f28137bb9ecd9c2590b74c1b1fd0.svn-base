<%@ Page Language="C#" %>
<%
    var id = Convert.ToInt32(Request["id"]);
    var db = new PPPEntities();
    MPMHelper.DeleteThisAndChild(id, db);

    db.SaveChanges();
    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());

%>