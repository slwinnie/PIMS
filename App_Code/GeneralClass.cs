using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// GeneralClass 的摘要说明
/// </summary>
public class GeneralClass
{
	public GeneralClass()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
}

public class FunctionInfo
{
    public int FunctionId;
    public string Function;
    public string Access;
}

public class RoleInfo
{
    public int RoleId;
    public string Role;
}

public class CompareString : IEqualityComparer<string>
{
    public bool Equals(string x, string y)
    {
        return x!= null && y != null && x.ToLower().Contains(y.ToLower());
    }

    public int GetHashCode(string obj)
    {
        throw new NotImplementedException();
    }

    public void Test()
    {

    }
}