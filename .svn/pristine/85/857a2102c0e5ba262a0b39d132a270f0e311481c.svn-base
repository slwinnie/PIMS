$(function () {
    $(".menu-account").addClass("active");

    $(".add-account-role").click(function () {
        $.ajax({
            url: "actions/GetAccountRoleId.aspx?accountId=" + $("#accountId").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                $("#newNo").val(d);
            },
            error: function (e) {
                alert("Error.");
            }
        });
        $("#modalDialog-new").modal('toggle');
        $("#newRole").focus();
    });
    $("#btnAdd").click(function () {
        $.ajax({
            url: "actions/CreateAccountRole.aspx?accountId=" + $("#accountId").val()
                + "&roleId=" + $("#newRole option:selected").val()
                + "&no=" + $("#newNo").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                var rst = JSON.parse(d);
                location.reload();
            },
            error: function (e) {
                alert("Error.");
            }
        });

        $("#modalDialog-new").modal('toggle');

        return false;
    });


    $(".edit").click(function () {
        $("#editNo").val($(this).parent().parent().parent().find("td:eq(0)").html());
        var functionId = $(this).parent().parent().parent().find("td:eq(1) span").data("functionid");
        $("#editFunction").val(functionId);
        $("#editAccess").val($(this).parent().parent().parent().find("td:eq(2)").text());
        $("#modalDialog-edit").modal('toggle');
    });
    $("#btnEdit").click(function () {
        $.ajax({
            url: "actions/EditRoleFunctionAccess.aspx?roleId=" + $("#roleId").val()
                + "&functionId=" + $("#editFunction option:selected").val()
                + "&no=" + $("#editNo").val()
                + "&access=" + encodeURIComponent($("#editAccess").val()),
            type: "post",
            datatype: "json",
            success: function (d) {
                var rst = JSON.parse(d);
                //alert(rst.ErrorMessage);
                location.reload();
            },
            error: function (e) {
                alert("Error.");
            }
        });

        $("#modalDialog-edit").modal('toggle');

        return false;
    });


    $(".delete").click(function () {
        var roleid = $(this).parent().parent().parent().find("td:eq(1) span").data("roleid");
        $("#btnDelete").data("roleid", roleid);
        $("#modalDialog-delete").modal('toggle');
    });
    $("#btnDelete").click(function () {
        var roleid = $(this).data("roleid");

        $.ajax({
            url: "actions/DeleteAccountRole.aspx?roleId=" + roleid + "&accountId=" + $("#accountId").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                //var rst = JSON.parse(d);
                //alert(rst.ErrorMessage);
                location.reload();
            },
            error: function (e) {
                alert("Error.");
            }
        });

        $("#modalDialog-delete").modal('toggle');

        return false;
    });

})