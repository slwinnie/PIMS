<%@ Control Language="C#" ClassName="WBSInformation" %>

<script runat="server">

</script>
<div>
    <%
        var db = new PPPEntities();
        var wbs = Request["WBS"].ToString();
        var projectNO = Request["ProjectNo"].ToString();
        var type = Request["Type"].ToString();
        var ctr = "";
        var actualHours = "";
        var budgetHours = "";
        var plannedHours = "";
        var owner = "";
        var wbsInfo = db.TStaffingPlan.FirstOrDefault(x => x.ProjectNo == projectNO && x.Type == type && x.WBS == wbs);
        if (wbsInfo != null)
        {
            ctr = wbsInfo.CTR;
            actualHours = wbsInfo.ActualHours.ToString();
            budgetHours = wbsInfo.BudgetHours.ToString();
            plannedHours = wbsInfo.PlannedHours.ToString();
            if (wbsInfo.OwnerId != null)
            {
                var people = db.TPeople.FirstOrDefault(x => x.EmployeeId == wbsInfo.OwnerId);
                if (people != null)
                {
                    owner = people.PeopleNameEn;
                }
            }
        }
        
         %>
    
<div class="panel panel-default left-menu clear-border-radius">
    <div class="panel-heading text-center">
        <strong>WBS Information</strong>
    </div>
    <div >
        <table class="table table-condensed" style="margin-bottom: 0; margin-left: -1px;margin-top: -1px; ">
            <tr>
                <td>
                    <strong>WBS:</strong>
                </td>
                <td>
                    <%=wbs %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>CTR:</strong>
                </td>
                <td>
                    <%=ctr %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Budget Hours:</strong>
                </td>
                <td>
                    <%=budgetHours %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Planned Hours:</strong>
                </td>
                <td>
                    <%=plannedHours %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Actual Hours:</strong>
                </td>
                <td>
                    <%=actualHours %>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Owner:</strong>
                </td>
                <td>
                    <%=owner %>
                </td>
            </tr>
        </table>
    </div>
</div>
</div>