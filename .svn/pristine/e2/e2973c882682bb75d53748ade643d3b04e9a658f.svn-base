<%@ Page Language="C#" %>
<%
    var newOrganizationId = Request["newOrganizationId"];
    var newEmployeeId = Request["newEmployeeId"];

    var iNewOrganizationId = Convert.ToInt32(newOrganizationId);
    var iNewEmployeeId = Convert.ToInt32(newEmployeeId);

    var db = new PPPEntities();
    db.TOrganizationPeoples.Add(new TOrganizationPeoples
    {
        OrganizationId = iNewOrganizationId,
        PeopleId = iNewEmployeeId
    });

    db.SaveChanges();
%>