<%@ Page Language="C#" %>
<%
    var iProjectId = Convert.ToInt32(Request["projectId"]);
    var iSubId = Convert.ToInt32(Request["subId"]);
    var employeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var icurrentEmployeeId = employeeId; // login user.
    var scurrentEmployeeId = employeeId.ToString(); // login user.
    var comments = Request["comments"].ToString();
    var db = new PPPEntities();
    var risk = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == iProjectId
    && x.SubId == iSubId
    ); // Risk Workshare Info.
    if (risk != null)
    {
        risk.RejectBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
        risk.RejectComment = comments;
        db.SaveChanges();
    }

    var pp = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
    if (pp != null)
    {
        pp.Status = "Rejected";
        db.SaveChanges();
    }
    var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.FormType == "RiskWS" && x.EmployeeId == iEmployeeId);
    if (appr != null)
    {
        appr.Status = "Rejected";
        db.SaveChanges();
    }
%>