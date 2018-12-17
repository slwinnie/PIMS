<%@ Page Language="C#" %>
<%
    #region Create New
    if (Request["flg"] == "1")
    {
        var db = new PPPEntities();
        var projectId = Convert.ToInt32(Request["projectId"]);
        var projectType = Request["projectType"];
        var p = db.TProject.FirstOrDefault(x => x.ProjectId == projectId);
        if (p != null)
        {
            var subId = 1;
            if (db.TProjectX.Any(x => x.ProjectId == projectId))
            {
                subId = db.TProjectX.Where(x => x.ProjectId == projectId).Max(x => x.SubId) + 1;
            }

            var projectX = new TProjectX();
            projectX.ProjectId = p.ProjectId;
            projectX.SubId = subId;
            projectX.OriginatorId = Convert.ToInt32(Request["UserId"]);
            projectX.CreatedDate = DateTime.Now;
            projectX.Status = "New";
            projectX.BusinessUnit = p.BusinessUnit;
            projectX.BusinessLine = p.BusinessLine;
            projectX.OpportunityLeadSector = p.OpportunityLeadSector;
            projectX.ProjectName = p.ProjectName;
            projectX.Customer = p.Customer;
            projectX.BidDueDate = p.BidDueDate;
            projectX.AWardDate = p.AwardDate;
            projectX.Go = p.Go;
            projectX.Get = p.Get;
            projectX.WorleyParsonsCV = p.WorleyParsonsCV;
            projectX.WorleyParsonsEBIT = p.WorleyParsonsEBIT;
            projectX.EstimatedWork = p.EstimatedWork;
            projectX.ContractDuration = p.ContractDuration;
            projectX.ContractType = p.ContractType;
            projectX.BidOffice = p.BidOffice;
            projectX.FacilityLocationCountry = p.FacilityLocationCountry;
            projectX.WorkshareOffices = p.WorkshareOffices;
            projectX.Scopes = p.Scopes;
            projectX.OpportunityLeadSubsector = p.OpportunityLeadSubsector;
            projectX.Custodian = p.Custodian;
            projectX.OpportunityPriority = p.OpportunityPriority;
            projectX.ContractCurrency = p.ContractCurrency;
            projectX.ProjectType = projectType;
            db.TProjectX.Add(projectX);

            p.Status = "Project initiation";    
            db.SaveChanges();
        }
        Response.Redirect(string.Format("~/Project/ProjectInitiation.aspx?projectId={0}", Request["projectId"]));
    }
    #endregion

     %>