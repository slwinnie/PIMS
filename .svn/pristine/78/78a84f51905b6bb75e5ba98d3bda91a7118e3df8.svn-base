<%@ Page Language="C#" %>
<%
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];
    var wbs = Request["WBS"];
    var db = new PPPEntities();

    var r = db.TStaffingPlan.FirstOrDefault(x => x.ProjectNo == projectNo && x.Type == type && x.WBS == wbs);
    if (r != null)
    {
        db.TStaffingPlan.Remove(r);
        
        db.SaveChanges();
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Param.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>