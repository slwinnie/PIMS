<%@ Page Language="C#" %>
<%
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];
    var wbs = Request["WBS"];
    var employeeId = Request["NewEmployee"];
    var iemployeeId = Convert.ToInt32(Request["NewEmployee"]);
    var db = new PPPEntities();
    var staffPlanDetail = new TStaffingPlanDetail();

    staffPlanDetail.ProjectNo = projectNo;
    staffPlanDetail.Type = type;
    staffPlanDetail.WBS = wbs;
    staffPlanDetail.Position = Request["newPosition"];
    staffPlanDetail.EmployeeId = Convert.ToInt32(employeeId);

    db.TStaffingPlanDetail.Add(staffPlanDetail);
    if (db.TStaffingPlanDetail.Any(x => x.ProjectNo == projectNo
                                        && x.Type == type
                                        && x.WBS == wbs))
    {
        staffPlanDetail.No = db.TStaffingPlanDetail.Where(x => x.ProjectNo == projectNo
                                          && x.Type == type
                                          && x.WBS == wbs).Max(x => x.No) + 1;
    }
    else
    {
        staffPlanDetail.No = 1;
    }

    var lst = StaffingPlanHelper.GetYearMonthListNum(projectNo);

    foreach (var s in lst)
    {
        var item = new TStaffingPlanDetailYearMonth();
        item.ProjectNo = projectNo;
        item.Type = type;
        item.WBS = wbs;
        item.EmployeeId = Convert.ToInt32(employeeId);
        item.YearMonth = s;
        var val = Request[string.Format("new{0}", item.YearMonth)];
        item.YearMonthValue = string.IsNullOrEmpty(val) ? (decimal?)0 : Convert.ToDecimal(val);
        db.TStaffingPlanDetailYearMonth.Add(item);
    }
  
    try
    {
        db.SaveChanges();

        #region 汇总员工总工时
        var sum = db.TStaffingPlanDetailYearMonth.Where(x => x.ProjectNo == projectNo
                                                     && x.Type == type
                                                     && x.WBS == wbs
                                                     && x.EmployeeId == iemployeeId).Sum(x => x.YearMonthValue);
        if (sum != null)
        {
            staffPlanDetail.HourByPerson = sum;
        }
        db.SaveChanges();  
        #endregion
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
    catch (Exception ex)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }

%>