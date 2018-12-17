<%@ Page Language="C#" %>
<%
    var id = Convert.ToInt32(Request["id"]);
    var db = new PPPEntities();
    var r = db.TStaffingBasicInfo.FirstOrDefault(x => x.No == id);
    if (r != null)
    {
        db.TStaffingBasicInfo.Remove(r);
        
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
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Id.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>