<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Linq" %>
<%

    if (Request["crmtFileName"] == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid choose.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }

    var crmtFileName = Request["crmtFileName"];
    var projectIds = Request["projectIds"].ToString().Split('|');
    var db = new PPPEntities();
    var serverFileName = Path.Combine(Server.MapPath("~/Files"), crmtFileName);
    var sheetName = Request["sheetName"];
    var dt = GetTableFromExcel(sheetName, serverFileName);
    for (var i = 0; i < 3; i++) dt.Columns.RemoveAt(0);
    var q = dt.Rows.Cast<DataRow>().ToList();

    var ldr = new TCRMTLoader();
    var maxId = db.TCRMTLoader.Any() ? db.TCRMTLoader.Max(x => x.CRMDID) + 1 : 1;
    ldr.CRMDID = maxId;
    ldr.FileName = Request["crmtFileName"];
    ldr.Template = "CRMT";
    ldr.CreatedDate = DateTime.Now;
    ldr.LoadedBy = "xxxxx";
    db.TCRMTLoader.Add(ldr);
    
    foreach (var projectId in projectIds)
    {
        var iprojectId = Convert.ToInt32(projectId);
        var item = db.TProject.FirstOrDefault(x => x.ProjectId == iprojectId);
        if (item == null)
        {
            // New
            item = new TProject();
            var nData = q.First(x => x[0].ToString() == projectId);
            item.ProjectId = iprojectId;
            item.BusinessUnit = nData[1].ToString();
            item.OpportunityLeadSector = nData[2].ToString();
            item.BusinessLine = nData[3].ToString();

            item.ProjectName = nData[4].ToString();
            item.Customer = nData[5].ToString();
            item.ProspectStatus = nData[6].ToString();
            item.BidDueDate = nData[7] == DBNull.Value ? Convert.ToDateTime(nData[7]) : (DateTime?)null;
            item.AwardDate = nData[8] == DBNull.Value ? Convert.ToDateTime(nData[8]) : (DateTime?)null;
            item.Go = nData[9].ToString();
            item.Get = nData[10].ToString();
            item.WorleyParsonsCV = nData[11].ToString();
            item.WorleyParsonsEBIT = nData[12].ToString();
            item.EstimatedWork = nData[13].ToString();
            item.ContractDuration = nData[14].ToString();
            item.ContractType = nData[15].ToString();
            item.BidOffice = nData[16].ToString();
            item.FacilityLocationCountry = nData[17].ToString();
            item.Scopes = nData[18].ToString();
            item.OpportunityLeadSubsector = nData[19].ToString();
            item.Custodian = nData[20].ToString();
            item.ContractCurrency = nData[21].ToString();
            db.TProject.Add(item);

            var ldrDetail = new TCRMTLoaderDetail();
            ldrDetail.CRMTID = ldr.CRMDID;
            ldrDetail.ProjectId = item.ProjectId;
            ldrDetail.BusinessUnit = item.BusinessUnit;
            ldrDetail.BusinessLine = item.BusinessLine;
            ldrDetail.OpportunityLeadSector = item.OpportunityLeadSector;
            ldrDetail.ProjectName = item.ProjectName;
            ldrDetail.Customer = item.Customer;
            ldrDetail.ProspectStatus = item.ProspectStatus;
            ldrDetail.BidDueDate = item.BidDueDate;
            ldrDetail.AwardDate = item.AwardDate;
            ldrDetail.Go = item.Go;
            ldrDetail.Get = item.Get;

            ldrDetail.WorleyParsonsCV = item.WorleyParsonsCV;
            ldrDetail.WorleyParsonsEBIT = item.WorleyParsonsEBIT;
            ldrDetail.EstimatedWork = item.EstimatedWork;
            ldrDetail.ContractDuration = item.ContractDuration;
            ldrDetail.ContractType = item.ContractType;
            ldrDetail.BidOffice = item.BidOffice;
            ldrDetail.FacilityLocationCountry = item.FacilityLocationCountry;
            ldrDetail.WorkshareOffices = item.WorkshareOffices;
            ldrDetail.Scopes = item.Scopes;
            ldrDetail.OpportunityLeadSubsector = item.OpportunityLeadSubsector;
            ldrDetail.Custodian = item.Custodian;
            ldrDetail.OpportunityPriority = item.OpportunityPriority;
            ldrDetail.ContractCurrency = item.ContractCurrency;
            ldrDetail.RowStatus = "Append";
            db.TCRMTLoaderDetail.Add(ldrDetail);
        }
        else
        {
            // Update

            var nData = q.First(x => x[0].ToString() == projectId);
            //item.ProjectId = iprojectId;
            item.BusinessUnit = nData[1].ToString();
            item.OpportunityLeadSector = nData[2].ToString();
            item.BusinessLine = nData[3].ToString();
            item.ProjectName = nData[4].ToString();
            item.Customer = nData[5].ToString();
            item.ProspectStatus = nData[6].ToString();
            item.BidDueDate = nData[7] == DBNull.Value ? Convert.ToDateTime(nData[7]) : (DateTime?)null;
            item.AwardDate = nData[8] == DBNull.Value ? Convert.ToDateTime(nData[8]) : (DateTime?)null;
            item.Go = nData[9].ToString();
            item.Get = nData[10].ToString();
            item.WorleyParsonsCV = nData[11].ToString();
            item.WorleyParsonsEBIT = nData[12].ToString();
            item.EstimatedWork = nData[13].ToString();
            item.ContractDuration = nData[14].ToString();
            item.ContractType = nData[15].ToString();
            item.BidOffice = nData[16].ToString();
            item.FacilityLocationCountry = nData[17].ToString();
            item.Scopes = nData[18].ToString();
            item.OpportunityLeadSubsector = nData[19].ToString();
            item.Custodian = nData[20].ToString();
            item.ContractCurrency = nData[21].ToString();

            var ldrDetail = new TCRMTLoaderDetail();
            ldrDetail.CRMTID = ldr.CRMDID;
            ldrDetail.ProjectId = item.ProjectId;
            ldrDetail.BusinessUnit = item.BusinessUnit;
            ldrDetail.BusinessLine = item.BusinessLine;
            ldrDetail.OpportunityLeadSector = item.OpportunityLeadSector;
            ldrDetail.ProjectName = item.ProjectName;
            ldrDetail.Customer = item.Customer;
            ldrDetail.ProspectStatus = item.ProspectStatus;
            ldrDetail.BidDueDate = item.BidDueDate;
            ldrDetail.AwardDate = item.AwardDate;
            ldrDetail.Go = item.Go;
            ldrDetail.Get = item.Get;
            ldrDetail.WorleyParsonsCV = item.WorleyParsonsCV;
            ldrDetail.WorleyParsonsEBIT = item.WorleyParsonsEBIT;
            ldrDetail.EstimatedWork = item.EstimatedWork;
            ldrDetail.ContractDuration = item.ContractDuration;
            ldrDetail.ContractType = item.ContractType;
            ldrDetail.BidOffice = item.BidOffice;
            ldrDetail.FacilityLocationCountry = item.FacilityLocationCountry;
            ldrDetail.WorkshareOffices = item.WorkshareOffices;
            ldrDetail.Scopes = item.Scopes;
            ldrDetail.OpportunityLeadSubsector = item.OpportunityLeadSubsector;
            ldrDetail.Custodian = item.Custodian;
            ldrDetail.OpportunityPriority = item.OpportunityPriority;
            ldrDetail.ContractCurrency = item.ContractCurrency;
            ldrDetail.RowStatus = "Modify";
            db.TCRMTLoaderDetail.Add(ldrDetail);
        }
    }
    try
    {
        db.SaveChanges();
    }
    catch (Exception ex)
    {
        throw;
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
<script runat="server" language="c#">
    private DataTable GetTableFromExcel(string sheetName, string filePath)
    {
        const string connStrTemplate = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=\"Excel 12.0;HDR=Yes;\"";
        DataTable dt = null;
        if (!System.IO.File.Exists(filePath))
        {
            // don't find file
            return null;
        }
        OleDbConnection conn = new OleDbConnection(string.Format(connStrTemplate, filePath));
        try
        {
            conn.Open();
            if (sheetName == null || sheetName.Trim().Length == 0)
            {
                DataTable schemaTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                sheetName = schemaTable.Rows[0]["TABLE_NAME"].ToString().Trim();
            }
            //else
            //{
            //    sheetName += "$";
            //}

            string strSQL = "Select * From [" + sheetName + "]";
            var da = new OleDbDataAdapter(strSQL, conn);
            var ds = new DataSet();
            da.Fill(ds);
            dt = ds.Tables[0];
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }

        return dt;
    }
</script>