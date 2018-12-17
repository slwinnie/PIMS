<%@ Page Language="C#" %>
<%
    var projectId = Convert.ToInt32(Request["projectId"]);
    var subId = Convert.ToInt32(Request["subId"]);
    var type = Request["type"].ToString();
    var db = new PPPEntities();
    var px = db.NPISForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == type);
    if (px != null)
    {
        if (type == "1")
        {
            if (px.c12 != "true")
            {
                var sb = new StringBuilder();
                sb.AppendFormat("{{");
                sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
                sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Attachment option [If no formal proposal procedures have been followed, attach as-sold commercial basis.] is required for proposal.");
                sb.AppendFormat("}}");
                Response.Write(sb.ToString());
                return;
            }
            else
            {
                if (!db.NPISAttach.Any(x => x.ProjectId == projectId && x.SubId == subId && x.type == type))
                {
                    var sb = new StringBuilder();
                    sb.AppendFormat("{{");
                    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
                    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Attachment file is required for proposal.");
                    sb.AppendFormat("}}");
                    Response.Write(sb.ToString());
                    return;
                }
            }
        }
        else if (type == "2")
        {
            if (px.c9 != "true" && px.c11 != "true")
            {
                var sb = new StringBuilder();
                sb.AppendFormat("{{");
                sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-3");
                sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Attachment option [Completed and approved Contract Sign-Off Checklist (CSOC) where no existing contract was in place. Alternatively an executed Letter of Intent/Interim Agreement. Note that the CSOC is required for all contracts including those using standard T&Cs.] or [Customer Work Order/Purchase Order/Contract.] is required for project.");
                sb.AppendFormat("}}");
                Response.Write(sb.ToString());
                return;
            }
            else
            {
                if (!db.NPISAttach.Any(x => x.ProjectId == projectId && x.SubId == subId && x.type == type))
                {
                    var sb = new StringBuilder();
                    sb.AppendFormat("{{");
                    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-4");
                    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Attachment file is required for project.");
                    sb.AppendFormat("}}");
                    Response.Write(sb.ToString());
                    return;
                }
            }
        }

        if (px.t2 == "" || px.t2 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-5");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project Type is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t3 == "" || px.t3 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-6");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "WP Contracting Entity or JV is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t4 == "" || px.t4 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-7");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Business Line is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t49 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-8");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Customer Subsector is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t50 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-9");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Capability Subsector is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t7 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-10");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Home Office Location is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t8 == "" || px.t8 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-11");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "GBS Project Template is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t9 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-12");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project Title is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t13 == "" || px.t13 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-13");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Internal Entity is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t14 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-14");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Customer Name is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t16 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-15");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Bill to address is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t18 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-16");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Estimated WP Hour is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t19 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-17");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Estimated WP Revenue is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t20 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-18");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Contract Currency is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t52 == "" || px.t52 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-19");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Phase is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t53 == "" || px.t53 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-20");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Scope of Services is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t54 == "" || px.t54 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-21");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Country of Asset is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t55 == "" || px.t55 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-22");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Asset Type is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t26 == "" || px.t26 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-23");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Existing WP Contract is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t29 == "" || px.t29 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-24");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Billing Type is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t30 == "" || px.t30 == "-1")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-25");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Contractual basis for commencement of billable work is required..");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t31 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-26");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project Manager is required.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t33 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-27");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project Accountant is required.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t35 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-28");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project Controller is required.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t39 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-29");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project Manager Name is required.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t40 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-30");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Authorized Approval Signatory Name is required.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
        if (px.t45 == "")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-31");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Location Finance is required.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }
    }
    else
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-32");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "System error.");
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