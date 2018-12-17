<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];
    var wbs = Request["WBS"];
    var staffPlan = db.TStaffingPlan.FirstOrDefault(x => x.ProjectNo == projectNo && x.Type == type && x.WBS == wbs);
    if (staffPlan != null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "WBS", staffPlan.WBS);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "CTR", staffPlan.CTR);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "BudgetHours", staffPlan.BudgetHours);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "PlannedHours", staffPlan.PlannedHours);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ActualHours", staffPlan.ActualHours);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "OwnerId", staffPlan.OwnerId);
        var people = db.TPeople.FirstOrDefault(x => x.EmployeeId == staffPlan.OwnerId);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Owner", people != null ? people.PeopleNameEn : "");
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