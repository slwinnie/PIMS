<%@ Page Language="C#" %>
<%
    var projectId = Convert.ToInt32(Request["projectId"]);
    var subId = Convert.ToInt32(Request["subId"]);
    var db = new PPPEntities();
    var px = db.TProjectX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (px != null)
    {
        if (px.ProjectManagerId == null)
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-3");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Project Manager.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
        if (px.RiskApproveDate == null || px.NPISApproveDate == null)
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Not all of forms are approved.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
        else
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid ProjectId & SubId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
%>