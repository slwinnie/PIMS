<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var projectId = Convert.ToInt32(Request["projectId"]);
    var subId = Convert.ToInt32(Request["subId"]);
    var npis = db.NPISForm.Where(x => x.ProjectId == projectId && x.type == "1");

    if (npis.Any())
    {
        var maxSubId = Convert.ToInt32(npis.Max(x => x.SubId));
        var from = npis.First(x => x.SubId == maxSubId);
        var to = db.NPISForm.First(x => x.ProjectId == projectId && x.SubId == subId && x.type == "2");
        if (from != null && to != null)
        {
            to.c1 = from.c1;
            to.c2 = from.c2;
            to.c3 = from.c3;
            to.c4 = from.c4;
            to.c5 = from.c5;
            to.c6 = from.c6;
            to.c7 = from.c7;
            to.c8 = from.c8;
            to.c9 = from.c9;
            to.c10 = from.c10;
            to.c11 = from.c11;
            to.c12 = from.c12;
            to.t1 = from.t1;
            to.t2 = from.t2;
            to.t3 = from.t3;
            to.t4 = from.t4;
            to.t5 = from.t5;
            to.t6 = from.t6;
            to.t7 = from.t7;
            to.t8 = from.t8;
            to.t9 = from.t9;
            to.t10 = from.t10;
            to.t11 = from.t11;
            to.t12 = from.t12;
            to.t13 = from.t13;
            to.t14 = from.t14;
            to.t15 = from.t15;
            to.t16 = from.t16;
            to.t17 = from.t17;
            to.t18 = from.t18;
            to.t19 = from.t19;
            to.t20 = from.t20;
            to.t21 = from.t21;
            to.t22 = from.t22;
            to.t23 = from.t23;
            to.t24 = from.t24;
            to.t25 = from.t25;
            to.t26 = from.t26;
            to.t27 = from.t27;
            to.t28 = from.t28;
            to.t29 = from.t29;
            to.t30 = from.t30;
            to.t31 = from.t31;
            to.t32 = from.t32;
            to.t33 = from.t33;
            to.t34 = from.t34;
            to.t35 = from.t35;
            to.t36 = from.t36;
            to.t37 = from.t37;
            to.t38 = from.t38;
            to.t39 = from.t39;
            to.t40 = from.t40;
            to.t41 = from.t41;
            to.t42 = from.t42;
            to.t43 = from.t43;
            to.t44 = from.t44;

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
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Param.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Proposal NPIS Form.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
     %>