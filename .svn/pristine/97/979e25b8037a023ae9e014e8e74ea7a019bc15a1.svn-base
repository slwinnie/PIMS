<%@ Page Language="C#" %>
<%
    var accountId = Request["accountId"];
    var db = new PPPEntities();
    var acc = db.TAccount.Find(Convert.ToInt32(accountId));
    if (acc != null && acc.AccountId > 0)
    {
        db.TAccount.Remove(acc);

        var dtl = db.TAccountRole.Where(x => x.AccountId == acc.AccountId);
        db.TAccountRole.RemoveRange(dtl);
        
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
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid AccountId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>