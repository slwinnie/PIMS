<%@ Control Language="C#" ClassName="ProjectInformation" %>

<script runat="server">

</script>
<div>
    <%
        var db = new PPPEntities();
        var start = "";
        var end = "";
        var projectName = "";
        var desc = "";
        var client = "";
        var pm = "";
        var office = "";
        if (Request["Type"] == "Project")
        {
            var projectNO = Request["ProjectNo"].ToString();
            var projectInfo = db.TProjectBasicInfo.FirstOrDefault(x => x.ProjectNo == projectNO);
            if (projectInfo != null)
            {
                start = projectInfo.StartDate == null ? "" : StringHelper.FmtDate(projectInfo.StartDate);
                end = projectInfo.EndDate == null ? "" : StringHelper.FmtDate(projectInfo.EndDate);
                projectName = projectInfo.ProjectName;
                desc = projectInfo.Description;
                client = projectInfo.ClientName;
                pm = projectInfo.PM;
                office = TransCodeHelper.TransOffice(projectInfo.Office);
            }
        }
        
         %>
    
<div class="panel panel-default left-menu clear-border-radius">
    <div class="panel-heading text-center">
        <strong>Project Information</strong>
    </div>
    <div >
        <table class="table table-condensed" style="margin-bottom: 0; margin-left: -1px; margin-top: -1px; ">
            <tr>
                <td>
                    <strong>No:</strong>
                </td>
                <td>
                    <%=Request["ProjectNo"] %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Name:</strong>
                </td>
                <td>
                    <%=projectName %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Client:</strong>
                </td>
                <td>
                    <%=client %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>PM:</strong>
                </td>
                <td>
                    <%=pm %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Office:</strong>
                </td>
                <td>
                    <%=office %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Type:</strong>
                </td>
                <td>
                    <%=Request["Type"] %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Start:</strong>
                </td>
                <td>
                    <%=start %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>End:</strong>
                </td>
                <td>
                    <%=end %>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%=desc %>
                </td>
            </tr>
        </table>
    </div>
</div>
</div>