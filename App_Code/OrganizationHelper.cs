using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// OrganizationHelper 的摘要说明
/// </summary>
public class OrganizationHelper
{
    public OrganizationHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //

    }
    public static string OrganizationPeoples(int organizationId)
    {
        var db = new PPPEntities();
        var peoples = new StringBuilder();
        foreach (var org in db.TOrganizationPeoples.Where(x => x.OrganizationId == organizationId))
        {
            var p = db.TPeople.FirstOrDefault(x => x.EmployeeId == org.PeopleId);
            if (p != null)
            {
                peoples.Append(string.Format("{0},", p.PeopleNameEn));
            }
        }
        if (peoples.Length > 0) peoples.Length--;

        return string.Format("<span class='organization-peoples'>{0}</span>", peoples);
    }
    public static string ToolBar(int parentId, int? currentLevelNo, string title, int organizationId)
    {
        return string.Format("<span class='owner'> <a href='OrganizationPeoples.aspx?organizationId={3}'>Peoples</a> | <a href ='javascript:void();' data-id='{0}' class ='add-item' data-levelno='{1}'>Add child</a> | <a href = 'javascript:void();' class='edit-item' data-levelno='{1}' data-title='{2}' data-id='{3}' data-parentid='{0}'>Edit</a> | <a href = 'javascript:void();' class='delete-item' data-levelno='{1}' data-id='{0}'>Delete</a></span>", parentId, currentLevelNo, title, organizationId);
    }
    public static string ToolBarRoot(int parentId, int? currentLevelNo, string title, int organizationId)
    {
        return string.Format("<span class='owner'> <a href='OrganizationPeoples.aspx?organizationId={3}'>Peoples</a> <a href ='javascript:void();' data-id='{0}' class ='add-item' data-levelno='{1}'>Add child</a> </span>", parentId, currentLevelNo + 1, title, organizationId);
    }
}