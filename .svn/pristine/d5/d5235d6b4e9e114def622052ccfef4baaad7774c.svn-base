using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// StaffingPlanHelper 的摘要说明
/// </summary>
public class StaffingPlanHelper
{
	public StaffingPlanHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    private static List<string> GetYearMonthList(DateTime? start, DateTime? end)
    {
        var lst = new List<string>();
        if (start == null || end == null)
        {
            return new List<string>();
        }

        var currDate = (DateTime)start;
        var endDate = (DateTime)end;
        var maxCol = 1000;
        var index = 0;
        var curNum = currDate.Year * 100 + Convert.ToInt32(currDate.Month.ToString().PadLeft(2, '0'));
        var endNum = endDate.Year * 100 + Convert.ToInt32(endDate.Month.ToString().PadLeft(2, '0'));

        while (curNum <= endNum && index < maxCol)
        {
            lst.Add(string.Format("{0}/{1:D2}", currDate.Year, currDate.Month));
            currDate = currDate.AddMonths(1);
            curNum = currDate.Year * 100 + Convert.ToInt32(currDate.Month.ToString().PadLeft(2, '0'));

            index++;
        }

        return lst;
    }

    public static List<string> GetYearMonthList(string projectNo)
    {
        var db = new PPPEntities();
        var projInfo = db.TProjectBasicInfo.FirstOrDefault(x => x.ProjectNo == projectNo);
        if (projInfo != null)
        {
            try
            {
                return GetYearMonthList(projInfo.StartDate, projInfo.EndDate);
            }
            catch (Exception)
            {
                return new List<string>();
            }
        }
        else
        {
            return new List<string>();
        }

    }

    private static List<int> GetYearMonthListNum(DateTime? start, DateTime? end)
    {
        var lst = new List<int>();
        if (start == null || end == null)
        {
            return new List<int>();
        }

        var currDate = (DateTime)start;
        var endDate = (DateTime)end;
        var maxCol = 1000;
        var index = 0;
        var curNum = currDate.Year * 100 + Convert.ToInt32(currDate.Month.ToString().PadLeft(2, '0'));
        var endNum = endDate.Year * 100 + Convert.ToInt32(endDate.Month.ToString().PadLeft(2, '0'));

        while (curNum <= endNum && index < maxCol)
        {
            lst.Add(Convert.ToInt32(string.Format("{0}{1:D2}", currDate.Year, currDate.Month)));
            currDate = currDate.AddMonths(1);
            curNum = currDate.Year * 100 + Convert.ToInt32(currDate.Month.ToString().PadLeft(2, '0'));

            index++;
        }

        return lst;
    }

    public static List<int> GetYearMonthListNum(string projectNo)
    {
        var db = new PPPEntities();
        var projInfo = db.TProjectBasicInfo.FirstOrDefault(x => x.ProjectNo == projectNo);
        if (projInfo != null)
        {
            try
            {
                return GetYearMonthListNum(projInfo.StartDate, projInfo.EndDate);
            }
            catch (Exception)
            {
                return new List<int>();
            }
        }
        else
        {
            return new List<int>();
        }
    }

    private static List<CYearMonth> GetYearMonthListMix(DateTime? start, DateTime? end)
    {
        var lst = new List<CYearMonth>();
        if (start == null || end == null)
        {
            return new List<CYearMonth>();
        }

        var currDate = (DateTime)start;
        var endDate = (DateTime)end;
        var maxCol = 1000;
        var index = 0;
        var curNum = currDate.Year * 100 + Convert.ToInt32(currDate.Month.ToString().PadLeft(2, '0'));
        var endNum = endDate.Year * 100 + Convert.ToInt32(endDate.Month.ToString().PadLeft(2, '0'));

        while (curNum <= endNum && index < maxCol)
        {
            lst.Add(new CYearMonth(){
                NValue = Convert.ToInt32(string.Format("{0}{1:D2}", currDate.Year, currDate.Month)),
                SValue = string.Format("{0}/{1:D2}", currDate.Year, currDate.Month)});
            currDate = currDate.AddMonths(1);
            curNum = currDate.Year * 100 + Convert.ToInt32(currDate.Month.ToString().PadLeft(2, '0'));

            index++;
        }

        return lst;
    }

    public static List<CYearMonth> GetYearMonthListMix(string projectNo)
    {
        var db = new PPPEntities();
        var projInfo = db.TProjectBasicInfo.FirstOrDefault(x => x.ProjectNo == projectNo);
        if (projInfo != null)
        {
            try
            {
                return GetYearMonthListMix(projInfo.StartDate, projInfo.EndDate);
            }
            catch (Exception)
            {
                return new List<CYearMonth>();
            }
        }
        else
        {
            return new List<CYearMonth>();
        }
    }

    public static void UpdatePlanDetailYearMonth(string projectNo)
    {
        var db = new PPPEntities();
        var type = "Project";
        var projInfo = db.TProjectBasicInfo.FirstOrDefault(x => x.ProjectNo == projectNo);
        if (projInfo != null)
        {
            var lst = GetYearMonthListMix(projInfo.StartDate, projInfo.EndDate);
            var wbsList = (from x in db.TStaffingPlan.Where(x => x.ProjectNo == projectNo && x.Type == "Project")
                select x.WBS).Distinct().ToList();
            foreach (var wbs in wbsList)
            {
                var wbs1 = wbs;
                var empLst = (from x in db.TStaffingPlanDetail.Where(x => x.ProjectNo == projectNo
                                && x.Type == type
                                && x.WBS == wbs1)
                              select x.EmployeeId
                             ).Distinct().ToList();
                foreach (var employeeId in empLst)
                {
                    foreach (var ym in lst)
                    {
                        if (!db.TStaffingPlanDetailYearMonth.Any(x => x.ProjectNo == projectNo
                                && x.Type == type
                                && x.WBS == wbs1 && x.EmployeeId == employeeId
                                && x.YearMonth == ym.NValue))
                        {
                            var row = new TStaffingPlanDetailYearMonth
                            {
                                ProjectNo = projectNo,
                                Type = type,
                                WBS = wbs,
                                EmployeeId = employeeId,
                                YearMonth = ym.NValue,
                                YearMonthValue = 0
                            };
                            db.TStaffingPlanDetailYearMonth.Add(row);
                        }
                    }
                }
            }
            db.SaveChanges();
        }
    }
}

public class CYearMonth
{
    public string SValue = "";
    public int NValue = 0;
}