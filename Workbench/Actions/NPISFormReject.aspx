<%@ Page Language="C#" %>
<%
    var iProjectId = Convert.ToInt32(Request["projectId"]);
    var iSubId = Convert.ToInt32(Request["subId"]);
    var employeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var icurrentEmployeeId = employeeId; // login user.
    var scurrentEmployeeId = employeeId.ToString(); // login user.
    var type = Request["type"].ToString().Trim();
    var comments = Request["comments"].ToString();
    var db = new PPPEntities();
    var npis = db.NPISForm.FirstOrDefault(x => x.ProjectId == iProjectId
    && x.SubId == iSubId
    && x.type == type); // NPIS Info.
    if (npis != null)
    {
        npis.RejectBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
        npis.RejectComment = comments;
        db.SaveChanges();
    }
    if (type == "1")
    {
        var pp = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (pp != null)
        {
            pp.Status = "Rejected";
            db.SaveChanges();
        }
    }
    else if (type == "2")
    {
        var pp = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (pp != null)
        {
            pp.Status = "Rejected";
            db.SaveChanges();
        }
    }
    var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.FormType == ("Npis" + type) && x.EmployeeId == iEmployeeId);
    if (appr != null)
    {
        appr.Status = "Rejected";
        db.SaveChanges();
    }
%>