<%@ Page Language="C#" %>
<%
    var roleId = Convert.ToInt32(Request["roleId"]);
    var no = Convert.ToInt32(Request["no"]);
    var functionId = Convert.ToInt32(Request["functionId"]);
    var access = Request["access"];

    var db = new PPPEntities();
    if (db.TRoleDetail.Any(x => x.RoleId == roleId && x.FunctionId == functionId))
    {
        var r = db.TRoleDetail.FirstOrDefault(x => x.RoleId == roleId && x.FunctionId == functionId);
        if (r != null)
        {
            r.Access = access;
            r.FunctionId = functionId;
            r.No = no;
            db.SaveChanges();

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
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "System error.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid function.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }

%>