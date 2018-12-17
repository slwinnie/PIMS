<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var projectId = Convert.ToInt32(Request["projectId"]);
    var employeeId = Convert.ToInt32(Request["employeeId"]);
    var item = db.TProjectOwner.FirstOrDefault(x => x.ProjectId == projectId && x.EmployeeId == employeeId);
    if (item == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Delete failed.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    else
    {
        db.TProjectOwner.Remove(item);
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
     %>