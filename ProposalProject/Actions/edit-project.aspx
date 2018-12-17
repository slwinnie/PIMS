<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];

    var pi = db.TProjectBasicInfo.FirstOrDefault(x => x.ProjectNo == projectNo && x.Type == type);
    if (pi != null)
    {
        bool isUpdateYearMonth = false;
        pi.ProjectName = Request["projectName"];
        pi.ClientName = Request["Client"];
        pi.PM = Request["pm"];
        pi.Office = Request["office"];
        var newStartDate = string.IsNullOrEmpty(Request["start"]) ? (DateTime?) null : Convert.ToDateTime(Request["start"]);
        var newEndDate = string.IsNullOrEmpty(Request["end"]) ? (DateTime?) null : Convert.ToDateTime(Request["end"]);
        if (pi.StartDate != newStartDate || pi.EndDate != newEndDate)
        {
            isUpdateYearMonth = true;
        }
        pi.StartDate = newStartDate;
        pi.EndDate = newEndDate;
        pi.Description = Request["description"];
        db.SaveChanges();
        if (isUpdateYearMonth)
        {
            StaffingPlanHelper.UpdatePlanDetailYearMonth(projectNo);
        }
    }


    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());

%>