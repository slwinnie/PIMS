<%@ Page Language="C#" %>

<%
    var roleId = Convert.ToInt32(Request["roleId"]);
    var functionId = Convert.ToInt32(Request["functionId"]);
    var db = new PPPEntities();
    var r = db.TRoleDetail.FirstOrDefault(x => x.RoleId == roleId && x.FunctionId == functionId);
    if (r != null)
    {
        db.TRoleDetail.Remove(r);
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