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
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Project Manager.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (string.IsNullOrEmpty(px.PType))
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Type.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        // Pass
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-99");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "System error.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
%>
