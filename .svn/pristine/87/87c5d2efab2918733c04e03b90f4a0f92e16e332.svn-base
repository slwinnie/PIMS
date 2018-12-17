<%@ Page Language="C#" %>
<%
    var editCsg = Request["editCsg"];
    var editYear = Request["editYear"];
    var editOffice = Request["editOffice"];
    var editPhase = Request["editPhase"];
    var editSerialNo = Request["editSerialNo"];
    var editProposalNo = Request["editProposalNo"];
    var editProjectNo = Request["editProjectNo"];
    var editClientOwner = Request["editClientOwner"];
    var editProjectName = Request["editProjectName"];
    var editProjectDescription = Request["editProjectDescription"];
    var editSow = Request["editSow"];
    var editProjectLocation = Request["editProjectLocation"];
    var editStartDate = Request["editStartDate"];
    var editEndDate = Request["editEndDate"];
    var editContractType = Request["editContractType"];
    var editType = Request["editType"];
    var editServiceType = Request["editServiceType"];
    var editContractHolder = Request["editContractHolder"];
    var editCurrency = Request["editCurrency"];
    var editCV = Request["editCV"];
    var editProjectSize = Request["editProjectSize"];
    var editPm = Request["editPm"];
    var editRisk = Request["editRisk"];
    var editHSEResponsibility = Request["editHSEResponsibility"];
    var editProjectInformation = Request["editProjectInformation"];
    var editAwardMonth = Request["editAwardMonth"];
    var editCreatedBy = Request["editCreatedBy"];
    var editModified = Request["editModified"];
    var editCreated = Request["editCreated"];
    var editSponsor = Request["editSponsor"];
    var editClosedDate = Request["editClosedDate"];
    var editProjectStatus = Request["editProjectStatus"];
    var editManhours = Request["editManhours"];
    var editWorkshare = Request["editWorkshare"];
    var editFinalCV = Request["editFinalCV"];
    var editFinalManhours = Request["editFinalManhours"];

    var editCrmtId = Request["editCrmtId"];
    var editRegisteredDate = Request["editRegisteredDate"];
    var editCustomerContactName = Request["editCustomerContactName"];
    var editTelNo = Request["editTelNo"];
    var editItemType = Request["editItemType"];

    var editEntity = Request["editEntity"];
    var editCategory = Request["editCategory"];
    var editClassification = Request["editClassification"];
    var editHSECategory = Request["editHSECategory"];
    
    var db = new PPPEntities();
    try
    {
        var item = db.TProjectRegister.Find(editCrmtId);
        if (item != null)
        {
            item.ClientName = editClientOwner;
            item.ProjectName = editProjectName;
            item.ProjectDescription = editProjectDescription;
            item.CSG = editCsg;
            item.Year = editYear;
            item.Office = editOffice;
            item.Phase = editPhase;
            item.SerialNo = editSerialNo;
            item.ProposalNo = editProposalNo;
            item.ProjectNo = editProjectNo;
            item.Sow = editSow;
            item.ProjectLocation = editProjectLocation;
            item.StartDate = string.IsNullOrEmpty(editStartDate) ? (DateTime?)null : Convert.ToDateTime(editStartDate);
            item.EndDate = string.IsNullOrEmpty(editEndDate) ? (DateTime?)null : Convert.ToDateTime(editEndDate);
            item.Currency = editCurrency;
            item.CV = editCV;
            item.ContractType = editContractType;
            item.Type = editType;
            item.ServiceType = editServiceType;
            item.ContractHolder = editContractHolder;
            item.Currency = editCurrency;
            item.ProjectSize = editProjectSize;
            item.PM = editPm;
            item.Risk = editRisk;
            item.HSEResponsibility = editHSEResponsibility;
            item.ProjectInformation = editProjectInformation;
            item.AwardMonth = editAwardMonth;
            item.CreatedBy = editCreatedBy;
            item.Modified = editModified;
            item.Created = editCreated;
            item.Sponsor = editSponsor;
            item.ClosedDate = string.IsNullOrEmpty(editClosedDate) ? (DateTime?)null : Convert.ToDateTime(editClosedDate);
            item.TelNo = editTelNo;
            item.ProjectStatus = editProjectStatus;
            item.Manhours = editManhours;

            item.TSEntity = editEntity;
            item.TSCategory = editCategory;
            item.TSClassification = editClassification;
            item.TSHSECategory = editHSECategory;

            item.Workshare = editWorkshare;
            item.FinalCV = editFinalCV;
            item.FinalManhours = editFinalManhours;
            item.RegisteredDate = Convert.ToDateTime(editRegisteredDate);
            item.CustomerContactName = editCustomerContactName;
            item.TelNo = editTelNo;
            item.ItemType = editItemType;
        }
        db.SaveChanges();
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    catch (Exception ex)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }



%>