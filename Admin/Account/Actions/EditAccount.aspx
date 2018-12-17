<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var accountId = Convert.ToInt32(Request["editAccountId"]);
    var acc = db.TAccount.Find(accountId);
    if (acc != null)
    {
        acc.Account = Request["editAccount"];
        acc.Company = Request["editCompany"];
        acc.Email = Request["editEmail"];
        acc.Status = Request["editStatus"];
        //acc.Role = Request["editRole"];
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
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid EmployeeId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }

%>