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
    var item = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == type);
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
        item.t1 = Request["t1"];
        item.t2 = Request["t2"];
        item.t3 = Request["t3"];
        item.t4 = Request["t4"];
        item.t5 = PeopleHelper.GetPeopleId(Request["t5"]);
        item.t6 = Request["t6"];
        item.t7 = Request["t7"];
        item.t8 = Request["t8"];
        item.t9 = PeopleHelper.GetPeopleId(Request["t9"]);
        item.t10 = Request["t10"];
        item.t11 = Request["t11"];
        item.t12 = Request["t12"];
        item.t13 = PeopleHelper.GetPeopleId(Request["t13"]);
        item.t14 = Request["t14"];
        item.t15 = Request["t15"];
        item.t16 = Request["t16"];
        item.t17 = PeopleHelper.GetPeopleId(Request["t17"]);
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
        item.t39 = Request["t39"];
        item.t40 = Request["t40"];
        item.t41 = Request["t41"];
        item.t42 = Request["t42"];
        item.t43 = Request["t43"];
        item.t44 = Request["t44"];
        item.t45 = Request["t45"];
        item.t46 = Request["t46"];
        item.t47 = Request["t47"];
        item.t48 = Request["t48"];
        item.t49 = Request["t49"];
        item.t50 = Request["t50"];
        item.t51 = Request["t51"];
        item.t52 = Request["t52"];
        item.t53 = Request["t53"];
        item.t53 = Request["t53"];
        item.t54 = Request["t54"];
        item.t55 = Request["t55"];
        item.t56 = Request["t56"];
        item.t57 = Request["t57"];
        item.t58 = Request["t58"];
        item.t59 = Request["t59"];
        item.t60 = Request["t60"];
        item.t61 = Request["t61"];
        item.t62 = Request["t62"];
        item.t63 = Request["t63"];
        item.t64 = Request["t64"];
        item.t65 = Request["t65"];
        item.t66 = Request["t66"];
        item.t67 = Request["t67"];
        item.t68 = Request["t68"];
        item.t69 = Request["t69"];
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

        item.r1 = Request["r1"];
        item.r2 = Request["r2"];
        item.r3 = Request["r3"];
        item.r4 = Request["r4"];
        item.r5 = Request["r5"];
        item.r6 = Request["r6"];
        item.r7 = Request["r7"];
        item.r8 = Request["r8"];
        item.r9 = Request["r9"];
        item.r10 = Request["r10"];
        item.r11 = Request["r11"];
        item.r12 = Request["r12"];
        item.r13 = Request["r13"];
        item.r14 = Request["r14"];
        item.r15 = Request["r15"];
        item.r16 = Request["r16"];
        item.r17 = Request["r17"];
        item.r18 = Request["r18"];
        item.r19 = Request["r19"];
        item.r20 = Request["r20"];
        item.r21 = Request["r21"];

        item.r22 = Request["r22"];
        item.r23 = Request["r23"];
        item.r24 = Request["r24"];

        item.s1 = Request["s1"];
        item.s2 = Request["s2"];
        item.s3 = Request["s3"];
        item.s4 = Request["s4"];
        item.s5 = Request["s5"];
        item.s6 = Request["s6"];
        item.s7 = Request["s7"];
        item.s8 = Request["s8"];
        item.s9 = Request["s9"];
        item.s10 = Request["s10"];
        item.s11 = Request["s11"];
        item.s12 = Request["s12"];
        item.s13 = Request["s13"];
        item.s14 = Request["s14"];
        item.s15 = Request["s15"];
        item.s16 = Request["s16"];
        item.s17 = Request["s17"];
        item.s18 = Request["s18"];
        item.s19 = Request["s19"];
        item.s20 = Request["s20"];
        item.s21 = Request["s21"];

        item.s22 = Request["s22"];
        item.s23 = Request["s23"];
        item.s24 = Request["s24"];
        item.projectRisk = Request["projectRisk"];

        try
        {
            db.SaveChanges();
        }
        catch(Exception ex)
        {
            var sb2 = new StringBuilder();
            sb2.AppendFormat("{{");
            sb2.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-3");
            sb2.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
            sb2.AppendFormat("}}");
            Response.Write(sb2.ToString());
            return;
        }
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>