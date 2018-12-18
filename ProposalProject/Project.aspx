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
        <%--<div class="col col-lg-3 col-md-3 col-sm-3" >
            <uc1:LeftMenu runat="server" id="LeftMenu" />
            <uc1:ProjectInformation runat="server" ID="ProjectInformation" />
        </div>--%>
        <div class="col col-lg-9 col-md-9 col-sm-9">
            <div style="border: 0px solid blue; height: 600px; padding-right: 15px;">
                    <h4 class="text-center">Project Information</h4>
                <%
                    var db = new PPPEntities();
                    var pno = Request["ProjectNo"].ToString();
                    var type = Request["Type"].ToString();
                    var pi = db.TProjectBasicInfo.FirstOrDefault(x => x.ProjectNo == pno && x.Type == type);
                    if (pi != null)
                    {
                        projectNo.Value = pi.ProjectNo;
                        projectName.Value = pi.ProjectName;
                        client.Value = pi.ClientName;
                        pm.Value = pi.PM;
                        office.Value = pi.Office;
                        start.Value = StringHelper.FmtDate(pi.StartDate);
                        end.Value = StringHelper.FmtDate(pi.EndDate);
                        description.Value = pi.Description;
                    }
                %>
                            <div class="">
                                <label>Project No</label>
                                <input name="projectNo" type="text" id="projectNo" class="form-control clear-border-radius" runat="server" readonly="readonly" />
                                <label>Project Name</label>
                                <input name="projectName" type="text" id="projectName" class="form-control clear-border-radius" runat="server" />
                                <label class="">Client</label>
                                <input name="client" type="text" id="client" class="form-control clear-border-radius" runat="server" />
                                <label class="">PM</label>
                                <input name="pm" type="text" id="pm" class="form-control clear-border-radius" runat="server" />
                                <label class="">Office</label>
                                <input name="office" type="text" id="office" class="form-control clear-border-radius" runat="server" />
                                <label>Start</label>
                                <input name="start" type="text" id="start" class="form-control clear-border-radius" runat="server" />
                                <label>End</label>
                                <input name="end" type="text" id="end" class="form-control clear-border-radius" runat="server" />
                                <label>Description</label>
                                <textarea id="description" class="form-control clear-border-radius" runat="server" ></textarea>
                            </div>
                <br />
                    <div class="text-center">
                        <a href="javascript:void(0);" class="btn btn-primary text-center clear-border-radius save" tabindex="2" >Save</a>
                    </div>
            </div>
        </div>
    </form>
</body>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script>
        $(function() {
            $("#LeftMenu_projectInformation").addClass("active");

            $(".save").click(function() {
                    var formdata = $("#form1").serialize();
                    $.ajax({
                        url: "actions/edit-project.aspx?Type="+$.getUrlParam(window.location.href, "Type"),
                        type: "post",
                        datatype: "json",
                        data: formdata,
                        success: function (d) {
                            var json = JSON.parse(d);
                            if (json.ErrorCode !== "0") {
                                alert(json.ErrorMessage);
                            } else {
                                alert(json.ErrorMessage);
                            }
                        },
                        error: function (e) {
                            ;
                        }
                    });
                return false;
            });
        })
    </script>

</html>
