<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="cnbeiwpweb02v.ProjectRelease" %>
<%@ Import Namespace="System.Net.Mail" %>
<%
    var _projectId = Convert.ToInt32(Request["projectId"]);
    var _subId = Convert.ToInt32(Request["SubId"]);

    var db = new PPPEntities();
    var pi = db.TProjectX.FirstOrDefault(x => x.ProjectId == _projectId && x.SubId == _subId);
    if (pi != null)
    {
        var item = db.TProjectRegister.FirstOrDefault(x => x.CRMTID == _projectId.ToString());
        if (item == null)
        {
            item = new TProjectRegister();
            item.CRMTID = _projectId.ToString();
            item.ProjectNo = Request["projectNo"];
            db.TProjectRegister.Add(item);
        }
        else
        {
            item.ProjectNo = Request["projectNo"];
        }

        item.CSG = Request["csg"];
        item.Year = Request["year"];
        item.Office = Request["office"];
        item.Phase = Request["phase"];
        item.SerialNo = Request["serialNo"];
        #region Check SerialNo
        {
            var fy = Convert.ToInt32(Request["year"]);
            var fs = db.TFYearSerial.FirstOrDefault(x => x.FYear == fy);
            var currNo = Convert.ToInt32(item.SerialNo);
            if (currNo != fs.NextSerialNo)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("{{");
                sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-6");
                sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "SerialNo is timeout.");
                sb.AppendFormat("}}");
                Response.Write(sb.ToString());
                return;
            }
        }
        #endregion
        item.ProposalNo = "";
        item.ClientName = Request["client"];
        item.ProjectName = pi.ProjectName;
        item.ProjectDescription = pi.ProjectDescription;
        item.Sow = Request["scope"];
        item.ProjectLocation = "";
        item.StartDate = string.IsNullOrEmpty(Request["startDate"].ToString()) ? (DateTime?)null : Convert.ToDateTime(Request["startDate"].ToString());
        item.EndDate = string.IsNullOrEmpty(Request["endDate"]) ? (DateTime?)null : Convert.ToDateTime(Request["endDate"]);
        item.ContractType = pi.ContractType;
        item.Type = Request["type"];
        item.ServiceType = ""; // Bid form.[WorleyParsons Scope]
        item.ContractHolder = "";
        var npis = db.NPISForm.FirstOrDefault(x=>x.ProjectId == _projectId && x.SubId == _subId);
        if (npis != null)
        {
            item.Currency = npis.t20;
            item.CV = npis.t19;
            item.ClientName = npis.t14;
            item.Sow = npis.t53;
            item.CRMTID = npis.t11;
            item.Workshare = Request["workshare"] == null ? "No" : Request["workshare"];
            item.ProjectSize = npis.t12;
            item.StartDate = npis.t1 == string.Empty ? (DateTime?)null : Convert.ToDateTime(npis.t1);
            item.EndDate = Convert.ToDateTime(Request["endDate"]);
        }
        else
        {
            // NPIS 丢失，理论不可能
            item.Currency = pi.ContractCurrency;
            item.CV = pi.WorleyParsonsCV;
        }

        item.ProjectSize = Request["classification"];
        item.PM = pi.ProjectManagerId.ToString();
        item.Risk = Request["riskClassification"];
        item.HSEResponsibility = "";
        item.ProjectInformation = "";
        item.AwardMonth = StringHelper.FmtDate(pi.AWardDate);
        item.CreatedBy = SystemHelper.GetUserName(SystemHelper.DomainUserName()).ToString();
        item.Modified = "";
        item.Created = StringHelper.FmtDate(DateTime.Now);
        item.Sponsor = "";
        item.ClosedDate = null;
        item.ProjectStatus = "";
        item.Manhours = Request["totalManhours"];
        item.Workshare = "No";
        item.FinalCV = ""; // Get From TimeSheetSystem.
        item.RegisteredDate = DateTime.Now;
        item.CustomerContactName = "";
        item.TelNo = "";
        item.ItemType = "";
        var b = db.BIDForm.FirstOrDefault(x=>x.ProjectId == _projectId && x.SubId == _subId);
        if (b != null)
        {
            var val = "";
            if (b.c3 == "true")
            {
                val = "Study";
            }
            else if (b.c4 == "true")
            {
                val = "E";
            }
            else if (b.c5 == "true")
            {
                val = "P";
            }
            else if (b.c6 == "true")
            {
                val = "EP";
            }
            else if (b.c7 == "true")
            {
                val = "EPCM";
            }
            else if (b.c8 == "true")
            {
                val = "C";
            }
            else if (b.c9 == "true")
            {
                val = "CM";
            }
            else if (b.c10 == "true")
            {
                val = "PCM";
            }
            item.ServiceType = val;
        }
        db.SaveChanges();
        // 更新TProjectX.ProjectNo
        var p = db.TProjectX.FirstOrDefault(x=>x.ProjectId == _projectId && x.SubId == _subId);
        if (p != null)
        {
            p.ProjectNo = Request["projectNo"];
        }
        try
        {
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-7");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
            return;
        }

        #region Release to timesheet system
        var crmtId = Request["projectId"];
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

        // 判断项目号是否存在
        cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoap soap = new cnbeiwpweb02v.ProjectRelease.TS_ProjectInformationSoapClient();
        checkProjectNoRequest pc = new checkProjectNoRequest();
        pr.ProjectNo = Request["projectNo"];
        pc.Body = new checkProjectNoRequestBody(pr.ProjectNo);
        var rst = soap.checkProjectNo(pc);
        if (!rst.Body.checkProjectNoResult)
        {
            // 项目号已经存在
            //Response.Write("<script>alert('Project exist.');</script>");
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "The serials number is exist already. Please click Autogeneration to generate the lastest serial no.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
        else
        {
            // 项目号不存在
            cnbeiwpweb02v.ProjectRelease.projectInfoStruc stru = new cnbeiwpweb02v.ProjectRelease.projectInfoStruc();
            cnbeiwpweb02v.ProjectRelease.insertProjectRequestBody ibody = new insertProjectRequestBody(stru);

            ibody.projectInfo.projectNo = Request["projectNo"];
            ibody.projectInfo.projectName = Request["projectName"];
            ibody.projectInfo.client = Request["client"];
            ibody.projectInfo.Status = Request["projectStatus"];
            ibody.projectInfo.Manager = Request["managerId"];
            ibody.projectInfo.Entity = Request["entity"];
            ibody.projectInfo.Type = Request["type"];
            ibody.projectInfo.Category = Request["category"];
            ibody.projectInfo.Classification = Request["classification"];
            ibody.projectInfo.Risk_Classification = Request["riskClassification"];
            ibody.projectInfo.HSE_Category = Request["hseClassification"];
            ibody.projectInfo.BusinessLine = Request["businessLine"];
            ibody.projectInfo.Scope = Request["scope"];
            ibody.projectInfo.Location = Request["location"];
            ibody.projectInfo.Start_Date = Request["startDate"];
            ibody.projectInfo.End_Date = Request["endDate"];
            ibody.projectInfo.Total_MHs = Request["totalManhours"];
            ibody.projectInfo.Office = Request["office"];

            cnbeiwpweb02v.ProjectRelease.insertProjectRequest ireq = new insertProjectRequest(ibody);
            soap.insertProject(ireq);
            try
            {
                // 判断项目号是否存在
                checkProjectNoRequest pno = new checkProjectNoRequest();
                pno.Body = new checkProjectNoRequestBody(Request["projectNo"].ToString());
                var rst2 = soap.checkProjectNo(pno);
                if (!rst2.Body.checkProjectNoResult)
                {
                    // 项目号已经存在
                    // 插入项目号成功！

                    // 修改状态
                    var projInfo = db.TProject.FirstOrDefault(x => x.ProjectId == _projectId);
                    if (projInfo != null)
                    {
                        projInfo.Status = "Project in excution";
                        projInfo.StatusDate = DateTime.Now;
                    }
                    db.SaveChanges();

                    #region 修改NextSerialNo
                    var fy = Convert.ToInt32(Request["year"].ToString());
                    var fs = db.TFYearSerial.FirstOrDefault(x => x.FYear == fy);
                    if (fs != null)
                    {
                        fs.NextSerialNo = fs.NextSerialNo + 1;
                        db.SaveChanges();
                    }
                    #endregion
                    #region Send Email to releation people groups
                    try
                    {
                        var sys = db.SystemEMail.First();
                        var emailReciver = db.SystemEmailReciver.First();
                        var subject = string.Format("Open project successful. Project No.- {0}", Request["projectNo"]);
                        var loginUrl = string.Format("{0}://{1}:{2}{3}", Request.Url.Scheme, Request.Url.Host, Request.Url.Port, string.Format("{0}Default.aspx", ResolveUrl("~")));
                        var emailContent = string.Format("<p>Open project successful. Project No.:{0}, Project Name:{1}.</p><p style='color:gray;'>This is a system generated email from <a href='{2}'>PIMs</a> Online. Please do not reply to this email. </p>", Request["projectNo"], Request["projectName"], loginUrl);

                        var strSmtpServer = sys.Smtp;
                        var strFrom = sys.Sender;
                        var strFromPass = sys.Password;
                        var strTo = emailReciver.EmailTo;
                        var strSubject = subject;
                        var strBody = emailContent;
                        var strCc = emailReciver.CC.Trim();
                        var client = new SmtpClient(strSmtpServer);
                        client.UseDefaultCredentials = false;
                        client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        var message = new MailMessage(strFrom, strTo, strSubject, strBody);
                        message.BodyEncoding = Encoding.UTF8;
                        if (!string.IsNullOrEmpty(strCc))
                        {
                            var arrCC = strCc.Split(';');
                            foreach(var cc in arrCC)
                            {
                                if (!string.IsNullOrEmpty(cc.Trim()))
                                {
                                    message.CC.Add(cc.Trim());
                                }
                            }
                        }
                        message.IsBodyHtml = true;
                        client.Send(message);
                    }
                    catch(Exception ex2)
                    {

                    }
                    #endregion

                    var sb = new StringBuilder();
                    sb.AppendFormat("{{");
                    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
                    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Release Successful.");
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
                    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Release failed.");
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
        #endregion
    }
    else
    {
        // system error.
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-5");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "System Error.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    return;
%>
