<%@ Page Language="C#" %>
<%

    if (Request["projectId"] == null || Request["subId"] == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid ProjectId & SubId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    var db = new PPPEntities();
    var projectId = Convert.ToInt32(Request["projectId"]);
    var subId = Convert.ToInt32(Request["subId"]);
    var item = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == "2");
    if (item == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid ProjectId & SubId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    else
    {
        item.c1 = Request["c1"];
        item.c2 = Request["c2"];
        item.c3 = Request["c3"];
        item.c4 = Request["c4"];
        item.c5 = Request["c5"];
        item.c6 = Request["c6"];
        item.c7 = Request["c7"];
        item.c8 = Request["c8"];
        item.c9 = Request["c9"];
        item.c10 = Request["c10"];
        item.c11 = Request["c11"];
        item.c12 = Request["c12"];
        item.c13 = Request["c13"];
        item.c14 = Request["c14"];
        item.c15 = Request["c15"];
        item.c16 = Request["c16"];
        item.c17 = Request["c17"];
        item.c18 = Request["c18"];
        item.c19 = Request["c19"];
        item.c20 = Request["c20"];

        item.t1 = Request["t1"];
        item.t2 = Request["t2"];
        item.t3 = Request["t3"];
        item.t4 = Request["t4"];
        item.t5 = Request["t5"];
        item.t6 = Request["t6"];
        item.t7 = Request["t7"];
        item.t8 = Request["t8"];
        item.t9 = Request["t9"];
        item.t10 = Request["t10"];
        item.t11 = Request["t11"];
        item.t12 = Request["t12"];
        item.t13 = Request["t13"];

        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    
    
%>