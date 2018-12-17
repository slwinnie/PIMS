<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var account = Request["account"].ToString();
    var acc = db.TAccount.FirstOrDefault(x => x.Account == account);

    if (acc != null)
    {
        acc.Psd = StringHelper.GetMd5(Request["newPassword"]);
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
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Account.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
     %>