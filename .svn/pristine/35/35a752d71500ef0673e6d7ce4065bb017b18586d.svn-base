$(function () {
    $(".add").click(function () {
        $("#modalDialog-Create").modal("show");
        $("#newLevelNo").val($(this).data("levelno") + 1);
        $("#newParentId").val($(this).data("id"));

        console.log($("#newLevelNo").val());
        console.log($("#newParentId").val());
    });

    $("#btnCreate").click(function () {
        var url = '../Actions/AddOrganizationPeople.aspx?newOrganizationId=' + $("#newOrganizationId").val() + "&newEmployeeId=" + $("#newEmployeeId").val();
        console.log(url);
        $.ajax({
            url: url,
            type: "post",
            datatype: "json",
            success: function (d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                }
                $("#modalDialog-Create").modal("hide");
                location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                //alert(jqXHR.responseText);
                alert(jqXHR.status);
                //alert(jqXHR.readyState);
                //alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);

            }
        });
    });

    $(".delete-people").click(function () {
        var employeeId = $(this).data("employeeid");
        var organizationId = $(this).data("organizationid");
        $("#btnDelete").data("employeeid", employeeId);
        $("#btnDelete").data("organizationid", organizationId);
        $("#modalDialog-Delete").modal("show");
    });

    $("#btnDelete").click(function () {
        var employeeId = $(this).data("employeeid");
        var organizationId = $(this).data("organizationid");
        $.ajax({
            url: '../Actions/DeleteOrganizationPeople.aspx?employeeId=' + employeeId + "&organizationId=" + organizationId,
            type: "post",
            datatype: "json",
            success: function (d) {
                location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                //alert(jqXHR.responseText);
                alert(jqXHR.status);
                //alert(jqXHR.readyState);
                //alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);

            }
        });
    });
});