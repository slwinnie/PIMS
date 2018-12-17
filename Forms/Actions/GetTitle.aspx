<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var iEmpId = Convert.ToInt32(Request["EmployeeId"]);
    var ppl = db.TPeople.FirstOrDefault(x => x.EmployeeId == iEmpId);
    if (ppl != null)
    {
        Response.Write(ppl.Title);
    }
%>