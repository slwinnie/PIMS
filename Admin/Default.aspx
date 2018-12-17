<%@ Page Language="C#" %>

<%@ Register Src="~/Admin/AdminMenu.ascx" TagPrefix="uc1" TagName="AdminMenu" %>
<%--<%SystemHelper.SetPageNo(this, "Admin"); %>
<%SystemHelper.SessionCheck(this); %>--%>

<!DOCTYPE html>

<script runat="server">

</script>

<%
  Response.Redirect("Account/Default.aspx");
%>