<%@ Page Language="C#" %>
<%
    Session["EmployeeId"] = null;
    Session["PeopleNameEn"] = null;
    
    Response.Redirect("~/Login.aspx");
%>