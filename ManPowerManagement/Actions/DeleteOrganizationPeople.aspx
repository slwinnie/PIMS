<%@ Page Language="C#" %>
<%
    var organizationId = Request["organizationId"];
    var employeeId = Request["employeeId"];

    var iOrganizationId = Convert.ToInt32(organizationId);
    var iEmployeeId = Convert.ToInt32(employeeId);

    var db = new PPPEntities();
    var p = db.TOrganizationPeoples.FirstOrDefault(x => x.OrganizationId == iOrganizationId && x.PeopleId == iEmployeeId);
    if (p != null)
    {
        db.TOrganizationPeoples.Remove(p);
    }
    db.SaveChanges();
    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());

%>