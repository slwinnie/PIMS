<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ManPowerManagement_organization_Default" %>
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
        .organization-peoples{
            color:darkgoldenrod;
        }
    </style>
    <script>
        $(function () {
            window.event.returnValue=false;
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:ResourceMenu runat="server" ID="ResourceMenu" />
    <strong>PIMS / Resource Management</strong> > Organization
        <h4 class="text-center">Organization</h4>
    <div class="container" style="border:1px dotted gray;font-size:16px;">
            <%
                var db = new PPPEntities();
                foreach(var itemLv0 in db.TOrganization.Where(x=>x.LevelNo == 0))
                {
                    %><%=itemLv0.Title %> <%=OrganizationHelper.OrganizationPeoples(itemLv0.OrganizationId) %> <%=OrganizationHelper.ToolBarRoot(itemLv0.OrganizationId, itemLv0.LevelNo, itemLv0.Title, itemLv0.OrganizationId)%><br/>
                <%
                    foreach (var itemLv1 in db.TOrganization.Where(x => x.LevelNo == 1))
                    {
                        %><%=MPMHelper.FmtTitle(itemLv1.Title, 1) %> <%=OrganizationHelper.OrganizationPeoples(itemLv1.OrganizationId) %>  <%=OrganizationHelper.ToolBar(itemLv1.OrganizationId, itemLv1.LevelNo, itemLv1.Title, itemLv1.OrganizationId)%> <br/> <%
                        foreach (var itemLv2 in db.TOrganization.Where(x => x.LevelNo == 2 && x.ParentId == itemLv1.OrganizationId).OrderBy(x=>x.LevelPos))
                        {
                            %><%=MPMHelper.FmtTitle(itemLv2.Title, 2) %> <%=OrganizationHelper.OrganizationPeoples(itemLv2.OrganizationId) %> <%=OrganizationHelper.ToolBar(itemLv2.OrganizationId, itemLv2.LevelNo, itemLv2.Title, itemLv2.OrganizationId)%> <br/>  <%

                            foreach (var itemLv3 in db.TOrganization.Where(x => x.LevelNo == 3 && x.ParentId == itemLv2.OrganizationId).OrderBy(x=>x.LevelPos))
                            {
                                %><%=MPMHelper.FmtTitle(itemLv3.Title, 3) %> <%=OrganizationHelper.OrganizationPeoples(itemLv3.OrganizationId) %> <%=OrganizationHelper.ToolBar(itemLv3.OrganizationId, itemLv3.LevelNo, itemLv3.Title, itemLv3.OrganizationId)%> <br/>  <%
                                
                                foreach (var itemLv4 in db.TOrganization.Where(x => x.LevelNo == 4 && x.ParentId == itemLv3.OrganizationId).OrderBy(x=>x.LevelPos))
                                {
                                    %><%=MPMHelper.FmtTitle(itemLv4.Title, 4) %> <%=OrganizationHelper.OrganizationPeoples(itemLv4.OrganizationId) %> <%=OrganizationHelper.ToolBar(itemLv4.OrganizationId, itemLv4.LevelNo, itemLv4.Title, itemLv4.OrganizationId)%><br/> <%
                                    foreach (var itemLv5 in db.TOrganization.Where(x => x.LevelNo == 5 && x.ParentId == itemLv4.OrganizationId).OrderBy(x=>x.LevelPos))
                                    {
                                        %><%=MPMHelper.FmtTitle(itemLv5.Title, 5) %> <%=OrganizationHelper.OrganizationPeoples(itemLv5.OrganizationId) %> <%=OrganizationHelper.ToolBar(itemLv5.OrganizationId, itemLv5.LevelNo, itemLv5.Title, itemLv5.OrganizationId)%><br/>  <%
                                    }
                                }
                            }
                        }
                    }
                }
                %>
        </div>
    </form>
        <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
        <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
        <script src="<%=ResolveUrl("~/ManPowerManagement/js/organization.js")%>" ></script>
        <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>

<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-Create">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Add Child</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>Title</label>
                                <input type="text" id="newTitle" name="newTitle" runat="server" class="form-control"/>
                                <label class="">Level No (max support level no is 5)</label>
                                <input type="text" class="form-control" id="newLevelNo" name ="newLevelNo" runat="server" readonly="readonly"/>
                                <label class="">Pos</label>
                                <input type="text" class="form-control" id="newPos" name ="newPos" value="1" runat="server"/>
                                <input type="hidden" class="form-control" id="newParentId" name ="newParentId" runat="server" readonly="readonly"/>
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
        <div class="modal" id="modalDialog-edit">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Edit Organization</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>OrganizationId</label>
                                <input type="text" id="editId" name="editId" runat="server" class="form-control" readonly="readonly"/>
                                <label>Title</label>
                                <input type="text" id="editTitle" name="editTitle" runat="server" class="form-control"/>
                                <label class="">Level No</label>
                                <input type="text" class="form-control" id="editLevelNo" name ="editLevelNo" runat="server" readonly="readonly"/>
                                <label class="">Pos</label>
                                <input type="text" class="form-control" id="editPos" name ="editPos" value="1" runat="server"/>
                                <input type="hidden" class="form-control" id="editParentId" name ="editParentId" runat="server" readonly="readonly"/>

                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnEdit" type="button" class="btn btn-primary">Save</button>
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
                        <button id="btnDelete" type="button" class="btn btn-danger">Delete</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
</body>
</html>
