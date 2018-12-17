<%@ Page Language="C#" %>

<%
    var roleId = Convert.ToInt32(Request["roleId"]);
    var no = Convert.ToInt32(Request["no"]);
    var functionId = Convert.ToInt32(Request["functionId"]);
    var access = Request["access"];

    var db = new PPPEntities();
    if (db.TRoleDetail.Any(x => x.RoleId == roleId && x.FunctionId == functionId))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Function & Access.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    {
        var r = new TRoleDetail();
        r.No = no;
        r.RoleId = roleId;
        r.FunctionId = functionId;
        r.Access = access;
        db.TRoleDetail.Add(r);
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());    
    }
%>
