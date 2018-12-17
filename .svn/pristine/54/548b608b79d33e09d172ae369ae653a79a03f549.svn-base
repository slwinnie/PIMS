<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);

    if (acc != null)
    {
        if (!string.IsNullOrEmpty(acc.Psd) && acc.Psd != StringHelper.GetMd5(Request["oldPassword"]))
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Old Password.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
        else
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
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid EmployeeId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>