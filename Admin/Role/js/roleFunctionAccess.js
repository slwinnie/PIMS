$(function () {
    $(".menu-role").addClass("active");

    $(".add-function-access").click(function () {
        $.ajax({
            url: "actions/GetFunctionAccessId.aspx?roleId=" + $("#roleId").val(),
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
        $("#newFunction").focus();
    });
    $("#btnAdd").click(function () {
        $.ajax({
            url: "actions/CreateRoleFunctionAccess.aspx?roleId=" + $("#roleId").val()
                + "&functionId=" + $("#newFunction option:selected").val()
                + "&access=" + encodeURIComponent($("#newAccess").val())
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
        var functionid = $(this).parent().parent().parent().find("td:eq(1) span").data("functionid");
        $("#btnDelete").data("roleid", roleid);
        $("#btnDelete").data("functionid", functionid);
        $("#modalDialog-delete").modal('toggle');
    });
    $("#btnDelete").click(function () {
        var roleid = $(this).data("roleid");
        var functionid = $(this).data("functionid");

        $.ajax({
            url: "actions/DeleteRoleFunctionAccess.aspx?roleId=" + roleid + "&functionId=" + functionid,
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

    $(".editFunction").click(function () {
        var id = $(this).parent().parent().parent().find("td:eq(0)").html();
        location.href = "RoleFunctionAccess.aspx?roleId=" + id;
    });
})