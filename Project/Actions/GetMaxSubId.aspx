<%@ Page Language="C#" %>

<%
    var projectId = Convert.ToInt32(Request["projectId"]);
    var type = Request["type"];
    var db = new PPPEntities();
    if (type == "1")
    {
        if (!db.TProposalX.Any(x => x.ProjectId == projectId))
        {
            Response.Write("0");
        }
        else
        {
            var maxSubId = db.TProposalX.Where(x => x.ProjectId == projectId).Max(x => x.SubId);
            Response.Write(maxSubId);
        }
    }
    else
    {
        if (!db.TProjectX.Any(x => x.ProjectId == projectId))
        {
            Response.Write("0");
        }
        else
        {
            var maxSubId = db.TProjectX.Where(x => x.ProjectId == projectId).Max(x => x.SubId);
            Response.Write(maxSubId);
        }
    }

%>