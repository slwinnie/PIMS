<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var employeeId = Convert.ToInt32(Request["EmployeeId"]);
    var staffInfo = db.TStaffingBasicInfo.FirstOrDefault(x => x.EmployeeId == employeeId);
    if (staffInfo != null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Position", staffInfo.Position);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "EmployeeId", staffInfo.EmployeeId);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "PeopleName", staffInfo.PeopleName);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Office", staffInfo.Office);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Dispiline", staffInfo.Discipline);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Title", staffInfo.Title);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Company", staffInfo.Company);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "SellingRate", staffInfo.SellingRate);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Unit", staffInfo.Unit);
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