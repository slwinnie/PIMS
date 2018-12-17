using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;

/// <summary>
/// BidApprovalHelper 的摘要说明
/// </summary>
public class BidApprovalHelper
{
	public BidApprovalHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static void GetBidFormNextAppover(string pProjectId, string pSubId, string meId, Page page)
    {
        var db = new PPPEntities();
        var iPprojectId = Convert.ToInt32(pProjectId);
        var iPsubId = Convert.ToInt32(pSubId);
        var frm = db.BIDForm.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId);
        var iEmployeeId = 0;
        ;
        if (frm != null)
        {
            #region Init
            var lst = new BidFormBlock[7];
            var pos = 0;
            if (!string.IsNullOrEmpty(frm.t69))
            {
                iEmployeeId = Convert.ToInt32(frm.t69);
                var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
                lst[pos] = new BidFormBlock();
                lst[pos].Checked = frm.c78 == "true";
                lst[pos].EmployeeId = iEmployeeId;
                if (appr != null)
                {
                    lst[pos].Status = appr.Status;
                }
                pos++;
            }
            if (!string.IsNullOrEmpty(frm.t67))
            {
                iEmployeeId = Convert.ToInt32(frm.t67);
                var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
                lst[pos] = new BidFormBlock();
                lst[pos].Checked = frm.c74 == "true";
                lst[pos].EmployeeId = iEmployeeId;
                if (appr != null)
                {
                    lst[pos].Status = appr.Status;
                }
                pos++;
            }

            if (!string.IsNullOrEmpty(frm.t65))
            {
                iEmployeeId = Convert.ToInt32(frm.t65);
                var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
                lst[pos] = new BidFormBlock();
                lst[pos].Checked = frm.c70 == "true";
                lst[pos].EmployeeId = iEmployeeId;
                if (appr != null)
                {
                    lst[pos].Status = appr.Status;
                }
                pos++;
            }
            if (!string.IsNullOrEmpty(frm.t63))
            {
                iEmployeeId = Convert.ToInt32(frm.t63);
                var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
                lst[pos] = new BidFormBlock();
                lst[pos].Checked = frm.c66 == "true";
                lst[pos].EmployeeId = iEmployeeId;
                if (appr != null)
                {
                    lst[pos].Status = appr.Status;
                }
                pos++;
            }
            if (!string.IsNullOrEmpty(frm.t61))
            {
                iEmployeeId = Convert.ToInt32(frm.t61);
                var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
                lst[pos] = new BidFormBlock();
                lst[pos].Checked = frm.c62 == "true";
                lst[pos].EmployeeId = iEmployeeId;
                if (appr != null)
                {
                    lst[pos].Status = appr.Status;
                    pos++;
                }
            }
            if (!string.IsNullOrEmpty(frm.t59))
            {
                iEmployeeId = Convert.ToInt32(frm.t59);
                var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
                lst[pos] = new BidFormBlock();
                lst[pos].Checked = frm.c58 == "true";
                lst[pos].EmployeeId = iEmployeeId;
                if (appr != null)
                {
                    lst[pos].Status = appr.Status;
                }
                pos++;
            }
            if (!string.IsNullOrEmpty(frm.t57))
            {
                iEmployeeId = Convert.ToInt32(frm.t57);
                var appr = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.EmployeeId == iEmployeeId && x.FormType == "Bid");
                lst[6] = new BidFormBlock();
                lst[6].Checked = frm.c54 == "true";
                lst[6].EmployeeId = iEmployeeId;
                if (appr != null)
                {
                    lst[6].Status = appr.Status;
                }
                pos++;
            }
            #endregion

            var iMeId = Convert.ToInt32(meId);
            var index = -1;
            for (var i = 0; i < lst.Length; i++)
            {
                if (lst[i] != null && lst[i].Status != "Approved" && lst[i].EmployeeId != iMeId)
                {
                    index = i;
                    break;
                }
            }
            if (index >= 0)
            {
                // 还需要领导批复
                var item = lst[index];
                var v = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.FormType == "Bid" && x.EmployeeId == item.EmployeeId);
                if (v == null)
                {
                    // Insert data to tapproval
                    v = new TApproval();
                    v.EmployeeId = item.EmployeeId;
                    v.Status = "New";
                    v.ProjectId = iPprojectId;
                    v.SubId = iPsubId;
                    v.FormType = "Bid";
                    v.CreatedDate = DateTime.Now;
                    db.TApproval.Add(v);
                }
                else
                {
                    v.Status = "New";
                    v.CreatedDate = DateTime.Now;
                }
                var plp = db.TAccount.FirstOrDefault(x => x.EmployeeId == v.EmployeeId);

                var myStatus = db.TApproval.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId && x.FormType == "Bid" && x.EmployeeId == iMeId);
                if (myStatus != null)
                {
                    myStatus.ApprovedDate = DateTime.Now;
                }
                db.SaveChanges();

                #region Send Email

                var sys = db.SystemEMail.First();

                var emialTo = plp.Email;
                var subject = string.Format("Approval/Submission Reminder for {0} BID/NOBID", iPprojectId);
                var loginUrl = string.Format("{0}://{1}:{2}{3}", page.Request.Url.Scheme, page.Request.Url.Host, page.Request.Url.Port, string.Format("{0}Default.aspx", page.ResolveUrl("~")));
                var emailContent = string.Format("<p>BID/NOBID Form for project {0} is ready for approval. Please click <a href='{1}' target='_blank'>here</a>.</p><p style='color:gray;'>This is a system generated email from PIMs Online. Please do not reply to this email. </p>", iPprojectId, loginUrl);
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
            else
            {
                // 批复完成
                var f = db.TProposalX.FirstOrDefault(x => x.ProjectId == iPprojectId && x.SubId == iPsubId);
                var p = db.TPeople.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
                if (f != null && p != null)
                {
                    f.BidApproveDate = DateTime.Now;
                    db.SaveChanges();
                }
            }
        }
    }
}

class BidFormBlock
{
    public bool Checked;
    public int EmployeeId;
    public string Status;
}