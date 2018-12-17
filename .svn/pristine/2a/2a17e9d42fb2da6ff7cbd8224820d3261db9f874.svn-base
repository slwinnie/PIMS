<%@ Page Language="C#" %>

<%
    #region Create New
    if (Request["flg"] == "1")
    {
        var db = new PPPEntities();
        var projectId = Convert.ToInt32(Request["projectId"]);
        var p = db.TProject.FirstOrDefault(x => x.ProjectId == projectId);
        if (p != null)
        {
            var subId = 1;
            if (db.TProposalX.Any(x => x.ProjectId == projectId))
            {
                subId = db.TProposalX.Where(x=>x.ProjectId == projectId).Max(x => x.SubId) + 1;
            }

            var proposalX = new TProposalX();
            proposalX.ProjectId = p.ProjectId;
            proposalX.SubId = subId;
            proposalX.OriginatorId = Convert.ToInt32(Request["UserId"]);
            proposalX.CreatedDate = DateTime.Now;
            proposalX.Status = "New";
            proposalX.BusinessUnit = p.BusinessUnit;
            proposalX.BusinessLine = p.BusinessLine;
            proposalX.OpportunityLeadSector = p.OpportunityLeadSector;
            proposalX.ProjectName = p.ProjectName;
            proposalX.Customer = p.Customer;
            proposalX.BidDueDate = p.BidDueDate;
            proposalX.AWardDate = p.AwardDate;
            proposalX.Go = p.Go;
            proposalX.Get = p.Get;
            proposalX.WorleyParsonsCV = p.WorleyParsonsCV;
            proposalX.WorleyParsonsEBIT = p.WorleyParsonsEBIT;
            proposalX.EstimatedWork = p.EstimatedWork;
            proposalX.ContractDuration = p.ContractDuration;
            proposalX.ContractType = p.ContractType;
            proposalX.BidOffice = p.BidOffice;
            proposalX.FacilityLocationCountry = p.FacilityLocationCountry;
            proposalX.WorkshareOffices = p.WorkshareOffices;
            proposalX.Scopes = p.Scopes;
            proposalX.OpportunityLeadSubsector = p.OpportunityLeadSubsector;
            proposalX.Custodian = p.Custodian;
            proposalX.OpportunityPriority = p.OpportunityPriority;
            proposalX.ContractCurrency = p.ContractCurrency;
            proposalX.ProposalDescription = p.ProjectDescription;

            db.TProposalX.Add(proposalX);

            p.Status = "Proposal initiation";      
            db.SaveChanges();
        }
        Response.Redirect(string.Format("~/Project/ProposalInitiation.aspx?projectId={0}", Request["projectId"]));
    }
    #endregion

     %>