<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var projectId = Convert.ToInt32(Request["projectId"]);
    var employeeId = Convert.ToInt32(Request["employeeId"]);
    if (db.TProjectOwner.Any(x => x.ProjectId == projectId && x.EmployeeId == employeeId))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid CRMT ID.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    else
    {
        if (!db.TAccount.Any(x => x.EmployeeId == employeeId))
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Owner.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
        else
        {

            var item = new TProjectOwner();
            item.EmployeeId = employeeId;
            item.ProjectId = projectId;
            db.TProjectOwner.Add(item);
            db.SaveChanges();

            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }

    }
     %>