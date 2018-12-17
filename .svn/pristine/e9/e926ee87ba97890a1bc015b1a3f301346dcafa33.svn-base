using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

/// <summary>
/// SystemHelper 的摘要说明
/// </summary>
public class SystemHelper
{
	public SystemHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static string SystemName = "PIMS";
    public static string DefaultPassword = "123456";
    public static bool AccessAuthority(string account, string pageNo)
    {
        return true;
    }

    public static void SetPageNo(Page page, string pageNo)
    {
        page.Items.Add("pageNo", pageNo);
        //page.Items["pageNo"] = pageNo;
        //page.Session["pageNo"] = pageNo;
    }

    public static void SessionCheck(Page page)
    {

        var pageNo = page.Items["pageNo"] == null ? "" : page.Items["pageNo"].ToString();

        var employeeId = GetEmployeeId(SystemHelper.DomainUserName());
        if (employeeId == "0")
        {
            //page.Response.Redirect("~/InvalidAccess.aspx");
            return;
        }
        var roles = GetRoles(employeeId);
        if (roles.Any(x => x.Role == "DBA"))
        {
            return; 
        }
        else
        {
            var funcs = GetFunctions(employeeId).ToList();
            if (!funcs.Any())
            {
                // 系统中不存在次FunctionName
                page.Response.Redirect("~/InvalidAccess.aspx");
            }
            var func = funcs.FirstOrDefault(x => x.Function == pageNo);
            if (func == null)
            {
                // 系统中不存在次FunctionName
                page.Response.Redirect("~/InvalidAccess.aspx");
            }
            else
            {
                if (func.Access == "Read")
                {
                    // Read
                }
                else
                {
                    // Read & Write
                }
            }
        }
    }

    public static IEnumerable<RoleInfo> GetRoles(string employeeId)
    {
        var db = new PPPEntities();
        var iempId = Convert.ToInt32(employeeId);
        var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iempId);
        if (acc != null)
        {
            var q = from x in db.TAccountRole.Where(x => x.AccountId == acc.AccountId)
                join y1 in db.TRole on x.RoleId equals y1.RoleId into tmp
                from y in tmp.DefaultIfEmpty()
                select new RoleInfo
                {
                    RoleId = x.RoleId,
                    Role = y.Role
                };

            return q;
        }
        else
        {
            return new List<RoleInfo>();
        }
    }

    public static string GetRolesString(string employeeId)
    {
        var lst = GetRoles(employeeId);
        var sb = new StringBuilder();
        foreach (var item in lst)
        {
            sb.AppendFormat("{0},", item.Role);
        }
        if (sb.Length > 0)
        {
            sb.Length --;
        }
        return sb.ToString();
    }

    public static IEnumerable<FunctionInfo> GetFunctions(string employeeId)
    {
        var db = new PPPEntities();
        var iempId = Convert.ToInt32(employeeId);
        var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iempId);
        if (acc != null)
        {
            var q = (from x in db.TAccountRole.Where(x => x.AccountId == acc.AccountId)
                    join y1 in db.TRole on x.RoleId equals y1.RoleId into tmp
                    from y in tmp.DefaultIfEmpty()
                    select new RoleInfo
                    {
                        RoleId = x.RoleId,
                        Role = y.Role
                    }).ToList();

            var y2 = (from z1 in q
                      join z2 in db.TRoleDetail on z1.RoleId equals z2.RoleId into tmp
                      from z in tmp
                      select new FunctionInfo
                      {
                          FunctionId = (int)z.FunctionId,
                          Access = z.Access
                      }).ToList();

            var y3 = (from z in y2
                      join m1 in db.TFunction on z.FunctionId equals m1.Id into tmp2
                      from m in tmp2
                      select new FunctionInfo
                      {
                          FunctionId = z.FunctionId,
                          Function = m.FunctionName,
                          Access = z == null ? "" : z.Access
                      }).ToList();

            return y3;
        }
        else
        {
            return new List<FunctionInfo>();
        }
    }

    public static string GetEmployeeId(string pUserName)
    {
        var items = pUserName.Split(new char[] {'\\'}, StringSplitOptions.None);
        if (items.Length > 0)
        {
            var enUserName = items[items.Length - 1];
            var db = new PPPEntities();
            var acc = db.TAccount.FirstOrDefault(x => x.UserName == enUserName);
            if (acc != null)
            {
                return acc.EmployeeId.ToString();
            }
            else
            {
                return "0";
            }
        }
        else
        {
            return "0";
        }
    }

    public static string GetUserName(string pUserName)
    {
        var items = pUserName.Split(new char[] { '\\' }, StringSplitOptions.None);
        if (items.Length > 0)
        {
            return items[items.Length - 1];
        }
        else
        {
            return "";
        }
    }

    public static string DomainUserName()
    {
        var isDebugMode = HttpContext.Current.Server.MachineName.ToLower() != "cnbeiwpenc02v";
        var db = new PPPEntities();
        var employeeId = Convert.ToInt32(GetEmployeeId(HttpContext.Current.User.Identity.Name));
        var item = db.TAccount.FirstOrDefault(x => x.EmployeeId == employeeId);
        if (item != null)
        {
            item.LastLogin = DateTime.Now;
            db.SaveChanges();
        }        
        //isDebugMode = false; // 启动生产模式
        if (!isDebugMode)
        {
            // 生产模式
            return HttpContext.Current.User.Identity.Name;
        }
        else
        {
            // 调试模式
            //return @"Debug\ZHENHUA.LIU";
            //return @"Debug\FUJU.ZHAO";
            //return @"Debug\LI.MA";
            try
            {
                var sr = new System.IO.StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/DebugUser.txt"));
                var str = sr.ReadToEnd();
                sr.Close();
                var arr = str.Split(new string[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);
                if (arr[0].IndexOf("\\") >= 0)
                {
                    return arr[0];
                }
                else
                {
                    return string.Format("Debug{0}{1}", "\\", arr[0]);
                }
            }
            catch(Exception ex)
            {
                return @"Debug\ZHENHUA.LIU";
            }
        }
    }

    
}