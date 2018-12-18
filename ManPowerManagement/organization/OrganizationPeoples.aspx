<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizationPeoples.aspx.cs" Inherits="ManPowerManagement_organization_OrganizationPeoples" %>
<%@ Register Src="~/ResourceMenu.ascx" TagPrefix="uc1" TagName="ResourceMenu" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/font-awesome.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <style>
        .owner{
            color:darkgray;
        }
    </style>
    <script>
        $(function () {
            window.event.returnValue = false;
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:ResourceMenu runat="server" ID="ResourceMenu" />
    <%
    var db = new PPPEntities();
    newOrganizationId.Value = Request["organizationId"].ToString();
    var organizationId = Convert.ToInt32(Request["organizationId"]);
    var o = db.TOrganization.FirstOrDefault(x => x.OrganizationId == organizationId);
    %>
    <strong>PIMS / Resource Management</strong> > Organization Peoples
        <h4 class="text-center">Organization Peoples</h4>

        <h5>Organization:<strong> <%= o != null ? o.Title : string.Empty %></strong></h5>
        <div class="container" >
        <table class="table table-bordered table-hover header">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Employee ID</th>
                    <th>Employee Name(Chs / Eng)</th>
                    <th>Action(s)</th>
                </tr>
            </thead>
            <tbody>
            <%
                foreach(var org in db.TOrganizationPeoples.Where(x=>x.OrganizationId == organizationId))
                {
                    var p = db.TPeople.FirstOrDefault(x => x.EmployeeId == org.PeopleId);
                    if (p != null)
                    {%>
                        <tr><td><%=p.EmployeeId %></td>
                            <td><%=p.PeopleNameEn %> / <%=p.PeopleNameChs %></td>
                            <td><a href="javascript:void" class="delete-people" data-organizationid ="<%=org.OrganizationId %>" data-employeeid="<%=p.EmployeeId %>">Delete</a></td></tr>
                    <%
                    }
                }
            %>
            </tbody>
            </table>
            </div>
            <div class="text-center">
                <a href="javascript:void(0);" class="btn btn-primary add clear-border-radius">Add People</a>
            </div>
            <input type="hidden" id="newOrganizationId" name="newOrganizationId" runat="server" class="form-control"/>
    </form>
        <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
        <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
        <script src="<%=ResolveUrl("~/ManPowerManagement/js/organizationPeoples.js")%>" ></script>
        <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>

<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-Create">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Add People</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>EmployeeId</label>
                                <input type="text" id="newEmployeeId" name="newEmployeeId" runat="server" class="form-control"/>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnCreate" type="button" class="btn btn-primary">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->

<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-Delete">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Delete confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm delete current item?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnDelete" type="button" class="btn btn-danger" >Delete</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
</body>
</html>
