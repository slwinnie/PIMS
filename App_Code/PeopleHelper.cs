﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// PeopleHelper 的摘要说明
/// </summary>
public class PeopleHelper
{
	public PeopleHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static string GetPeopleName(string peopleId)
    {
        try
        {
            var db = new PPPEntities();
            var iPeopleId = Convert.ToInt32(peopleId);
            var item = db.TPeople.FirstOrDefault(x => x.EmployeeId == iPeopleId);
            if (item != null)
            {
                return item.PeopleNameEn;
            }
            else
            {
                return peopleId;
            }
        }
        catch (Exception)
        {
            return peopleId;
        }
    }

    public static string GetPeopleId(string peopleName)
    {
        try
        {
            if (peopleName == "") return peopleName;

            var db = new PPPEntities();
            var item = db.TPeople.FirstOrDefault(x => x.PeopleNameEn == peopleName);
            if (item != null)
            {
                return item.EmployeeId.ToString();
            }
            else
            {
                return peopleName;
            }
        }
        catch (Exception)
        {
            return peopleName;
        }
    }
}