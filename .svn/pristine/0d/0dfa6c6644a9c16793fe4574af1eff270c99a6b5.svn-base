<%@ Page Language="C#" %>
<%@ Import Namespace="System.Security.Cryptography" %>

<!DOCTYPE html>

<script runat="server">
    public string GetMD5_32(string s, string charset)
    {
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] t = md5.ComputeHash(Encoding.GetEncoding(charset).GetBytes(s));
        StringBuilder sb = new StringBuilder(32);
        for (int i = 0; i < t.Length; i++)
        {
            sb.Append(t[i].ToString("x").PadLeft(2, '0'));
        }
        return sb.ToString();
    } 
    
    private void btnMakMd5_OnServerClick(object sender, EventArgs e)
    {
        targer.Value = GetMD5_32(source.Value, "gb2312");
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=SystemHelper.SystemName %></title>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="/Content/bootstrap.css"/>
    <link rel="stylesheet" href="/Content/g.css"/>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <script src="/Scripts/bootstrap.js"></script>
    <style>
        .shadow {
            -moz-box-shadow: 2px 2px 5px #333333;
            -webkit-box-shadow: 2px 2px 5px #333333;
            box-shadow: 2px 2px 5px #333333;
        }                                                                                                    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <br/><br/>
    <H3 class="text-center">MD5</H3>
    <div class="container">
        <div class="col col-lg-2"></div>
        <div class="col col-lg-8 shadow"><br/>
            <label>原文</label>
            <input type="text" id="source" class="form-control" runat="server"/>
            <div class="text-center">
                <br/><button class="btn btn-primary btn-lg" runat="server" id="btnMakMd5" OnServerClick="btnMakMd5_OnServerClick">生成密文</button><br/><br/>
            </div>
            <label>密文</label>
            <input type="text" id="targer" class="form-control" runat="server"/>
            <br/>
        </div>
        <div class="col col-lg-2"></div>
    </div>
    </form>
</body>
</html>
