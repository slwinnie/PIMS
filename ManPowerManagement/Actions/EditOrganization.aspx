<%@ Page Language="C#" %>
<%
    var editId = Convert.ToInt32(Request["Id"]);
    var editTitle = Request["editTitle"];
    var editLevelNo = Request["editLevelNo"];
    var editPos = Request["editPos"];
    var editParentId = Request["editParentId"];

    var db = new PPPEntities();
    if (string.IsNullOrEmpty(editPos))
    {
        editPos = "1";
    }
    if (string.IsNullOrEmpty(editTitle))
    {
        editTitle = "Title";
    }

    var organization = db.TOrganization.FirstOrDefault(x => x.OrganizationId == editId);
    if (organization == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Id.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }

    organization.Title = editTitle;
    organization.LevelNo = Convert.ToInt32(editLevelNo);
    organization.LevelPos = Convert.ToInt32(editPos);

    db.SaveChanges();
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }


%>