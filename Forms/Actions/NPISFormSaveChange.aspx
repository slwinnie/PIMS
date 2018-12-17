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
    var type = Request["type"].ToString();
    var item = db.NPISForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == type);
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
        item.type = type;
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

        item.t1 = Request["t1"];
        item.t2 = Request["t2"];
        item.t3 = Request["t3"];
        item.t4 = Request["t4"];
        item.t5 = Request["t5"];
        //item.t6 = Request["t6"];
        item.t7 = Request["t7"];
        item.t8 = Request["t8"];
        item.t9 = Request["t9"];
        item.t10 = Request["t10"];
        item.t11 = Request["t11"];
        item.t12 = Request["t12"];
        item.t13 = Request["t13"];
        item.t14 = HttpUtility.UrlDecode(Request["t14"]);
        item.t15 = Request["t15"];
        item.t16 = HttpUtility.UrlDecode(Request["t16"]);
        item.t17 = HttpUtility.UrlDecode(Request["t17"]);
        item.t18 = Request["t18"];
        item.t19 = Request["t19"];
        item.t20 = Request["t20"];
        item.t21 = Request["t21"];
        item.t22 = Request["t22"];
        item.t23 = Request["t23"];
        //item.t24 = Request["t24"];
        //item.t25 = Request["t25"];
        item.t26 = Request["t26"];
        item.t27 = Request["t27"];
        item.t28 = Request["t28"];
        item.t29 = Request["t29"];
        item.t30 = Request["t30"];
        item.t31 = Request["t31"];
        item.t32 = Request["t32"];
        item.t33 = Request["t33"];
        item.t34 = Request["t34"];
        item.t35 = Request["t35"];
        item.t36 = Request["t36"];
        item.t37 = Request["t37"];
        item.t38 = Request["t38"];
        item.t39 = PeopleHelper.GetPeopleId(Request["t39"]);
        item.t40 = PeopleHelper.GetPeopleId(Request["t40"]);
        item.t41 = Request["t41"];
        item.t42 = Request["t42"];
        item.t43 = Request["t43"];
        item.t44 = Request["t44"];
        item.t45 = Request["t45"];
        //item.t46 = Request["t46"];
        //item.t47 = Request["t47"];
        item.t48 = Request["t48"];
        item.t49 = Request["t49"];
        item.t50 = Request["t50"];
        item.t51 = Request["t51"];
        item.t52 = Request["t52"];
        item.t53 = Request["t53"];
        item.t54 = Request["t54"];
        item.t55 = Request["t55"];

        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>