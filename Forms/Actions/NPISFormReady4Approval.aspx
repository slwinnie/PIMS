<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<%
    var db = new PPPEntities();
    var iProjectId = Convert.ToInt32(Request["ProjectId"]);
    var iSubId = Convert.ToInt32(Request["SubId"]);
    var type = Request["type"].ToString().Trim();
    if (type == "1")
    {
        var item = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (item != null)
        {
            //item.BidSubmitDate = DateTime.Now;
            var pp = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
            pp.NPISSubmitDate = DateTime.Now;
            pp.Status = "Pendding";

            var npisForm = db.NPISForm.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.type == type);
            var iEmployeeId = -1;
            if (npisForm != null)
            {
                iEmployeeId = Convert.ToInt32(npisForm.t39);
                var ppr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.EmployeeId == iEmployeeId && x.FormType == (type == "1" ? "Npis1" : "Npis2"));
                if (ppr == null)
                {
                    ppr = new TApproval();
                    ppr.ProjectId = iProjectId;
                    ppr.SubId = iSubId;
                    ppr.EmployeeId = iEmployeeId;
                    ppr.FormType = (type == "1" ? "Npis1" : "Npis2");
                    ppr.CreatedDate = DateTime.Now;
                    ppr.Status = "New";

                    db.TApproval.Add(ppr);
                }
                npisForm.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
                #region Send Email

                var sys = db.SystemEMail.First();
                var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
                if (acc != null)
                {
                    var emialTo = acc.Email;
                    var subject = string.Format("Approval/Submission Reminder for {0} NPIS", iProjectId);
                    var loginUrl = string.Format("{0}://{1}:{2}{3}?employeeId={4}", Request.Url.Scheme, Request.Url.Host, Request.Url.Port, string.Format("{0}Default.aspx", ResolveUrl("~")), iEmployeeId);
                    var emailContent = string.Format("<p>NPIS Form for project {0} is ready for approval. Please click <a href='{1}' target='_blank'>here</a>.</p><p style='color:gray;'>This is a system generated email from PIMs Online. Please do not reply to this email. </p>", iProjectId, loginUrl);

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
                }
                #endregion
            }

            db.SaveChanges();
        }
    }
    else
    {
        var item = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (item != null)
        {
            //item.BidSubmitDate = DateTime.Now;
            var pp = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
            pp.NPISSubmitDate = DateTime.Now;
            pp.Status = "Pendding";

            var npisForm = db.NPISForm.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.type == type);
            var iEmployeeId = -1;
            if (npisForm != null)
            {

                iEmployeeId = Convert.ToInt32(npisForm.t39);
                var ppr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.EmployeeId == iEmployeeId && x.FormType == (type == "1" ? "Npis1" : "Npis2"));
                if (ppr == null)
                {
                    ppr = new TApproval();
                    ppr.ProjectId = iProjectId;
                    ppr.SubId = iSubId;
                    ppr.EmployeeId = iEmployeeId;
                    ppr.FormType = (type == "1" ? "Npis1" : "Npis2");
                    ppr.CreatedDate = DateTime.Now;
                    ppr.Status = "New";

                    db.TApproval.Add(ppr);
                }
                npisForm.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
                #region Send Email

                var sys = db.SystemEMail.First();
                var plp = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
                var emialTo = plp.Email;
                var subject = string.Format("Approval/Submission Reminder for {0} NPIS", iProjectId);
                var loginUrl = string.Format("{0}://{1}:{2}{3}?employeeId={4}", Request.Url.Scheme, Request.Url.Host, Request.Url.Port, string.Format("{0}Default.aspx", ResolveUrl("~")), iEmployeeId);
                var emailContent = string.Format("<p>NPIS Form for project {0} is ready for approval. Please click <a href='{1}' target='_blank'>here</a>.</p><p style='color:gray;'>This is a system generated email from PIMs Online. Please do not reply to this email. </p>", iProjectId, loginUrl);

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
    }

%>
