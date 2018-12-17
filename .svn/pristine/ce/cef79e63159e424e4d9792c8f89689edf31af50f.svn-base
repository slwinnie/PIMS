<%@ Page Language="C#" %>

<%

    if (Request["projectId"] == null || Request["subId"] == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid ProjectId & SubId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    var db = new PPPEntities();
    var projectId = Convert.ToInt32(Request["projectId"]);
    var subId = Convert.ToInt32(Request["subId"]);
    var item = db.TProposalX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (item != null)
    {
        db.TProposalX.Remove(item);
    }
    var bidForm = db.BIDForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (bidForm != null)
    {
        db.BIDForm.Remove(bidForm);
    }
    var bnbAtts = db.BNBAttach.Where(x => x.ProjectId == projectId && x.SubId == subId);
    foreach(var atta in bnbAtts)
    {
        var fn = Server.MapPath(string.Format("~/Forms/BNBFiles/{0}", atta.FileName));
        if (!System.IO.File.Exists(fn))
        {
            try
            {
                System.IO.File.Delete(fn);
            }
            catch { }
        }
    }
    db.BNBAttach.RemoveRange(bnbAtts);

    var riskForm = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == "1");
    if (riskForm != null)
    {
        db.RiskClassificationForm.Remove(riskForm);
    }

    var riskWorkshare = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (riskWorkshare != null)
    {
        db.TRiskWorkshare.Remove(riskWorkshare);
    }

    var npisForm = db.NPISForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == "1");
    if (npisForm != null)
    {
        db.NPISForm.Remove(npisForm);
    }

    var npisAtts = db.NPISAttach.Where(x => x.ProjectId == projectId && x.SubId == subId && x.type == "1");
    foreach(var atta in npisAtts)
    {
        var fn = Server.MapPath(string.Format("~/Forms/NPISFiles/{0}", atta.FileName));
        if (!System.IO.File.Exists(fn))
        {
            try
            {
                System.IO.File.Delete(fn);
            }
            catch { }
        }
    }
    db.NPISAttach.RemoveRange(npisAtts);

    db.SaveChanges();
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
%>