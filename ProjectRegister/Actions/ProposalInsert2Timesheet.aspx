<%@ Page Language="C#" %>
<%@ Import Namespace="cnbeiwpweb02v.ProjectRelease" %>
<%
    var crmtId = Request["crmtid"];
    var db = new PPPEntities();
    var pr = db.TProposalRegister.FirstOrDefault(x => x.CRMTID == crmtId);
    if (pr == null)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-4");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid crmtid.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    
    // 判断项目号是否存在
    cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoap soap = new cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoapClient();
    checkProjectNoRequest p = new checkProjectNoRequest();
    p.Body = new checkProjectNoRequestBody(pr.ProposalNo);
    var rst = soap.checkProjectNo(p);
    if (!rst.Body.checkProjectNoResult)
    {
        // 项目号已经存在
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project exist.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    else
    {
        // 项目号不存在
        // Response.Write("Not exist!");

        var projectNo = pr.ProposalNo;
        var projectName = pr.ProposalName;
        var client = pr.NamesOfImmediateClientOrOwner;
        var status = pr.Status;
        var manager = pr.ProposalManager;
        var entity = "entity";
        var type = pr.ItemType;
        var category = "category";
        var classification = "classification";
        var hsecategory = "hsecategory";
        var businessline = "businessline";
        var scope = "scope";
        var location = "location";
        var startdate = "";
        var enddate = "";
        var totalmhs = "0";
        var office = pr.Office;

        cnbeiwpweb02v.ProjectRelease.projectInfoStruc stru = new cnbeiwpweb02v.ProjectRelease.projectInfoStruc();
        cnbeiwpweb02v.ProjectRelease.insertProjectRequestBody ibody = new insertProjectRequestBody(stru);

        ibody.projectInfo.projectNo = projectNo;
        ibody.projectInfo.projectName = projectName;
        ibody.projectInfo.client = client;
        ibody.projectInfo.Status = status;
        ibody.projectInfo.Manager = manager;
        ibody.projectInfo.Entity = entity;
        ibody.projectInfo.Type = type;
        ibody.projectInfo.Category = category;
        ibody.projectInfo.Classification = classification;
        ibody.projectInfo.HSE_Category = hsecategory;
        ibody.projectInfo.BusinessLine = businessline;
        ibody.projectInfo.Scope = scope;
        ibody.projectInfo.Location = location;
        ibody.projectInfo.Start_Date = startdate;
        ibody.projectInfo.End_Date = enddate;
        ibody.projectInfo.Total_MHs = totalmhs;
        ibody.projectInfo.Office = office;
        
        cnbeiwpweb02v.ProjectRelease.insertProjectRequest ireq = new insertProjectRequest(ibody);
        soap.insertProject(ireq);
        try
        {
            // 判断项目号是否存在
            checkProjectNoRequest pno = new checkProjectNoRequest();
            pno.Body = new checkProjectNoRequestBody(projectNo);
            var rst2 = soap.checkProjectNo(pno);
            if (!rst2.Body.checkProjectNoResult)
            {
                // 项目号已经存在
                // 插入项目号成功！
                var sb = new StringBuilder();
                sb.AppendFormat("{{");
                sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
                sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Release Success.");
                sb.AppendFormat("}}");
                Response.Write(sb.ToString());
            }
            else
            {
                // 项目号不存在
                // 插入项目号失败！
                var sb = new StringBuilder();
                sb.AppendFormat("{{");
                sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
                sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Release Failed.");
                sb.AppendFormat("}}");
                Response.Write(sb.ToString());
            }
        }
        catch (Exception ex)
        {
            // 系统异常
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-3");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
%>
