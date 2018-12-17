<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var iCrmtid = Convert.ToInt32(Request["crmtid"]);
    var items = db.TCRMTLoaderDetail.Where(x => x.CRMTID == iCrmtid );

    var sb = new StringBuilder();
    sb.Append("[");

    var index = 0;
    foreach (var item in items)
    {
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "RowStatus", item.RowStatus);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ProjectId", item.ProjectId);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "BusinessUnit", item.BusinessUnit);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "BusinessLine", item.BusinessLine);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "OpportunityLeadSector", item.OpportunityLeadSector);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ProjectName", item.ProjectName);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Customer", item.Customer);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Status", item.Status);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "BidDueDate", StringHelper.FmtDate(item.BidDueDate));
        sb.AppendFormat("\"{0}\":\"{1}\", ", "AWardDate", StringHelper.FmtDate(item.AwardDate));
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Go", item.Go);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Get", item.Get);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "WorleyParsonsCV", item.WorleyParsonsCV);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "WorleyParsonsEBIT", item.WorleyParsonsEBIT);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "EstimatedWork", item.EstimatedWork);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ContractDuration", item.ContractDuration);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ContractType", item.ContractType);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "BidOffice", item.BidOffice);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "FacilityLocationCountry", item.FacilityLocationCountry);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "WorkshareOffices", item.WorkshareOffices);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Scopes", item.Scopes);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "OpportunityLeadSubsector", item.OpportunityLeadSubsector);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "Custodian", item.Custodian);
        sb.AppendFormat("\"{0}\":\"{1}\", ", "OpportunityPriority", item.OpportunityPriority);
        sb.AppendFormat("\"{0}\":\"{1}\" ", "ContractCurrency", item.ContractCurrency);

        index++;
        if (index == items.Count())
        {
            sb.AppendFormat("}}");
        }
        else
        {
            sb.AppendFormat("}},");
        }
    }

    sb.Append("]");
    Response.Write(sb.ToString());


%>