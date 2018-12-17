<%@ Page Language="C#" %>
<%
    var projectNo = Request["ProjectNo"].ToString();
    var type = Request["Type"].ToString();
    var db = new PPPEntities();
    if (!db.TProjectBasicInfo.Any(x => x.ProjectNo == projectNo && x.Type == type))
    {
        var pbInfo = new TProjectBasicInfo();
        pbInfo.ProjectNo = projectNo;
        pbInfo.Type = type;
        var p = db.TProjectRegister.FirstOrDefault(x => x.ProjectNo == projectNo);
        if (p != null)
        {
            pbInfo.StartDate = p.StartDate;
            pbInfo.EndDate = p.EndDate;
            pbInfo.ProjectName = p.ProjectName;
            pbInfo.Description = p.ProjectDescription;
            pbInfo.PM = p.PM;
            pbInfo.ClientName = p.ClientName;
            pbInfo.Office = p.Office;
            db.TProjectBasicInfo.Add(pbInfo);
            db.SaveChanges();
        }
    }
    Response.Redirect(string.Format("StaffingPlan.aspx?ProjectNo={0}&type={1}", projectNo, type));
    

%>