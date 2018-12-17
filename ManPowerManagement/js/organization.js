$(function () {
    $(".menu-organization").addClass("active");

    $(".add-item").click(function () {
        $("#modalDialog-Create").modal("show");
        $("#newLevelNo").val($(this).data("levelno") + 1);
        $("#newParentId").val($(this).data("id"));
    });
    $(".edit-item").click(function () {
        $("#modalDialog-edit").modal("show");
        $("#editId").val($(this).data("id"));
        $("#editLevelNo").val($(this).data("levelno"));
        $("#editOwnerId").val($(this).data("ownerid"));
        $("#editOwner").val($(this).data("owner"));
        $("#editParentId").val($(this).data("parentid"));
        $("#editTitle").val($(this).data("title"));
    })

    $("#btnCreate").click(function () {
        if ($("#newLevelNo").val() > 5) {
            alert("Invalid Level No.");
            return;
        }
        $.ajax({
            url: '../Actions/AddChildOrganization.aspx?newTitle=' + $("#newTitle").val()
                + "&newLevelNo=" + $("#newLevelNo").val()
                + "&newPos=" + $("#newPos").val()
                + "&newParentId=" + $("#newParentId").val()
            ,
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

    $("#newOwnerId").blur(function () {
        $.ajax({
            url: '../../People/Actions/SearchPeople.aspx?searchKey=' + $("#newOwnerId").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                if (d.length > 0) {
                    var json = JSON.parse(d)[0];
                    $("#newOwner").val(json.PeopleNameEn);
                }
                //alert("successful");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                //alert(jqXHR.responseText);
                //alert(jqXHR.status);
                //alert(jqXHR.readyState);
                //alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                alert(textStatus);
                //alert(errorThrown);

            }
        });

        return false;
    });

    $("#btnEdit").click(function () {
        $.ajax({
            url: '../Actions/EditOrganization.aspx?id=' + $("#editId").val()
                + "&editTitle=" + $("#editTitle").val()
                + "&editLevelNo=" + $("#editLevelNo").val()
                + "&editPos=" + $("#editPos").val()
                + "&editParentId=" + $("#editParentId").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                $("#modalDialog-edit").modal("hide");
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
        return false;
    });

    $(".delete-item").click(function () {
        var id = $(this).data("id");
        $("#btnDelete").data("id", id);
        $("#modalDialog-Delete").modal("show");
    });

    $("#btnDelete").click(function () {
        var id = $(this).data("id");
        $.ajax({
            url: '../Actions/DeleteOrganization.aspx?Id=' + id,
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
})