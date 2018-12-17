<%@ Page Language="C#" %>
<%
    var editCrmtId = Request["editCrmtId"];
    var editCsg = Request["editCsg"];
    var editYear = Request["editYear"];
    var editOffice = Request["editOffice"];
    var editPhase = Request["editPhase"];
    var editSerialNo = Request["editSerialNo"];
    var editProposalNo = Request["editProposalNo"];
    var editClientOwner = Request["editClientOwner"];
    var editProposalName = Request["editProposalName"];
    var editProposalDescription = Request["editProposalDescription"];
    var editSow = Request["editSow"];
    var editToc = Request["editToc"];
    var editCountry = Request["editCountry"];
    var editLocation = Request["editLocation"];
    var editHomh = Request["editHomh"];
    var editCurrency = Request["editCurrency"];
    var editCV = Request["editCV"];
    var editPC = Request["editPC"];
    var editBDD = Request["editBDD"];
    var editDuration = Request["editDuration"];
    var editGo = Request["editGo"];
    var editGet = Request["editGet"];
    var editTIC = Request["editTIC"];
    var editRisk = Request["editRisk"];
    var editBidBond = Request["editBidBond"];
    var editEda = Request["editEda"];
    var editCompetitors = Request["editCompetitors"];
    var editRemarks = Request["editRemarks"];
    var editPersonResp = Request["editPersonResp"];
    var editReportDate = Request["editReportDate"];
    var editHSEResponsibility = Request["editHSEResponsibility"];
    var editStatus = Request["editStatus"];
    var editCustomerContactName = Request["editCustomerContactName"];
    var editTelNo = Request["editTelNo"];
    var editArchive = Request["editArchive"];
    var editItemType = Request["editItemType"];
    var editFillDate = Request["editFillDate"];

    var editEntity = Request["editEntity"];
    var editCategory = Request["editCategory"];
    var editClassification = Request["editClassification"];
    var editHSECategory = Request["editHSECategory"];

    var editProposalManager = Request["editProposalManager"];
    var editModified = Request["editModified"];
    var db = new PPPEntities();
    try
    {
        var item = db.TProposalRegister.Find(editCrmtId);
        if (item != null)
        {
            item.CSG = editCsg;
            item.Year = editYear;
            item.Office = editOffice;
            item.Phase = editPhase;
            item.SerialNo = editSerialNo;
            item.ProposalNo = editProposalNo;
            item.ProposalDescription = editProposalDescription;
            item.Sow = editSow;
            item.Toc = editToc;
            item.Country = editCountry;
            item.Location = editLocation;
            item.HOMH = editHomh;
            item.Currency = editCurrency;
            item.CV = editCV;
            item.PC = editPC;
            item.BDD = editBDD;
            item.Duration = editDuration;
            item.ProposalManager = editProposalManager;
            item.Go = editGo;
            item.Get = editGet;
            item.TIC = editTIC;
            item.Risk = editRisk;
            item.BidBond = editBidBond;
            item.EDA = editEda;
            item.Competitors = editCompetitors;
            item.Remarks = editRemarks;
            item.PersonResp = editPersonResp;
            item.Modified = editModified;
            item.ReportDate = editReportDate;
            item.HSEResponsibility = editHSEResponsibility;
            item.CustomerContactName = editCustomerContactName;
            item.TelNo = editTelNo;
            item.Archive = editArchive;
            item.ItemType = editItemType;
            item.FillDate = editFillDate == "" ? (DateTime?)null : Convert.ToDateTime(editFillDate);
            item.TSEntity = editEntity;
            item.TSCategory = editCategory;
            item.TSClassification = editClassification;
            item.TSHSECategory = editHSECategory;
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