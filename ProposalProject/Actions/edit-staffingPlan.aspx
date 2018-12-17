<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];
    var wbs = Request["editWBS"];

    var staffingPlan = db.TStaffingPlan.FirstOrDefault(x => x.ProjectNo == projectNo && x.Type == type && x.WBS == wbs);
    if (staffingPlan != null)
    {
        staffingPlan.BudgetHours = Convert.ToDecimal(Request["editBudgetHours"]);
        staffingPlan.PlannedHours = Convert.ToDecimal(Request["editPlannedHours"]);
        staffingPlan.ActualHours = Convert.ToDecimal(Request["editActualHours"]);
        staffingPlan.OwnerId = Convert.ToInt32(Request["editOwnerId"]);
        staffingPlan.CTR = Request["editCTR"];
    }
    db.SaveChanges();

    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());

%>