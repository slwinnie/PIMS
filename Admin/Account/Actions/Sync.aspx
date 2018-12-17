<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    try
    {
        var maxId = -1;
        foreach (var p in db.TPeople)
        {
            var employeeId = p.EmployeeId;
            if (!db.TAccount.Any(x => x.EmployeeId == employeeId))
            {
                var item = new TAccount();
                item.EmployeeId = employeeId;
                item.Account = employeeId.ToString();
                item.Email = p.Email;
                item.CreateDate = DateTime.Now;
                item.Status = "Active";

                if (db.TAccount.Any())
                {
                    if (maxId == -1)
                    {
                        maxId = db.TAccount.Max(x => x.AccountId);
                    }

                    item.AccountId = maxId + 1;
                    maxId++;
                }
                else
                {
                    item.AccountId = 1;
                }

                if (!string.IsNullOrEmpty(p.Email))
                {
                    var arr = p.Email.Split('@');
                    if (arr.Length > 0)
                    {
                        item.UserName = arr[0].Trim();
                    }
                }
                db.TAccount.Add(item);
            }
            else
            {
                var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == employeeId) ;
                if (acc != null && string.IsNullOrEmpty(acc.UserName) && !string.IsNullOrEmpty(p.Email))
                {
                    var arr = p.Email.Split('@');
                    if (arr.Length > 0)
                    {
                        acc.UserName = arr[0].Trim();
                    }
                }
            }
        }
        db.SaveChanges();
    }
    catch (Exception ex)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());   
    }
 %>