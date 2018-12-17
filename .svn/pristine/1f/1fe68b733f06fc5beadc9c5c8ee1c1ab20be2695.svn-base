<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);

    if (acc != null)
    {
        acc.Account = Request["account"];
        acc.Email = Request["email"];
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
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid EmployeeId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>