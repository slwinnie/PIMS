<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var iProjectId = Convert.ToInt32(Request["ProjectId"]);
    var iSubId = Convert.ToInt32(Request["SubId"]);
    var type = Request["type"].ToString();
    if (type == "1")
    {
        // Proposal
        var pp = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (pp.Status == "New" || pp.Status == "Pendding")
        {
            if (!db.TApproval.Any(x=>x.ProjectId == iProjectId
                && x.SubId == iSubId
                && x.FormType == "Npis1"
                && x.Status == "Approved"))
            {
                // Reverse
                var items = db.TApproval.Where(x => x.ProjectId == iProjectId
                    && x.SubId == iSubId
                    && x.FormType == "Npis1");
                if (items.Any())
                {
                    db.TApproval.RemoveRange(items);
                }

                var npis = db.NPISForm.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.type == "1");
                if (npis != null)
                {
                    npis.RejectBy = string.Empty;
                    npis.RejectComment = string.Empty;
                }
                pp.Status = "New";
                pp.NPISSubmitDate = null;
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
                && x.FormType == "Npis1");
            if (items.Any())
            {
                db.TApproval.RemoveRange(items);
            }
            var npis = db.NPISForm.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.type == "2");
            if (npis != null)
            {
                npis.RejectBy = string.Empty;
                npis.RejectComment = string.Empty;
            }
            pp.Status = "New";
            pp.NPISSubmitDate = null;
            db.SaveChanges();
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
    else
    {
        // Project
        var pp = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (pp.Status == "New" || pp.Status == "Pendding")
        {
            if (!db.TApproval.Any(x=>x.ProjectId == iProjectId
                && x.SubId == iSubId
                && x.FormType == "Npis2"
                && x.Status == "Approved"))
            {
                // Reverse
                var items = db.TApproval.Where(x => x.ProjectId == iProjectId
                    && x.SubId == iSubId
                    && x.FormType == "Npis2");
                if (items.Any())
                {
                    db.TApproval.RemoveRange(items);
                }
                pp.Status = "New";
                pp.NPISSubmitDate = null;
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
                && x.FormType == "Npis2");
            if (items.Any())
            {
                db.TApproval.RemoveRange(items);
            }
            pp.Status = "New";
            pp.NPISSubmitDate = null;
            db.SaveChanges();
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
%>