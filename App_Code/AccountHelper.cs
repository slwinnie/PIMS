using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AccountHelper 的摘要说明
/// </summary>
public class AccountHelper
{
    public AccountHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static string GetAccountName(int employeeId)
    {
        var db = new PPPEntities();
        var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == employeeId);
        if (acc != null)
        {
            return acc.Account;
        }
        else
        {
            return employeeId.ToString();
        }
    }
}