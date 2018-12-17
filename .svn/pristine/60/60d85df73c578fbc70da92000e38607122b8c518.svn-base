using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// PaafHelper 的摘要说明
/// </summary>
public class PaafHelper
{
    public PaafHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static PaafDate GetPaafDate(string projectNo, string type, string wbs, int employeeId)
    {
        var paafDate = new PaafDate();
        var db = new PPPEntities();
        var item = db.TStaffingPlanDetailYearMonth.Where(x => x.ProjectNo == projectNo
            && x.Type == type && x.WBS == wbs && x.EmployeeId == employeeId);
        if (item.Any())
        {
            var max = 0;
            var min = 999999;
            foreach(var m in item)
            {
                if (m.YearMonth < min)
                {
                    min = m.YearMonth;
                }
                if (m.YearMonth > max)
                {
                    max = m.YearMonth;
                }
            }
            paafDate.StartDate = min;
            paafDate.StartYear = Convert.ToInt32(paafDate.StartDate.ToString().Substring(0, 4));
            paafDate.StartMonth = Convert.ToInt32(paafDate.StartDate.ToString().Substring(4, 2));
            paafDate.EndDate = max;
            paafDate.EndYear = Convert.ToInt32(paafDate.EndYear.ToString().Substring(0, 4));
            paafDate.EndMonth = Convert.ToInt32(paafDate.EndYear.ToString().Substring(4, 2));
        }
        return paafDate;
    }

    public void SyncPaaf(string projectNo, string type)
    {
        var db = new PPPEntities();
        var items = db.TStaffingPlanDetail.Where(x => x.ProjectNo == projectNo && x.Type == type);
        foreach(var item in items)
        {
            var employeeId = item.EmployeeId;
            var hourByPerson = item.HourByPerson;
            decimal? sellingRate = 0;
            var position = "";
            var ppl = db.TStaffingBasicInfo.FirstOrDefault(x => x.EmployeeId == employeeId);
            if (ppl != null)
            {
                sellingRate = ppl.SellingRate;
                position = ppl.Position;
            }
            if (!db.PAAF.Any(x=>x.ProjectNo == projectNo 
                    && x.Type == type 
                    && x.EmployeeId == employeeId 
                    && x.Position == position)){
                // 不存在，则追加
                var paaf = new PAAF();
                paaf.ProjectNo = projectNo;
                paaf.Type = type;
                paaf.Position = position;
                paaf.EmployeeId = employeeId;
                if (!db.PAAF.Any(x => x.ProjectNo == projectNo
                                    && x.Type == type))
                {
                    paaf.No = 1;
                }
                else
                {
                    paaf.No = Convert.ToInt32(db.PAAF.Max(x => x.ProjectNo == projectNo && x.Type == type)) + 1;
                }
            }
            else
            {
                // 存在，则更新
            }
        }

    }
}

public class PaafDate
{
    public int StartDate;
    public int StartYear;
    public int StartMonth;
    public int EndDate;
    public int EndYear;
    public int EndMonth;
}