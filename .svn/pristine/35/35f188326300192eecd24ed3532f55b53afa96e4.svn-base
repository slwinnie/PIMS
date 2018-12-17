<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var projectNo = Request["ProjectNo"];
    var type = Request["Type"];
    var wbs = Request["WBS"];
    var employeeId = Convert.ToInt32(Request["editEmployee"]);
    var staffingPlanDetail = db.TStaffingPlanDetail.FirstOrDefault(x => x.ProjectNo == projectNo 
        && x.Type == type 
        && x.WBS == wbs
        && x.EmployeeId == employeeId);
    if (staffingPlanDetail != null)
    {
        var lst = StaffingPlanHelper.GetYearMonthListNum(projectNo);

        foreach (var s in lst)
        {
            var yearMonth = db.TStaffingPlanDetailYearMonth.FirstOrDefault(x => x.ProjectNo == projectNo
                && x.Type == type
                && x.WBS == wbs
                && x.EmployeeId == employeeId
                && x.YearMonth == s
                );
            if (yearMonth != null)
            {
               var val = Request[string.Format("edit{0}", s)];
               yearMonth.YearMonthValue = Convert.ToDecimal(val);
            }
            else
            {
                var item = new TStaffingPlanDetailYearMonth();
                item.ProjectNo = projectNo;
                item.Type = type;
                item.WBS = wbs;
                item.EmployeeId = Convert.ToInt32(employeeId);
                item.YearMonth = s;
                var val = Request[string.Format("edit{0}", item.YearMonth)];
                item.YearMonthValue = string.IsNullOrEmpty(val) ? (decimal?)0 : Convert.ToDecimal(val);
                db.TStaffingPlanDetailYearMonth.Add(item);
            }
        }
    }
    db.SaveChanges();
    #region 汇总员工总工时
    var sum = db.TStaffingPlanDetailYearMonth.Where(x => x.ProjectNo == projectNo
                                                 && x.Type == type
                                                 && x.WBS == wbs
                                                 && x.EmployeeId == employeeId
                                                 ).Sum(x => x.YearMonthValue);
    if (sum != null && staffingPlanDetail != null)
    {
        staffingPlanDetail.HourByPerson = sum;
    }
    db.SaveChanges();
    #endregion

    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());

%>