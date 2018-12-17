<%@ Page Language="C#" %>
<%
    var newTitle = Request["newTitle"];
    var newLevelNo = Request["newLevelNo"];
    var newPos = Request["newPos"];
    var newParentId = Request["newParentId"];

    var db = new PPPEntities();
    if (string.IsNullOrEmpty(newPos))
    {
        newPos = "1";
    }
    if (string.IsNullOrEmpty(newTitle))
    {
        newTitle = "Title";
    }
    var organization = new TOrganization();
    if (!string.IsNullOrEmpty(newParentId))
    {
        organization.ParentId = Convert.ToInt32(newParentId);
    }
    organization.OrganizationId = db.TOrganization.Any() ? db.TOrganization.Max(x=>x.OrganizationId) + 1 : 1;
    organization.Title = newTitle;
    organization.LevelNo = Convert.ToInt32(newLevelNo);
    organization.LevelPos = Convert.ToInt32(newPos);

    db.TOrganization.Add(organization);
    //#region 修改TPeople表，添加OrganizationId
    //var p = db.TPeople.FirstOrDefault(x => x.EmployeeId == iNewOwnerId);
    //if (p != null)
    //{
    //    p.OrganizationId = organization.ParentId;
    //}
    //#endregion
    db.SaveChanges();

    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());
    return;

%>