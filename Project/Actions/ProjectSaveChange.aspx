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
    var item = db.TProjectX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
    if (item == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid ProjectId & SubId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    else
    {
        item.BusinessUnit = Request["txtBusinessUnit"];
        item.BusinessLine = Request["txtBusinessLine"];
        item.OpportunityLeadSector = Request["txtOpportunityLeadSector"];
        item.ProjectName = Request["txtProjectName"];
        item.Customer = Request["txtCustomer"];
        item.Status = Request["txtProjectStatus"];
        item.BidDueDate = string.IsNullOrEmpty(Request["txtBidDueDate"]) ? (DateTime?)null : Convert.ToDateTime(Request["txtBidDueDate"]);
        item.AWardDate = string.IsNullOrEmpty(Request["txtAWardDate"]) ? (DateTime?)null : Convert.ToDateTime(Request["txtAWardDate"]);
        item.Go = Request["txtGo"];
        item.Get = Request["txtGet"];
        item.WorleyParsonsCV = Request["txtWPCV"];
        item.WorleyParsonsEBIT = Request["txtWPEBIT"];
        item.EstimatedWork = Request["txtEstimatedWork"];
        item.ContractDuration = Request["txtContractDuration"];
        item.ContractType = Request["txtContractType"];
        item.BidOffice = Request["txtBidOffice"];
        item.FacilityLocationCountry = Request["txtFacilityLocationCountry"];
        item.WorkshareOffices = Request["txtWorkshareOffice"];
        item.Scopes = Request["txtScopes"];
        item.OpportunityLeadSubsector = Request["txtOpportunityLeadSubsector"];
        item.Custodian = Request["txtCustodian"];
        item.OpportunityPriority = Request["txtOpportunityPriority"];
        item.ContractCurrency = Request["txtContractCurrency"];
        item.PType = Request["PType"];
        //item.ProjectManagerId = string.IsNullOrEmpty(Request["txtProjectManagerId"]) ? (int?)null : Convert.ToInt32(Request["txtProjectManagerId"]);

        var nameEn = Request["txtProjectManagerId"];
        if (string.IsNullOrEmpty(nameEn))
        {
            item.ProjectManagerId = null;
            db.SaveChanges();
        }
        else
        {
            var v = db.TPeople.FirstOrDefault(x => x.PeopleNameEn.Contains(nameEn));
            if (v != null)
            {
                item.ProjectManagerId = v.EmployeeId;
            }
            else
            {
                item.ProjectManagerId = null;
            }
            db.SaveChanges();
        }

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>