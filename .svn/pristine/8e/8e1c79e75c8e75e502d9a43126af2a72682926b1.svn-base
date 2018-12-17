<%@ Page Language="C#" %>
<%@ Register Src="~/ProposalProject/ProposaProjectlMenu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/ProposalProject/ProposalProjectLeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%@ Register Src="~/ProposalProject/ProjectInformation.ascx" TagPrefix="uc1" TagName="ProjectInformation" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
    <form id="form1" runat="server">
        <div class="col col-lg-3 col-md-3 col-sm-3">
            <uc1:LeftMenu runat="server" id="LeftMenu" />
<%--            <uc1:ProjectInformation runat="server" ID="ProjectInformation" />--%>
        </div>
        <div class="col col-lg-9 col-md-9 col-sm-9">
            <div style="border: 0px solid blue; height: 600px; padding-right: 15px;">
                    <h4 class="text-center">Project Contact List</h4>
                <%
                    var db = new PPPEntities();
                    var pno = Request["ProjectNo"].ToString();
                    var type = Request["Type"].ToString();
                    var projectContactList = db.TProjectContactList.Where(x => x.ProjectNo == pno && x.Type == type);
                %>
<a href="javascript:void(0);" class="btn btn-success pull-left clear-border-radius create" tabindex="2" >Create Contact</a>
				<table id="gvProjectList" class="table table-bordered table-condensed" >
				    <thead>
				        <tr class="HeaderLinearBackground">
				            <th>No</th>
                            <th>Position</th>
                            <th>Employee ID</th>
                            <th>People Name</th>
                            <th>Office</th>
                            <th>Discipline</th>
                            <th>Title</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Company</th>
                            <th>PAAF Date</th>
                            <th>Status</th>
                            <th style="-moz-min-width: 100px; -ms-min-width: 100px; -o-min-width: 100px; -webkit-min-width: 100px; min-width: 100px;">Action(s)</th>
				        </tr>
				    </thead>
                    <tbody>
                        <%
                            if (projectContactList != null)
                            {
                                foreach(var p in projectContactList)
                                {
                                    %><tr>
                                        <td><%=p.No%></td>
                                        <td><%=p.Position%></td>
                                        <td><%=p.EmployeeId%></td>
                                        <td><%=p.PeopleName%></td>
                                        <td><%=p.Office%></td>
                                        <td><%=p.Discipline%></td>
                                        <td><%=p.Title%></td>
                                        <td><%=p.Phone%></td>
                                        <td><%=p.Email%></td>
                                        <td><%=p.Company%></td>
                                        <td><%=p.PAAFDate%></td>
                                        <td><%=p.Status%></td>
                                    </tr><%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

<!-- 对话框开始 Create -->
        <div class="modal " id="modalDialog-Create">
            <div class="modal-dialog">
                <div class="modal-content clear-border-radius" style="border: 0px solid red; ">
                    <div class="modal-header ">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Create Contact</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>No</label>
                                <input name="newNo" type="text" id="newNo" class="form-control clear-border-radius" />
                                <label>Position</label>
                                <input name="newPosition" type="text" id="newPosition" class="form-control clear-border-radius" />
                                <label>Employee ID</label>
                                <input name="newEmployeeId" type="text" id="newEmployeeId" class="form-control clear-border-radius" />
                                <div  class="search-people-result"></div>
                                <label class="">People Name</label>
                                <input name="newPeople" type="text" id="newPeople" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Office</label>
                                <input name="newOffice" type="text" id="newOffice" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Discipline</label>
                                <input name="newDiscipline" type="text" id="newDiscipline" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Title</label>
                                <input name="newTitle" type="text" id="newTitle" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Phone</label>
                                <input name="newPhone" type="text" id="newPhone" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Email</label>
                                <input name="newEmail" type="text" id="newEmail" class="form-control clear-border-radius" readonly="readonly" />
                                <label>Company</label>
                                <input name="newCompany" type="text" id="newCompany" class="form-control clear-border-radius"  readonly="readonly"/>
                                <label>PAAF Date</label>
                                <input name="newPAAFDate" type="text" id="newPAAFDate" class="form-control clear-border-radius" />
                                <label>Status</label>
                                <input name="newStatus" type="text" id="newStatus"  class="form-control clear-border-radius" />
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default clear-border-radius" data-dismiss="modal">Close</button>
                        <button id="btnCreate" type="button" class="btn btn-primary clear-border-radius">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Create -->
    </form>
</body>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
<%--    <script src="<%=ResolveUrl("~/proposalProject/js/projectContactList.js")%>" ></script>--%>
    <script src="js/projectContactList.js") ></script>

    <script>
        $(function() {
            $("#LeftMenu_projectContactList").addClass("active");

            $(".create").click(function () {
                $("#modalDialog-Create").modal('toggle');
                
            })
        })
    </script>
</html>
