﻿<%@ Page Language="C#" %>
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
    var item = db.BIDForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
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
        item.c21 = Request["c21"];
        item.c22 = Request["c22"];
        item.c23 = Request["c23"];
        item.c24 = Request["c24"];
        item.c25 = Request["c25"];
        item.c26 = Request["c26"];
        item.c27 = Request["c27"];
        item.c28 = Request["c28"];
        item.c29 = Request["c29"];
        item.c30 = Request["c30"];
        item.c31 = Request["c31"];
        item.c32 = Request["c32"];
        item.c33 = Request["c33"];
        item.c34 = Request["c34"];
        item.c35 = Request["c35"];
        item.c36 = Request["c36"];
        item.c37 = Request["c37"];
        item.c38 = Request["c38"];
        item.c39 = Request["c39"];
        item.c40 = Request["c40"];
        item.c41 = Request["c41"];
        item.c42 = Request["c42"];
        item.c43 = Request["c43"];
        item.c44 = Request["c44"];
        item.c45 = Request["c45"];
        item.c46 = Request["c46"];
        item.c47 = Request["c47"];
        item.c48 = Request["c48"];
        item.c49 = Request["c49"];
        item.c50 = Request["c50"];
        item.c51 = Request["c51"];
        item.c52 = Request["c52"];
        item.c53 = Request["c53"];
        item.c54 = Request["c54"];
        item.c55 = Request["c55"];
        item.c56 = Request["c56"];
        item.c57 = Request["c57"];
        item.c58 = Request["c58"];
        item.c59 = Request["c59"];
        item.c60 = Request["c60"];
        item.c61 = Request["c61"];
        item.c62 = Request["c62"];
        item.c63 = Request["c63"];
        item.c64 = Request["c64"];
        item.c65 = Request["c65"];
        item.c66 = Request["c66"];
        item.c67 = Request["c67"];
        item.c68 = Request["c68"];
        item.c69 = Request["c69"];
        item.c70 = Request["c70"];
        item.c71 = Request["c71"];
        item.c72 = Request["c72"];
        item.c73 = Request["c73"];
        item.c74 = Request["c74"];
        item.c75 = Request["c75"];
        item.c76 = Request["c76"];
        item.c77 = Request["c77"];
        item.c78 = Request["c78"];
        item.c79 = Request["c79"];
        item.c80 = Request["c80"];
        item.c81 = Request["c81"];
        item.c82 = Request["c82"];
        item.c83 = Request["c83"];
        item.c84 = Request["c84"];
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
        item.t14 = Request["t14"];
        item.t15 = Request["t15"];
        item.t16 = Request["t16"];
        item.t17 = Request["t17"];
        item.t18 = Request["t18"];
        item.t19 = Request["t19"];
        item.t20 = Request["t20"];
        item.t21 = Request["t21"];
        item.t22 = Request["t22"];
        item.t23 = Request["t23"];
        item.t24 = Request["t24"];
        item.t25 = Request["t25"];
        item.t26 = Request["t26"];
        item.t27 = Request["t27"];
        item.t28 = Request["t28"];
        item.t29 = (Request["t29"]);
        item.t30 = (Request["t30"]);
        item.t31 = (Request["t31"]);
        item.t32 = Request["t32"];
        item.t33 = (Request["t33"]);
        item.t34 = Request["t34"];
        item.t35 = (Request["t35"]);
        item.t36 = Request["t36"];
        item.t37 = (Request["t37"]);
        item.t38 = (Request["t38"]);
        item.t39 = (Request["t39"]);
        item.t40 = (Request["t40"]);
        item.t41 = (Request["t41"]);
        item.t42 = Request["t42"];
        item.t43 = (Request["t43"]);
        item.t44 = Request["t44"];
        item.t45 = (Request["t45"]);
        item.t46 = Request["t46"];
        item.t47 = (Request["t47"]);
        item.t48 = Request["t48"];
        item.t49 = (Request["t49"]);
        item.t50 = Request["t50"];
        item.t51 = (Request["t51"]);
        item.t52 = Request["t52"];
        item.t53 = Request["t53"];
        item.t53 = Request["t53"];
        item.t54 = Request["t54"];
        item.t55 = Request["t55"];
        item.t56 = Request["t56"];
        item.t57 = Request["t57"];
        item.t58 = Request["t58"];
        item.t59 = (Request["t59"]);
        item.t60 = Request["t60"];
        item.t61 = (Request["t61"]);
        item.t62 = Request["t62"];
        item.t63 = (Request["t63"]);
        item.t64 = Request["t64"];
        item.t65 = (Request["t65"]);
        item.t66 = Request["t66"];
        item.t67 = PeopleHelper.GetPeopleId(Request["t67"]);
        item.t68 = Request["t68"];
        item.t69 = PeopleHelper.GetPeopleId(Request["t69"]);
        item.t70 = Request["t70"];
        item.t71 = Request["t71"];
        item.t72 = Request["t72"];
        item.t73 = Request["t73"];
        item.t74 = Request["t74"];
        item.t75 = Request["t75"];
        item.t76 = Request["t76"];
        item.t77 = Request["t77"];

        item.t78 = Request["t78"];
        item.t79 = Request["t79"];
        item.t80 = Request["t80"];
        item.t81 = Request["t81"];
        item.t82 = Request["t82"];
        item.t83 = Request["t83"];
        item.t84 = Request["t84"];
        item.t85 = Request["t85"];
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    
%>