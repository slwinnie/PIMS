<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var iProjectId = Convert.ToInt32(Request["ProjectId"]);
    var iSubId = Convert.ToInt32(Request["SubId"]);

    // Project
    var pp = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
    if (pp.Status == "New" || pp.Status == "Pendding")
    {
        if (!db.TApproval.Any(x=>x.ProjectId == iProjectId
            && x.SubId == iSubId
            && x.FormType == "RiskWS"
            && x.Status == "Approved"))
        {
            // Reverse
            var items = db.TApproval.Where(x => x.ProjectId == iProjectId
                && x.SubId == iSubId
                && x.FormType == "RiskWS");
            if (items.Any())
            {
                db.TApproval.RemoveRange(items);
            }
            var risk = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
            if (risk != null)
            {
                risk.RejectBy = string.Empty;
                risk.RejectComment = string.Empty;
            }
            pp.Status = "New";
            pp.RiskSubmitDate = null;
            db.SaveChanges();

            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
        else
        {
            // Invalid opration.
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid opration. Some of people approved.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
    else if (pp.Status == "Rejected")
    {
        // Reverse.
        var items = db.TApproval.Where(x => x.ProjectId == iProjectId
            && x.SubId == iSubId
            && x.FormType == "RiskWS");
        if (items.Any())
        {
            db.TApproval.RemoveRange(items);
        }
        var risk = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (risk != null)
        {
            risk.RejectBy = string.Empty;
            risk.RejectComment = string.Empty;
        }
        pp.Status = "New";
        pp.RiskSubmitDate = null;
        db.SaveChanges();
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }


%>