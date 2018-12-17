$(function () {
    $(".menu-account").addClass("active");


    $("#newEmployeeId").blur(function() {
        $.ajax({
            url: '../../People/Actions/SearchPeople.aspx?searchKey=' + $("#newEmployeeId").val() ,
            type: "post",
            datatype: "json",
            success: function (d) {
                if (d.length > 0) {
                    var json = JSON.parse(d)[0];
                    $("#newAccount").val(json.EmployeeId);
                    $("#newUserName").val(json.PeopleNameEn);
                    $("#newEmail").val(json.Email);
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

    $(".create-account").click(function () {
        $("#modalDialog-Create").modal("show");
    });
    $("#btnCreate").click(function() {
        $.ajax({
            url: 'Actions/CreateAccount.aspx?newAccount=' + $("#newAccount").val()
                + "&newEmail=" + $("#newEmail").val()
                + "&newEmployeeId=" + $("#newEmployeeId").val()
                + "&newUserName=" + $("#newUserName").val()
                //+ "&newRole=" + $("#newRole").val()
                + "&newCompany=" + $("#newCompany").val()
                + "&newStatus=" + $("#newStatus").val()
            ,
            type: "post",
            datatype: "json",
            success: function (d) {
                var json = JSON.parse(d);
                if (json.ErrorMessage !== "0") {
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

    $(".edit").click(function() {
        var accountId = $(this).parent().parent().parent().find("td:eq(0)").html();
        var account = $(this).parent().parent().parent().find("td:eq(1)").html();
        var company = $(this).parent().parent().parent().find("td:eq(2)").html();
        var employeeId = $(this).parent().parent().parent().find("td:eq(3) a").data("empid");
        var email = $(this).parent().parent().parent().find("td:eq(5)").html();
        var userName = $(this).parent().parent().parent().find("td:eq(4)").html();

        var role = $(this).parent().parent().parent().find("td:eq(7)").html();
        var status = $(this).parent().parent().parent().find("td:eq(8)").html();
        $("#editAccountId").val(accountId);
        $("#editEmployeeId").val(employeeId);
        $("#editAccount").val(account);
        $("#editUserName").val(userName);

        $("#editCompany").val(company);
        $("#editEmail").val(email);
        $("#editRole").val(role);
        $("#editStatus").val(status);

        $("#modalDialog-edit").modal("show");
    });

    $("#btnEdit").click(function() {
        $.ajax({
            url: 'Actions/EditAccount.aspx?editAccountId=' + $("#editAccountId").val()
                + "&editAccount=" + $("#editAccount").val()
                + "&editEmail=" + $("#editEmail").val()
                + "&editEmployeeId=" + $("#editEmployeeId").val()
                //+ "&editRole=" + $("#editRole").val()
                + "&editCompany=" + $("#editCompany").val()
                + "&editStatus=" + $("#editStatus").val(),
            type: "post",
            datatype: "json",
            success: function(d) {
                $("#modalDialog-edit").modal("hide");
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown) {
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


    $(".delete").click(function () {
        var id = $(this).parent().parent().parent().find("td:eq(0)").html();
        $("#btnDelete").data("id", id);
        $("#modalDialog-Delete").modal("show");

    });

    $("#btnDelete").click(function () {
        var id = $(this).data("id");
        $.ajax({
            url: 'Actions/DeleteAccount.aspx?accountId=' + id,
            type: "post",
            datatype: "json",
            success: function(d) {
                //var json = JSON.parse(d);
                //alert(json.ErrorMessage);
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown) {
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

    $(".resetpassword").click(function() {
        location.href = "resetpassword.aspx?account=" + $(this).parent().parent().parent().find("td:eq(1)").html();
    });

    $(".editRole").click(function() {
        var accountId = $(this).parent().parent().parent().find("td:eq(0)").html();
        location.href = "AccountRole.aspx?accountId=" + accountId;
    });

    $(".sync-data").click(function() {
        $.ajax({
            url: 'Actions/Sync.aspx',
            type: "post",
            datatype: "json",
            success: function (d) {
                var json = JSON.parse(d);
                alert(json.ErrorMessage);
                //location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //alert(jqXHR.status);
            }
        });
    });
})