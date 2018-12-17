using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// StringHelper 的摘要说明
/// </summary>
public static class StringHelper
{
    public static string SecurityString(this string s)
    {
        return s == null ? "" : s.Replace("'", "''");
    }

    public static string FmtDate(object obj)
    {
        Func<object, string> fmt = delegate(object o) { var d = Convert.ToDateTime(o); return string.Format("{0}/{1:D2}/{2:D2}", d.Year, d.Month, d.Day); };
        return (obj == DBNull.Value || obj == null) ? string.Empty : fmt(obj);
    }

    public static string FmtNumber(object obj)
    {
        Func<object, string> fmt = delegate(object o)
        {
            object s;
            try
            {
                var t = ((string) o).Replace(",", "");
                s = string.Format("{0:N0}", Convert.ToInt32(t));
            }
            catch
            {
                s = obj;
            }
            return (string)s;
        };
        return (obj == DBNull.Value || obj == null) ? string.Empty : fmt(obj);
    }

     public static string GetMd5(string s)
     {
         //md5加密
         var hashPasswordForStoringInConfigFile = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(s, "md5");
         if (hashPasswordForStoringInConfigFile != null)
             s = hashPasswordForStoringInConfigFile;

         return s.ToLower().Substring(8, 16);
     }
}