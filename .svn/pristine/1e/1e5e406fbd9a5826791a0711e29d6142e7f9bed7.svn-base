<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var nameEn = Request["nameEn"];
    var item = db.TPeople.FirstOrDefault(x => x.PeopleNameEn.Contains(nameEn));
    if (item == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Name");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "Id", "xx");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "Id", item.EmployeeId);
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>