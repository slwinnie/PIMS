$(function() {
    $(".menu-role").addClass("active");

    $(".add-role").click(function () {
        $.ajax({
            url: "actions/GetId.aspx",
            type: "post",
            datatype: "json",
            success: function (d) {
                $("#newId").val(d);
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
            url: "actions/CreateRole.aspx?id=" + $("#newId").val() + "&role=" + $("#newRole").val() + "&description=" + $("#newDescription").val(),
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

        $("#modalDialog-new").modal('toggle');

        return false;
    });


    $(".edit").click(function () {
        $("#editId").val($(this).parent().parent().parent().find("td:eq(0)").html());
        $("#editRole").val($(this).parent().parent().parent().find("td:eq(1)").html());
        $("#editDescription").val($(this).parent().parent().parent().find("td:eq(2)").html());
        $("#modalDialog-edit").modal('toggle');
    });
    $("#btnEdit").click(function () {
        $.ajax({
            url: "actions/EditRole.aspx?id=" + $("#editId").val() + "&role=" + $("#editRole").val() + "&description=" + $("#editDescription").val(),
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
        var id = $(this).parent().parent().parent().find("td:eq(0)").html();
        $("#btnDelete").data("id", id);
        $("#modalDialog-delete").modal('toggle');
    });
    $("#btnDelete").click(function () {
        var id = $(this).data("id");
        $.ajax({
            url: "actions/DeleteRole.aspx?id=" + id,
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