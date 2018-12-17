<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var sb = new StringBuilder();
    sb.AppendFormat("[");
    foreach (var item in db.TPeople) // .Where(x=>x.StaffType !="Closed")
    {
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "EmployeeId", item.EmployeeId);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "PeopleNameEn", item.PeopleNameEn);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "PeopleNameChs", item.PeopleNameChs);
        sb.AppendFormat("\"{0}\":\"{1}\" ", "Email", item.Email);
        sb.AppendFormat("}},");
    }
    sb.AppendFormat("]");

    Response.Write(sb.ToString());


%>