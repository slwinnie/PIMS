<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var staffPlan = new TStaffingPlan();
    var wbs = Request["NewWBS"];
    var ctr = Request["NewCTR"];
    var budgetHours = Request["newBudgetHours"];
    var plannedHours = Request["newPlannedHours"];
    var actualHours = Request["newActualHours"];
    var ownerId = Convert.ToInt32(Request["newOwnerId"]);
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];
    staffPlan.ProjectNo = projectNo;
    staffPlan.Type = type;
    staffPlan.WBS = wbs;
    staffPlan.CTR = ctr;
    staffPlan.BudgetHours = Convert.ToDecimal(budgetHours);
    staffPlan.PlannedHours = Convert.ToDecimal(plannedHours);
    staffPlan.ActualHours = Convert.ToDecimal(actualHours);
    staffPlan.OwnerId = ownerId;
    
    db.TStaffingPlan.Add(staffPlan);
    
    try
    {
        db.SaveChanges();
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    catch (Exception ex)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>