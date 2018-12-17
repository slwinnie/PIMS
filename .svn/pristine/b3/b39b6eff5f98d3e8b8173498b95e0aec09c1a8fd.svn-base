<%@ Page Language="C#" %>
<%@ Import Namespace="cnbeiwpweb02v.ProjectRelease" %>
<%
    // 判断项目号是否存在
    cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoap soap = new cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoapClient();
    checkProjectNoRequest p = new checkProjectNoRequest();

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

    p.Body = new checkProjectNoRequestBody(pr.ProposalNo);
    var rst = soap.checkProjectNo(p);
    if (!rst.Body.checkProjectNoResult)
    {
        // 项目号已经存在
        cnbeiwpweb02v.ProjectRelease.projectInfoStruc stru = new cnbeiwpweb02v.ProjectRelease.projectInfoStruc();
        cnbeiwpweb02v.ProjectRelease.updateProjectRequestBody ibody = new updateProjectRequestBody(stru);

        ibody.projectInfo.projectNo = pr.ProposalNo;
        ibody.projectInfo.projectName = pr.ProposalName;
        ibody.projectInfo.client = pr.NamesOfImmediateClientOrOwner;
        ibody.projectInfo.Status = pr.Status;
        ibody.projectInfo.Manager = pr.ProposalManager;
        ibody.projectInfo.Entity = "entity";
        ibody.projectInfo.Type = "type";
        ibody.projectInfo.Category = "category";
        ibody.projectInfo.Classification = "classification";
        ibody.projectInfo.HSE_Category = "hsecategory";
        ibody.projectInfo.BusinessLine = "businessline";
        ibody.projectInfo.Scope = "scope";
        ibody.projectInfo.Location = pr.Location;
        ibody.projectInfo.Start_Date = null;
        ibody.projectInfo.End_Date = null; ;
        ibody.projectInfo.Total_MHs = pr.HOMH;
        ibody.projectInfo.Office = pr.Office;

        cnbeiwpweb02v.ProjectRelease.updateProjectRequest ireq = new updateProjectRequest(ibody);
        soap.updateProject(ireq);
    }
    else
    {
        // 项目号不存在
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Proposal No. not exist.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
%>


