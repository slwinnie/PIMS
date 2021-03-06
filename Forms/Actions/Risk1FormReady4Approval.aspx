﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<%
    var db = new PPPEntities();
    var iProjectId = Convert.ToInt32(Request["ProjectId"]);
    var iSubId = Convert.ToInt32(Request["SubId"]);
    var type = Request["type"].ToString();
    if (type == "1")
    {
        var item = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (item != null)
        {
            var riskForm = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.type == type);
            var iEmployeeId = -1;
            if (riskForm != null)
            {
                // Proposal stage
                if (!string.IsNullOrEmpty(riskForm.t5))
                {
                    iEmployeeId = Convert.ToInt32(riskForm.t5);
                    var L1 = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.EmployeeId == iEmployeeId && x.FormType == (type == "1" ? "Risk1" : "Risk2"));
                    if (L1 == null)
                    {
                        L1 = new TApproval();
                        L1.ProjectId = iProjectId;
                        L1.SubId = iSubId;
                        L1.EmployeeId = iEmployeeId;
                        L1.FormType = (type == "1" ? "Risk1" : "Risk2");
                        L1.CreatedDate = DateTime.Now;
                        L1.Status = "New";
                        db.TApproval.Add(L1);
                        item.RiskSubmitDate = DateTime.Now;
                    }
                    else
                    {
                        L1.Status = "New";
                    }
                    db.SaveChanges();
                }
                else
                {
                    // system error.
                }
                riskForm.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
            }
            #region Send Email

            if (iEmployeeId != -1)
            {
                var sys = db.SystemEMail.First();
                var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
                if (acc != null)
                {
                    var emialTo = acc.Email;

                    var subject = string.Format("Approval/Submission Reminder for {0} RISK", iProjectId);
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
                }
            }

            #endregion

            db.SaveChanges();
        }
    }
    else
    {
        var item = db.TProjectX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        if (item != null)
        {
            var riskForm = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.type == type);
            var iEmployeeId = -1;

            if (riskForm != null)
            {
                // Project award
                if (!string.IsNullOrEmpty(riskForm.t9))
                {
                    iEmployeeId = Convert.ToInt32(riskForm.t9);
                    var L2 = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.EmployeeId == iEmployeeId && x.FormType == (type == "1" ? "Risk1" : "Risk2"));
                    if (L2 == null)
                    {
                        L2 = new TApproval();
                        L2.ProjectId = iProjectId;
                        L2.SubId = iSubId;
                        L2.EmployeeId = iEmployeeId;
                        L2.FormType = (type == "1" ? "Risk1" : "Risk2");
                        L2.CreatedDate = DateTime.Now;
                        L2.Status = "New";
                        db.TApproval.Add(L2);
                        item.RiskSubmitDate = DateTime.Now;
                    }
                    else
                    {
                        L2.Status = "New";
                        item.RiskSubmitDate = DateTime.Now;
                    }
                    db.SaveChanges();
                }
                else
                {
                    // system error.
                }
                riskForm.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());
            }

            #region Send Email

            if (iEmployeeId != -1)
            {
                var sys = db.SystemEMail.First();
                var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
                var emialTo = acc.Email;
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
            }

            #endregion

            db.SaveChanges();
        }
    }

     %>