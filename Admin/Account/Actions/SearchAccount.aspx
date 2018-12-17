<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var sb = new StringBuilder();
    var searchKey = Request["searchKey"].ToLower();
    var top = Request["top"];
    var items = db.TAccount.Where(x => x.UserName.ToLower().Contains(searchKey)
        || x.EmployeeId.ToString().Contains(searchKey)
        );
    var iTop = 10;
    
    if (top != null)
    {
        iTop = Convert.ToInt32(top);
    }
    if (searchKey.Trim() == "")
    {
        sb.AppendFormat("[");
        sb.AppendFormat("]");
        Response.Write(sb.ToString());
        return;
    }

    sb.AppendFormat("[");
    var index = 0;
    foreach (var item in items)
    {
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "EmployeeId", item.EmployeeId);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "UserName", item.UserName);
        sb.AppendFormat("\"{0}\":\"{1}\" ", "Email", item.Email);
        sb.AppendFormat("}},");
        index++;
        if (index == iTop || index == items.Count())
        {
            sb.Length--;
            break;
        }
    }
    sb.AppendFormat("]");

    Response.Write(sb.ToString());


%>