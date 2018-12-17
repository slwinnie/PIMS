<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var employeeId = Convert.ToInt32(Request["EmployeeId"]);
    var people = db.TPeople.FirstOrDefault(x => x.EmployeeId == employeeId);
    if (people != null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "EmployeeId", people.EmployeeId);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "PeopleName", people.PeopleNameEn);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Office", people.Office);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Dispiline", people.Dispiline);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Title", people.Title);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Email", people.Email);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Phone", people.Phone);
        var account = db.TAccount.FirstOrDefault(x => x.EmployeeId == employeeId);
        if (account != null)
        {
            sb.AppendFormat("\"{0}\":\"{1}\", ", "Company", account.Company);
        }
        else
        {
            sb.AppendFormat("\"{0}\":\"{1}\", ", "Company", "");
        }
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb);
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "ERROR.");
        sb.AppendFormat("}}");
        Response.Write(sb);
    }

%>