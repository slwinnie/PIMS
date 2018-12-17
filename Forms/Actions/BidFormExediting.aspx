<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<%
    var db = new PPPEntities();
    var iProjectId = Convert.ToInt32(Request["ProjectId"]);
    var iSubId = Convert.ToInt32(Request["SubId"]);
    var ppr = db.TApproval.FirstOrDefault(x => x.ProjectId == iProjectId && x.SubId == iSubId && x.Status == "New" && x.FormType == "Bid");
    
    #region Send Email
    if (ppr != null)
    {
        var sys = db.SystemEMail.First();
        var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == ppr.EmployeeId);
        if (acc != null)
        {
            var emialTo = acc.Email;
            var subject = string.Format("Approval/Submission Reminder for {0} BID/NOBID", iProjectId);
            var loginUrl = string.Format("{0}://{1}:{2}/{3}{4}?employeeId={5}", Request.Url.Scheme, Request.Url.Host, Request.Url.Port, ResolveUrl("~"), "default.aspx", ppr.EmployeeId);
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
    }
    #endregion
 %>