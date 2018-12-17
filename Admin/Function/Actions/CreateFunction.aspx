<%@ Page Language="C#" %>
<%
    var function = Request["functionName"];
    var description = Request["description"];
    var id = Convert.ToInt32(Request["id"]);

    var db = new PPPEntities();
    if (db.TFunction.Any(x => x.Id == id))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid EmployeeId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    if (db.TFunction.Any(x => x.FunctionName == function))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Account.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    if (string.IsNullOrEmpty(function))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Function.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    else
    {
        var func = new TFunction();
        func.Id = id;
        func.FunctionName = function;
        func.Description = description;
        db.TFunction.Add(func);
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());    
    }
%>
