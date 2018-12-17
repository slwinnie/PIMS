<%@ Page Language="C#" %>
<%@ Import Namespace="cnbeiwpweb02v.ProjectRelease" %>
<%
    // 判断项目号是否存在
    cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoap soap = new cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoapClient();
    checkProjectNoRequest p = new checkProjectNoRequest();

    var crmtId = Request["crmtid"];
    var db = new PPPEntities();
    var pr = db.TProjectRegister.FirstOrDefault(x => x.CRMTID == crmtId);
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

    p.Body = new checkProjectNoRequestBody(pr.ProjectNo);
    var rst = soap.checkProjectNo(p);
    if (!rst.Body.checkProjectNoResult)
    {
        // 项目号已经存在
        cnbeiwpweb02v.ProjectRelease.projectInfoStruc stru = new cnbeiwpweb02v.ProjectRelease.projectInfoStruc();
        cnbeiwpweb02v.ProjectRelease.updateProjectRequestBody ibody = new updateProjectRequestBody(stru);
        var iProjectId = Convert.ToInt32(crmtId);
        var proj = db.TProject.FirstOrDefault(x => x.ProjectId == iProjectId);
        if (proj != null)
        {
            ibody.projectInfo.BusinessLine = proj.BusinessLine;
        }
        ibody.projectInfo.projectNo = pr.ProjectNo;
        ibody.projectInfo.projectName = pr.ProjectName;
        ibody.projectInfo.client = pr.ClientName;
        ibody.projectInfo.Status = pr.ProjectStatus;
        ibody.projectInfo.Manager = pr.PM;
        ibody.projectInfo.Entity = pr.TSEntity;
        ibody.projectInfo.Type = pr.Type;
        ibody.projectInfo.Category = pr.TSCategory;
        ibody.projectInfo.Classification = pr.TSClassification;
        ibody.projectInfo.HSE_Category = pr.TSHSECategory;
        ibody.projectInfo.Scope = pr.Sow;
        ibody.projectInfo.Location = pr.ProjectLocation;
        ibody.projectInfo.Start_Date = StringHelper.FmtDate(pr.StartDate);
        ibody.projectInfo.End_Date = StringHelper.FmtDate(pr.EndDate); ;
        ibody.projectInfo.Total_MHs = pr.Manhours;
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
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Project exist.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
%>


