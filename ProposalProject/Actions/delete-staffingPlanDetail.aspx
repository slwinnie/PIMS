<%@ Page Language="C#" %>
<%
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];
    var wbs = Request["WBS"];
    var employeeId = Convert.ToInt32(Request["EmployeeId"]);
    var db = new PPPEntities();

    var r = db.TStaffingPlanDetail.FirstOrDefault(x => x.ProjectNo == projectNo && x.Type == type && x.WBS == wbs && x.EmployeeId == employeeId);
    if (r != null)
    {
        db.TStaffingPlanDetail.Remove(r);

        var s = db.TStaffingPlanDetailYearMonth.Where(x => x.ProjectNo == projectNo && x.Type == type && x.WBS == wbs && x.EmployeeId == employeeId);
        db.TStaffingPlanDetailYearMonth.RemoveRange(s);
        
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
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Param.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>