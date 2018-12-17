<%@ Control Language="C#" ClassName="PageBar" %>
<script runat="server">
    public int PageCount = 1; // 总记录数
    public int PageIndex; // 当前页
    public int PageSize = 10; // 每页记录数
    public string HomeText = "首页";
    public string LastText = "尾页";
    public string NextText = "下一页";
    public string PreviousText = "上一页";
    public bool IsShowHomeText = true;
    public bool IsShowLastText = true;
    public class PageStyle
    {
        public int PageCount = 1; // 总记录数
        public int PageIndex; // 当前页
        public int PageSize = 10; // 每页记录数
        public string HomeText = "首页";
        public string LastText = "尾页";
        public string NextText = "下一页";
        public string PreviousText = "上一页";
        public bool IsShowHomeText = true;
        public bool IsShowLastText = true;
    }
    // 设置样式
    public void InitStyle(PageStyle pageStyle)
    {
        PageIndex = pageStyle.PageIndex < 1 ? 1 : pageStyle.PageIndex;
        HomeText = string.IsNullOrEmpty(pageStyle.HomeText) ? "首页" : pageStyle.HomeText;
        LastText = string.IsNullOrEmpty(pageStyle.LastText) ? "尾页" : pageStyle.LastText;
        NextText = string.IsNullOrEmpty(pageStyle.NextText) ? "下一页" : pageStyle.NextText;
        PreviousText = string.IsNullOrEmpty(pageStyle.PreviousText) ? "上一页" : pageStyle.PreviousText;
        PageSize = (pageStyle.PageSize < 5 || pageStyle.PageSize > 20) ? 10 : pageStyle.PageSize;
        PageCount = pageStyle.PageCount < 0 ? 1 : pageStyle.PageCount;
        IsShowHomeText = pageStyle.IsShowHomeText;
        IsShowLastText = pageStyle.IsShowLastText;
    }
    
    public string GetUrl(int pageIndex)
    {
        var requestString = Request.QueryString;
        var sb = new StringBuilder();
        var keyName = "pageIndex";
        foreach (string key in requestString)
        {
            if (key == keyName)
            {
                sb.AppendFormat("{0}{1}={2}", sb.Length == 0 ? "?" : "&", key, pageIndex);
            }
            else
            {
                sb.AppendFormat("{0}{1}={2}", sb.Length == 0 ? "?" : "&", key, Request[key]);
            }
        }
        if (Request[keyName] == null)
        {
            sb.AppendFormat("{0}{1}={2}", sb.Length == 0 ? "?" : "&", keyName, pageIndex);
        }
        return sb.ToString();
    }
    public string Tfoot(int pageCount, int rowCount, int colCount)
    {
        var pageIndex = Request["pageIndex"] == null ? "1" : Request["pageIndex"].ToString();
        var sb = new StringBuilder();
        sb.AppendFormat("<tfoot><tr><td colspan='{0}'>", colCount);
        sb.AppendFormat("<div class='form-inline'>Total:<strong>{0}</strong> row(s), <strong>{1}</strong> page(s). Current pageindex is <strong>{2}</strong>. Goto page "
                        + "<div class='input-group'>"
                        + "<input type='text' class='form-control' style='width: 7em;' placeholder='pageIndex' id='newPageIndex' onkeydown=\"{{if (event.keyCode === 13){{location.href='?pageIndex='+ document.getElementById('newPageIndex').value; return false;}}}}\" />"
                        + "  <span class='input-group-btn'><a class='btn btn-default' id='newPageGoButton' href=\"javascript:location.href='?pageIndex='+ document.getElementById('newPageIndex').value\">Go</a></span>"
                        + "</div>"
                        + "</div>",
                        rowCount, 
                        pageCount, 
                        PageIndex);
        sb.AppendFormat("</td></tr></tfoot>");
        return sb.ToString();
    }
    private int firstPageIndex;
    private int endPageIndex;
</script>
<div class="pagebar text-center">
<%
    PageIndex = PageIndex > PageCount ? PageCount : PageIndex;
    firstPageIndex =PageIndex % PageSize == 0 ? (PageIndex - 1)/PageSize*PageSize + 1 : PageIndex/PageSize*PageSize + 1; // 起始输出页
    endPageIndex = PageIndex % PageSize == 0 ? (PageIndex / PageSize) * PageSize : ((PageIndex + PageSize) / PageSize) * PageSize;
    endPageIndex = endPageIndex > PageCount ? PageCount : endPageIndex;
%>
    <ul class="pagination">
        <% if (PageIndex > 1)
           { 
                if (IsShowHomeText)
                {%>
                    <li><a href="<%=GetUrl(1) %>"><%=HomeText %></a></li>
              <%} %>
                <li class="previous"><a href="<%= GetUrl(PageIndex - 1) %>"><%=PreviousText %></a> </li>
        <% }
           else
           {%>
             <% if (IsShowHomeText)
                {%>
                    <li class="disabled"><a href="#" ><%=HomeText %></a></li>
              <%}%>
                    <li class="disabled previous"><a href="#"><%=PreviousText %></a> </li>
         <%}
            for (int i = firstPageIndex; i <= endPageIndex; i++)
            {
                if (i == PageIndex)
                {%>
                    <li class="active"><a href="#"><%=i%></a> </li>
                <%}
                else
                {%>
                    <li><a href="<%=GetUrl(i) %>"><%=i%></a> </li>
                <%}
            }
            if (PageIndex == PageCount)
            { %>
                <li class="disabled next"><a href="#"><%=NextText %></a> </li>
                <% if (IsShowLastText)
                   {%>
                       <li class="disabled"><a href="#"><%=LastText %></a> </li>
                   <%} 
            }
            else
            {%>
                <li class="next"><a href="<%=GetUrl(PageIndex + 1) %>"><%=NextText %></a> </li>
                <% if (IsShowLastText)
                   {%>
                        <li><a href="<%=GetUrl(PageCount) %>"><%=LastText %></a> </li>
                 <%} 
            }%>
    </ul>
</div>
