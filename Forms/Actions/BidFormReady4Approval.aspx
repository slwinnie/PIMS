﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<%
    var db = new PPPEntities();
    var iProjectId = Convert.ToInt32(Request["ProjectId"]);
    var iSubId = Convert.ToInt32(Request["SubId"]);
    var item = db.TProposalX.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
    if (item != null)
    {
        var bidForm = db.BIDForm.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId);
        var iEmployeeId = -1;
        if (bidForm != null)
        {
            if (bidForm.t69 != string.Empty)
            {
                iEmployeeId = Convert.ToInt32(bidForm.t69);
            }
            else if (bidForm.t67 != string.Empty)
            {
                iEmployeeId = Convert.ToInt32(bidForm.t67);
            }
            else if (bidForm.t65 != string.Empty)
            {
                var people = db.TPeople.FirstOrDefault(x => x.Email == bidForm.t65);
                if (people != null)
                {
                    iEmployeeId = people.EmployeeId;
                }
                else
                {
                    // System error.
                }
                //iEmployeeId = Convert.ToInt32(bidForm.t65);
            }
            else if (bidForm.t63 != string.Empty)
            {
                iEmployeeId = Convert.ToInt32(bidForm.t63);
            }
            else if (bidForm.t61 != string.Empty)
            {
                iEmployeeId = Convert.ToInt32(bidForm.t61);
            }
            else if (bidForm.t59 != string.Empty)
            {
                iEmployeeId = Convert.ToInt32(bidForm.t59);
            }
            else if (bidForm.t57 != string.Empty)
            {
                iEmployeeId = Convert.ToInt32(bidForm.t57);
            }
            var ppr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
            if (ppr == null)
            {
                ppr = new TApproval();
                ppr.ProjectId = iProjectId;
                ppr.SubId = iSubId;
                ppr.EmployeeId = iEmployeeId;
                ppr.FormType = "Bid";
                ppr.CreatedDate = DateTime.Now;
                ppr.Status = "New";

                db.TApproval.Add(ppr);
            }
            item.BidSubmitDate = DateTime.Now;
            bidForm.SubmitBy = SystemHelper.GetUserName(SystemHelper.DomainUserName());

            #region Send Email

            var sys = db.SystemEMail.First();
            var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
            if (acc != null)
            {
                var emialTo = acc.Email;
                var subject = string.Format("Approval/Submission Reminder for {0} BID/NOBID", iProjectId);
                var loginUrl = string.Format("{0}://{1}:{2}{3}?employeeId={4}", Request.Url.Scheme, Request.Url.Host, Request.Url.Port, string.Format("{0}Default.aspx", ResolveUrl("~")), ppr.EmployeeId);
                var emailContent = string.Format("<p>BID/NOBID Form for project {0} is ready for approval. Please click <a href='{1}' target='_blank'>here</a>.</p><p style='color:gray;'>This is a system generated email from PIMs Online. Please do not reply to this email. </p>", iProjectId, loginUrl);

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

%>