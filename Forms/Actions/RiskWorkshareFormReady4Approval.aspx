<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<%
    var db = new PPPEntities();
    var iProjectId = Convert.ToInt32(Request["ProjectId"]);
    var iSubId = Convert.ToInt32(Request["SubId"]);

    var item = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
    if (item != null)
    {
        item.RiskSubmitDate = DateTime.Now;
        item.Status = "Pendding";
        var riskForm = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.type == "2");
        var iEmployeeId = -1;
        if (riskForm != null)
        {
            riskForm.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
            iEmployeeId = Convert.ToInt32(riskForm.t11);
            var ppr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.EmployeeId == iEmployeeId && x.FormType == "RiskWS");
            if (ppr == null)
            {
                ppr = new TApproval();
                ppr.ProjectId = iProjectId;
                ppr.SubId = iSubId;
                ppr.EmployeeId = iEmployeeId;
                ppr.FormType = "RiskWS";
                ppr.CreatedDate = DateTime.Now;
                ppr.Status = "New";
                db.TApproval.Add(ppr);
            }
            else
            {
                ppr.CreatedDate = DateTime.Now;
                ppr.Status = "New";
            }
            riskForm.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
            #region Send Email

            var sys = db.SystemEMail.First();
            var plp = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
            var emialTo = plp.Email;
            var subject = string.Format("Approval/Submission Reminder for {0} Risk", iProjectId);
            var loginUrl = string.Format("{0}://{1}:{2}{3}?employeeId={4}", Request.Url.Scheme, Request.Url.Host, Request.Url.Port, string.Format("{0}Default.aspx", ResolveUrl("~")), iEmployeeId);
            var emailContent = string.Format("<p>Risk Form for project {0} is ready for approval. Please click <a href='{1}' target='_blank'>here</a>.</p><p style='color:gray;'>This is a system generated email from PIMs Online. Please do not reply to this email. </p>", iProjectId, loginUrl);

            var strSmtpServer = sys.Smtp;
            var strFrom = sys.Sender;
            var strFromPass = sys.Password;
            var strTo = emialTo;
            var strSubject = subject;
            var strBody = emailContent;

            var client = new SmtpClient(strSmtpServer);
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;

            var message = new MailMessage(strFrom, strTo, strSubject, strBody);
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            client.Send(message);

            #endregion
        }

        db.SaveChanges();
    }
%>