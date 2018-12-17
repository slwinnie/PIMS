<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var roleId = Convert.ToInt32(Request["roleId"]);
    if (db.TRoleDetail.Any(x => x.RoleId == roleId))
    {
        var maxId = db.TRoleDetail.Where(x => x.RoleId == roleId).Max(x => x.No) + 1;
        Response.Write(maxId);
    }
    else
    {
        Response.Write("1");
    }
%>