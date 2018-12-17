using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// MPMHelper 的摘要说明
/// </summary>
public class MPMHelper
{
    public MPMHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static string FmtTitle(string title, int level)
    {
        var preText = new StringBuilder();
        for(var i = 0; i < level; i++)
        {
            preText.Append("--");
        }
        return string.Format("{0}{1}", preText, title);
    }

    /// <summary>
    /// 删除组织结构中的一个节点
    /// </summary>
    /// <param name="id"></param>
    /// <param name="db"></param>
    public static void DeleteThisAndChild(int id, PPPEntities db)
    {
        var acc = db.TOrganization.FirstOrDefault(x => x.OrganizationId == id);
        if (acc != null)
        {
            var children = db.TOrganization.Where(x => x.ParentId == id);
            foreach(var c in children)
            {
                DeleteThisAndChild(c.OrganizationId, db);
            }
            db.TOrganization.Remove(acc);
            db.TOrganizationPeoples.RemoveRange(db.TOrganizationPeoples.Where(x => x.OrganizationId == id));
        }
    }

    /// <summary>
    /// 取得指定财年的月份列表
    /// </summary>
    /// <param name="fy"></param>
    /// <returns></returns>
    public static List<string> FYearMonths(string fy)
    {
        var century = "20";
        var lst = new List<string>();
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy) - 1, "07"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy) - 1, "08"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy) - 1, "09"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy) - 1, "10"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy) - 1, "11"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy) - 1, "12"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy), "01"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy), "02"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy), "03"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy), "04"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy), "05"));
        lst.Add(string.Format("{0}{1}/{2}", century, Convert.ToInt32(fy), "06"));

        return lst;
    }

    /// <summary>
    /// 取得指定管理者的所有员工ID
    /// </summary>
    /// <param name="ownerEmpId"></param>
    /// <param name="lst"></param>
    /// <param name="db"></param>
    /// <returns></returns>
    public static List<EmpInfo> GetEmpInfos(int ownerEmpId, List<EmpInfo> lst, PPPEntities db)
    {

        lst.Clear();

        // 根据员工ID查询出对应的OrganizationId
        var row = GetOrganizationRow(ownerEmpId, db);
        var Ids = new List<OrganizationRow>();
        if (row != null)
        {
            GetSubIds(Ids, row.OrganizationId, db);
            foreach (var id in Ids)
            {
                var ps = db.TPeople.Where(x => x.OrganizationId == id.OrganizationId);
                foreach (var p in ps)
                {
                    if (!lst.Any(x => x.EmpId == p.EmployeeId))
                    {
                        var pi = GetProjectInfo(p.EmployeeId.ToString(), db);
                        lst.Add(new EmpInfo { EmpId = p.EmployeeId, EmpName = p.PeopleNameEn,
                            ProjectNos = pi.ProjectNos,
                            StartDate = pi.StartDate,
                            EndDate = pi.EndDate
                        });
                    }
                }
            }
        }

        return lst;
    }

    public static void GetSubIds(List<OrganizationRow> lst, int organizationId, PPPEntities db)
    {
        var subIds = db.TOrganization.Where(x => x.ParentId == organizationId);
        foreach (var item in subIds)
        {
            if (!lst.Any(x=>x.OrganizationId == item.OrganizationId))
            {
                lst.Add(new OrganizationRow { OrganizationId = item.OrganizationId, Title = item.Title });
            }
            GetSubIds(lst, item.OrganizationId, db);
        }
    }

    public static ProjectInfo GetProjectInfo(string empId, PPPEntities db)
    {
        var pi = new ProjectInfo();
        var sb = new StringBuilder();
        var minStartDate = DateTime.Now.AddYears(1000);
        var maxEndDate = DateTime.Now.AddYears(-1000);
        var lst = new List<string>();
        foreach (var p in db.TSProjectTotalHMs.Where(x => x.EmployeeId == empId))
        {
            if (!lst.Contains(p.ProjectNo))
            {
                sb.Append(p.ProjectNo + ",");
                lst.Add(p.ProjectNo);
            }
            var d = db.TProjectRegister.FirstOrDefault(x => x.ProjectNo == p.ProjectNo);
            if (d != null)
            {
                minStartDate = minStartDate > (DateTime)d.StartDate ? (DateTime)d.StartDate : minStartDate;
                maxEndDate = maxEndDate < (DateTime)d.EndDate ? (DateTime)d.EndDate : maxEndDate;
            }
        }
        if (sb.Length > 0) sb.Length--;
        pi.ProjectNos = sb.ToString();
        pi.StartDate = minStartDate.ToString();
        pi.EndDate = maxEndDate.ToString();
        return pi;
    }

    /// <summary>
    /// 中间表格::计算当前（财年，所有者，员工）的
    /// [Employee_ID, Employee_Name, OH_Budget, Up_to_now_Chargeability, Current_Chargeability, Project_Id, Project_No, Start_Date, End_Date]
    /// </summary>
    /// <param name="fy"></param>
    /// <param name="ownerEmpId"></param>
    /// <returns></returns>
    public static List<Grid2Row> GetEmpProjectInfoInFy(string fy, int ownerEmpId)
    {
        var lst = new List<Grid2Row>();
        var db = new PPPEntities();
        //db.TSProjectTotalHMs.Where(x=>x.)


        return null;
    }

    public static List<CurrentChargeability> GetCurrentChargeability(string fy, int ownerEmpId)
    {
        var db = new PPPEntities();
        var lst = new List<EmpInfo>();
        var rst = new List<CurrentChargeability>();
        GetEmpInfos(ownerEmpId, lst, db);
        var months = FYearMonths(fy);

        // select convert(nvarchar(50), DATEPART(yyyy, WeekEnding)) + right('0'+cast(DATEPART(mm, WeekEnding) as varchar) ,2) as FYMonth from TSProjectTotalHMs
        foreach (var m in months)
        {
            lst.Clear();
            GetEmpInfos(ownerEmpId, lst, db);
            foreach (var emp in lst)
            {
                var item = new CurrentChargeability();
                //item.Chargeability = 
            }
            

            
        }

        return null;
    }

    public static OrganizationRow GetOrganizationRow(int ownerEmpId, PPPEntities db)
    {
        var rtn = new OrganizationRow();
        var p = db.TPeople.FirstOrDefault(x => x.EmployeeId == ownerEmpId);
        if (p != null && p.OrganizationId != null)
        {
            rtn.OrganizationId = (int)p.OrganizationId;
            rtn.OwnerId = ownerEmpId;
            rtn.EmpName = p.PeopleNameEn;
            return rtn;
        }
        else
        {
            return null;
        }
    }

    public static List<Grid3Row> GetEmployeeMonthChargeability(string fy, int empId)
    {
        var lst = new List<Grid3Row>();
        var db = new PPPEntities();
        var ms = FYearMonths(fy);
        Func<DateTime, string> fmt = (d) =>
        {
            return string.Format("{0}/{1}", d.Year, d.Month.ToString().PadLeft(2, '0'));
        };
        var q = (from t in db.TSProjectTotalHMs
                    select new
                    {
                        t.EmployeeId,
                        t.ProjectType,
                        t.ProjectNo,
                        t.TotalMHs,
                        WE = t.WeekEnding.Year.ToString() + "/" + (t.WeekEnding.Month < 10 ? "0" + t.WeekEnding.Month.ToString() : t.WeekEnding.Month.ToString())
                    }).ToList();
        foreach (var m in ms)
        {
            var r = q.Where(x => x.EmployeeId == empId.ToString() && x.WE == m).ToList();
            if (r.Count > 0)
            {
                var r3 = new Grid3Row
                {
                    EmpId = empId,
                    Month = m
                };
                var leave = r.Where(x => x.ProjectType == "Leave").Sum(x => x.TotalMHs);
                r3.Leave = leave.ToString();
                var oh = r.Where(x => x.ProjectType == "OH").Sum(x => x.TotalMHs);
                r3.OH = oh.ToString();
                var totalHours = r.Sum(x => x.TotalMHs);
                r3.Total_Hours = totalHours.ToString();
                var holiday = r.Where(x => x.ProjectType == "Holiday").Sum(x => x.TotalMHs);
                r3.Holiday = holiday.ToString();
                lst.Add(r3);
            }
            //else
            //{
            //    var r3 = new Grid3Row
            //    {
            //        EmpId = empId,
            //        Month = m
            //    };
            //    lst.Add(r3);
            //}
        }

        return lst;
    }

    public static List<Grid4Row> GetEmployeeProjectNo(string fy, int empId)
    {
        var lst = new List<Grid4Row>();
        var db = new PPPEntities();

        var q = (from t in db.TSProjectTotalHMs
                 select new
                 {
                     t.EmployeeId,
                     t.ProjectType,
                     t.ProjectNo,
                     t.TotalMHs
                 }).ToList();

        var r = q.Where(x => x.EmployeeId == empId.ToString()).ToList();
        if (r.Count > 0)
        {
            foreach(var x in r)
            {
                var r4 = new Grid4Row{
                    EmpId = empId,
                    ProjectNo = x.ProjectNo,
                    Hours = x.TotalMHs
                };
                lst.Add(r4);
            }
        }
        return lst;
    }
}
/// <summary>
/// 员工信息类
/// </summary>
public class EmpInfo
{
    public int EmpId { get; set; }
    public string EmpName { get; set; }
    public string ProjectNos { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
}

public class ProjectInfo
{
    public string ProjectNos { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
}

/// <summary>
/// Current Chargeability是当前组织结构下所有人在每个月的平均工作负荷
/// </summary>
public class CurrentChargeability
{
    public string Months {get;set;}
    public string Chargeability { get;set; }
}

public class EmpProjectInfoInFy
{
    public int EmpId { get; set; }
    public string EmpName { get; set; }
    public string ProjectNo { get; set; }
    public string Fy { get; set; }
    public string YearMonth { get; set; }

}

public class Grid2Row
{
    public int EmpId { get; set; }
    public string EmpName { get; set; }
    public string OH_Budget { get; set; }
    public string Up_to_now_Chargeability { get; set; }
    public string Current_Chargeability { get; set; }
    public string Project_Id { get; set; }
    public string Project_No { get; set; }
    public string Start_Date { get; set; }
    public string End_Date { get; set; }
}

public class Grid3Row
{
    public int EmpId { get; set; }
    public string Month { get; set; }
    public string Chargeability { get; set; }
    public string Total_Hours	 { get; set; }
    public string Current_Chargeability { get; set; }
    public string Billable { get; set; }
    public string OH { get; set; }
    public string Leave { get; set; }
    public string Holiday { get; set; }
    public string Status { get; set; }
}

public class Grid4Row
{
    public int EmpId { get; set; }
    public string ProjectNo { get; set; }
    public double? Hours { get; set; }
    public string Proposal { get; set; }
}

public class OrganizationRow
{
    public int OrganizationId { get; set; }
    public int? OwnerId { get; set; } // EmpId
    public string Title { get; set; }
    public string EmpName { get; set; }
}