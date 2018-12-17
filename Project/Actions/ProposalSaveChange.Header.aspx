<%@ Page Language="C#" %>

<%
    if (Request["txtprojectId"] == null || Request["subId"] == null)
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
    var projectId = Convert.ToInt32(Request["txtprojectId"]);
    var subId = Convert.ToInt32(Request["subId"]);
    var item = db.TProposalX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (item == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid ProjectId & SubId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    else
    {
        item.ProposalNo = Request["editProposalNo"];
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>