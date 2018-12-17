<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var projectId = Convert.ToInt32(Request["projectId"]);
    var subId = Convert.ToInt32(Request["subId"]);
    var item = db.TProjectX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (item == null)
    {
        Response.Write("");
        return;
    }
    
    var people = db.TPeople.FirstOrDefault(x => x.EmployeeId == item.ProjectManagerId);
    
    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ProjectId", item.ProjectId);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "BusinessUnit", item.BusinessUnit);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "BusinessLine", item.BusinessLine);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "OpportunityLeadSector", item.OpportunityLeadSector);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ProjectName", item.ProjectName);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "Customer", item.Customer);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "Status", item.Status);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "BidDueDate", StringHelper.FmtDate(item.BidDueDate));
    sb.AppendFormat("\"{0}\":\"{1}\", ", "AWardDate", StringHelper.FmtDate(item.AWardDate));
    sb.AppendFormat("\"{0}\":\"{1}\", ", "Go", item.Go);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "Get", item.Get);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "WorleyParsonsCV", StringHelper.FmtNumber(item.WorleyParsonsCV));
    sb.AppendFormat("\"{0}\":\"{1}\", ", "WorleyParsonsEBIT", StringHelper.FmtNumber(item.WorleyParsonsEBIT));
    sb.AppendFormat("\"{0}\":\"{1}\", ", "EstimatedWork", StringHelper.FmtNumber(item.EstimatedWork));
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ContractDuration", StringHelper.FmtNumber(item.ContractDuration));
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ContractType", item.ContractType);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "BidOffice", item.BidOffice);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "FacilityLocationCountry", item.FacilityLocationCountry);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "WorkshareOffices", item.WorkshareOffices);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "Scopes", item.Scopes);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "OpportunityLeadSubsector", item.OpportunityLeadSubsector);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "Custodian", item.Custodian);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "OpportunityPriority", item.OpportunityPriority);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ContractCurrency", item.ContractCurrency);
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ProjectManager", people == null ? "" : people.PeopleNameEn);
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ProjectManagerId", item.ProjectManagerId);
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());


%>