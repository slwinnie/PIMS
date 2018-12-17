<%@ Page Language="C#" %>
<%
    var iProjectId = Convert.ToInt32(Request["projectId"]);
    var iSubId = Convert.ToInt32(Request["subId"]);
    var employeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var icurrentEmployeeId = employeeId; // login user.
    var scurrentEmployeeId = employeeId.ToString(); // login user.
    var comments = Request["comments"].ToString();
    var db = new PPPEntities();
    var bnb = db.BIDForm.FirstOrDefault(x => x.ProjectId == iProjectId
    && x.SubId == iSubId); // BNB Info.
    if (bnb != null)
    {
        bnb.RejectBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
        bnb.RejectComment = comments;
        db.SaveChanges();
    }
    var pp = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
    if (pp != null)
    {
        pp.Status = "Rejected";
        db.SaveChanges();
    }
    var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.FormType == "Bid" && x.EmployeeId == iEmployeeId);
    if (appr != null)
    {
        appr.Status = "Rejected";
        db.SaveChanges();
    }
%>