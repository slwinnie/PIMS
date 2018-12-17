<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%
    var projectId = Request["projectId"];
    var subId = Request["subId"];
    var type = Request["type"];
    var seq = Request["seq"];

    try
    {
        var iprojectId = Convert.ToInt32(projectId);
        var isubId = Convert.ToInt32(subId);
        var iseq = Convert.ToInt32(seq);

        var db = new PPPEntities();
        var item = db.NPISAttach.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId && x.Seq == iseq && x.type == type);
        if (item != null)
        {
            db.NPISAttach.Remove(item);
            db.SaveChanges();
            File.Delete(Server.MapPath(string.Format("~/Forms/NPISFiles/{0}", item.FileName)));
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
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Cann't find delete item.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
    catch (Exception ex)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>

