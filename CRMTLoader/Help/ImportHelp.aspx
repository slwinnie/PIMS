<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Help</title>
    <style>
        img.shadow
        {
            box-shadow: 10px 10px 5px #888888;
        }
        span.red {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h3>关于导入CRMT文件时提示“<span class="red">External table is not in the expected format.</span>”错误的解决方案</h3><hr/>
        <div>
            <h4>原因分析</h4>
            CRMT文件隐含了A,B,C三个列，这三列是计算列不是数据列，如果作为数据源会导致系统出错。
        </div>
        <div>
            <h4>解决方案</h4>
            <ol>
                <li><h4>用Excel打开CRMT导出文件</h4>
                    <div><img class="shadow" src="<%=ResolveUrl("~/CRMTLoader/Help/1.png") %>"/></div>
                </li>
                <li><h4>点击“<span class="red">数据</span>”选项卡，关闭“<span class="red">筛选</span>”按钮并重新打开</h4>
                    <div>
                        <img class="shadow" src="<%=ResolveUrl("~/CRMTLoader/Help/2.png") %>"/>
                    </div>
                </li>
                <li><h4>“<span class="red">保存</span>”并退出。请尝试重新导入！</h4>
                    <div><img  src="<%=ResolveUrl("~/CRMTLoader/Help/smile.png") %>"/></div>
                </li>
            </ol>
        </div>
    </div>
    </form>
</body>
</html>
