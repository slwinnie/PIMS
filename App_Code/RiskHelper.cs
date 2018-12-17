using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.UI;
/// <summary>
/// RiskHelper 的摘要说明
/// </summary>
public class RiskHelper
{
    public RiskHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public const string RequiredKeyString = "FORMAL RISK MANAGEMENT is required";
    public static bool IsFormalRiskManagementIsRequired(int projectId, int subId, string formType)
    {
        var db = new PPPEntities();
        var risk = db.RiskClassificationForm.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId && x.type == formType);
        if (risk != null)
        {
            return risk.r1.Contains(RequiredKeyString)
                || risk.r2.Contains(RequiredKeyString)
                || risk.r3.Contains(RequiredKeyString)
                || risk.r4.Contains(RequiredKeyString)
                || risk.r5.Contains(RequiredKeyString)
                || risk.r6.Contains(RequiredKeyString)
                || risk.r7.Contains(RequiredKeyString)
                || risk.r8.Contains(RequiredKeyString)
                || risk.r9.Contains(RequiredKeyString)
                || risk.r10.Contains(RequiredKeyString)
                || risk.r11.Contains(RequiredKeyString)
                || risk.r12.Contains(RequiredKeyString)
                || risk.r13.Contains(RequiredKeyString)
                || risk.r14.Contains(RequiredKeyString)
                || risk.r22.Contains(RequiredKeyString)
                || risk.r23.Contains(RequiredKeyString)
                || risk.r24.Contains(RequiredKeyString)
                ;
        }

        return false;
    }

    public static void SendEmailToRiskManager(int projectId, int subId, string formType)
    {
        if (IsFormalRiskManagementIsRequired(projectId, subId, formType))
        {
            var db = new PPPEntities();
            var projectNo = string.Empty;
            var projectName = string.Empty;
            if (formType == "1")
            {
                var pi = db.TProposalX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
                if (pi != null)
                {
                    projectNo = pi.ProposalNo;
                    projectName = pi.ProjectName;
                }
            }
            else
            {
                var pi = db.TProjectX.FirstOrDefault(x => x.ProjectId == projectId && x.SubId == subId);
                if (pi != null)
                {
                    projectNo = pi.ProjectNo;
                    projectName = pi.ProjectName;
                }
            }
            

            #region Send Email to releation people groups
            try
            {
                var sys = db.SystemEMail.First();
                var emailReciver = db.SystemRiskManagementEmail.FirstOrDefault();
                if (emailReciver != null)
                {
                    var subject = string.Format("FORMAL RISK MANAGEMENT is required. Project No.- {0}", projectNo);
                    var loginUrl = string.Format("{0}://{1}:{2}{3}", HttpContext.Current.Request.Url.Scheme, HttpContext.Current.Request.Url.Host, HttpContext.Current.Request.Url.Port, string.Format("{0}Default.aspx", HttpContext.Current.Request.ApplicationPath));
                    var emailContent = string.Format("<p>FORMAL RISK MANAGEMENT is required. Project No.:{0}, Project Name:{1}.</p><p style='color:gray;'>This is a system generated email from <a href='{2}'>PIMs</a> Online. Please do not reply to this email. </p>", projectNo, projectName, loginUrl);

                    var strSmtpServer = sys.Smtp;
                    var strFrom = sys.Sender;
                    var strFromPass = sys.Password;
                    var strTo = emailReciver.RiskManagementEmail;
                    var strSubject = subject;
                    var strBody = emailContent;
                    var client = new SmtpClient(strSmtpServer);
                    client.UseDefaultCredentials = false;
                    client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    var message = new MailMessage(strFrom, strTo, strSubject, strBody);
                    message.BodyEncoding = System.Text.Encoding.UTF8;

                    message.IsBodyHtml = true;
                    client.Send(message);
                }
            }
            catch (Exception ex2)
            {

            }
            #endregion
        }
    }
}