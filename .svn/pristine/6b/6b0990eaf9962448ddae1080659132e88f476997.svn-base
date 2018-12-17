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
    var item = db.TProjectX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (item != null)
    {
        db.TProjectX.Remove(item);
    }
    var riskForm = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == "2");
    if (riskForm != null)
    {
        db.RiskClassificationForm.Remove(riskForm);
    }
    var riskWorkshareForm = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == "2");
    if (riskWorkshareForm != null)
    {
        db.TRiskWorkshare.Remove(riskWorkshareForm);
    }
    var npisForm = db.NPISForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == "2");
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