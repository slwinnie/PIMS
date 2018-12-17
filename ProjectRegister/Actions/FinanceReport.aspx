<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();

    Func<string, string> Cell = (iv) =>
    {
        var v = iv;
        if (v == null) return "\"\"";

        if (v.Contains("\""))
        {
            //v =  "\"" + iv.Replace("\"", "\"\"") + "\"";
            v = v.Replace("\"", "");
        }
        else
        {
            if (v.Contains(","))
            {
                v = v.Replace(",", " ");
            }
        }

        return  v;
    };

    var reg = db.TProjectRegister.AsEnumerable();
    var sb = new StringBuilder();
    sb.AppendFormat("{0}, ", Cell("Proposal No."));
    sb.AppendFormat("{0}, ", Cell("Project No."));
    sb.AppendFormat("{0}, ", Cell("Project Name."));
    sb.AppendFormat("{0}, ", Cell("Office"));
    sb.AppendFormat("{0}, ", Cell("Contact Holder"));
    sb.AppendFormat("{0}, ", Cell("Customer Type"));
    sb.AppendFormat("{0}, ", Cell("Client Name"));
    sb.AppendFormat("{0}, ", Cell("Billing Type"));
    sb.AppendFormat("{0}, ", Cell("Business Line"));
    sb.AppendFormat("{0}, ", Cell("Scope of Service"));
    sb.AppendFormat("{0}, ", Cell("Workshare"));
    sb.AppendFormat("{0}, ", Cell("Project Size"));
    sb.AppendFormat("{0}, ", Cell("Contract Value"));
    sb.AppendFormat("{0}, ", Cell("Start"));
    sb.AppendFormat("{0}, ", Cell("End"));
    sb.AppendFormat("{0}, ", Cell("Project Manager"));
    sb.AppendFormat("{0}, ", Cell("CRMT ID"));
    sb.AppendFormat("{0}, ", Cell("Customer Subsector"));
    sb.AppendFormat("{0}, ", Cell("Capability Subsector"));
    sb.AppendFormat("{0}, ", Cell("Asset type"));
    sb.AppendFormat("{0}, ", Cell("Country of Asset"));

    string names =  System.DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss");

    Response.AppendHeader("content-disposition", "attachment;filename=" + names + ".csv");
    Response.ContentEncoding = System.Text.Encoding.Default;
    sb.AppendFormat("\n");
    if (!string.IsNullOrEmpty(Request["year"]))
    {
        var y = Request["year"].ToString();
        reg = reg.Where(x => x.Year == y);
    }
    if (!string.IsNullOrEmpty(Request["status"]))
    {
        var y = Request["status"].ToString();
        reg = reg.Where(x => x.ProjectStatus == y);
    }
    if (!string.IsNullOrEmpty(Request["office"]))
    {
        var y = Request["office"].ToString();
        reg = reg.Where(x => x.Office == y);
    }
    if (!string.IsNullOrEmpty(Request["csg"]))
    {
        var y = Request["csg"].ToString();
        reg = reg.Where(x => x.CSG == y);
    }
    if (!string.IsNullOrEmpty(Request["searchKey"]))
    {
        var y = Request["searchKey"].ToString();
        reg = reg.Where(x => x.ClientName.Contains(y)
            || x.ProjectName.Contains(y) 
            || x.ProjectNo.Contains(y));
    }

    foreach(var r in reg)
    {
        var customerSubsector = string.Empty;
        var capabilitySubsector = string.Empty;
        var assetType = string.Empty;
        var countryOfAsset = string.Empty;
        var customerType = string.Empty;
        var businessLine = string.Empty;
        var billingType = string.Empty;
        var scopeOfServices = string.Empty;
        var pp = db.TProjectX.Where(x => x.ProjectNo == r.ProjectNo).OrderByDescending(x=>x.SubId);
        var pm = "";
        int ii;
        if (int.TryParse(r.PM, out ii))
        {
            var empId = Convert.ToInt32(r.PM);
            var ppl = db.TPeople.FirstOrDefault(x => x.EmployeeId == empId);
            pm = ppl.PeopleNameEn;
        }
        else
        {
            pm = r.PM;
        }
        TProjectX projectInfo = null;
        var crmtId = "";
        if (pp.Any())
        {
            projectInfo = pp.First();
            var subId = projectInfo.SubId;
            var projectId = projectInfo.ProjectId;
            var npis = db.NPISForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
            crmtId = projectId.ToString();
            customerSubsector = TransCodeHelper.TransCustomerSubsector(npis.t49);
            capabilitySubsector = TransCodeHelper.TransCapabilitySubsector(npis.t50);
            assetType = npis.t55;
            countryOfAsset = npis.t54;
            customerType = npis.t12;
            businessLine = npis.t4;
            billingType = npis.t29;
            scopeOfServices = npis.t53;
        }

        sb.AppendFormat("{0}, ", Cell(r.ProposalNo));
        sb.AppendFormat("{0}, ", Cell(r.ProjectNo));
        sb.AppendFormat("{0}, ", Cell(r.ProjectName));
        sb.AppendFormat("{0}, ", Cell(r.Office));
        sb.AppendFormat("{0}, ", Cell(r.ContractHolder));
        sb.AppendFormat("{0}, ", Cell(customerType));
        sb.AppendFormat("{0}, ", Cell(r.ClientName));
        sb.AppendFormat("{0}, ", Cell(billingType));
        sb.AppendFormat("{0}, ", Cell(businessLine));
        sb.AppendFormat("{0}, ", Cell(scopeOfServices));
        sb.AppendFormat("{0}, ", Cell(r.Workshare));
        sb.AppendFormat("{0}, ", Cell(r.ProjectSize));
        sb.AppendFormat("{0}, ", Cell(r.ContractType));
        sb.AppendFormat("{0}, ", Cell(r.StartDate == null ? "" : r.StartDate.Value.ToString("d")));
        sb.AppendFormat("{0}, ", Cell(r.EndDate == null ? "" : r.EndDate.Value.ToString("d")));
        sb.AppendFormat("{0}, ", Cell(pm));
        sb.AppendFormat("{0}, ", Cell(crmtId));
        sb.AppendFormat("{0}, ", Cell(TransCodeHelper.TransCustomerSubsector(customerSubsector)));
        sb.AppendFormat("{0}, ", Cell(TransCodeHelper.TransCapabilitySubsector(capabilitySubsector)));
        sb.AppendFormat("{0}, ", Cell(assetType));
        sb.AppendFormat("{0}, ", Cell(countryOfAsset));
        sb.AppendFormat("\n");
    }

    Response.Write(sb);
%>