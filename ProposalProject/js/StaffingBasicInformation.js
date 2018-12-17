$(function() {
    $(".menu-staffing-basic-information").addClass('active');
    $("#searchKey").val($.getUrlParam(window.location.href, "searchKey"));

    /* ------ Create Start ------*/
    $(".create").click(function() {
        $("#modalDialog-Create").modal("show");
    });

    $("#btnCreate").click(function() {
        var formdata = $("#frmStaffingBasicInformation").serialize();
        $.ajax({
            url: "actions/create-staffingBasicInformation.aspx?ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo") + "&Type=" + $.getUrlParam(window.location.href, "Type"),
            type: "post",
            datatype: "json",
            data: formdata,
            success: function(d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                }
                $("#modalDialog-Create").modal("hide");
                window.location.reload();
            },
            error: function(e) {
                ;
            }
        });
    });
    /* ------ Create End ------*/

    /* ------ Edit Start ------*/
    $(".edit").click(function() {
        $("#editId").val($(this).parent().parent().parent().find("td:eq(0)").html());
        var employeeId = $(this).parent().parent().parent().find("td:eq(2)").text();
        $.ajax({
            url: "actions/GetStaffingBasicInformation.aspx?EmployeeId=" + employeeId,
            type: "post",
            datatype: "json",
            success: function(d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                } else {
                    $("#editPosition").val(json.Position);
                    $("#editEmployeeId").val(json.EmployeeId);
                    $("#editPeople").val(json.PeopleName);
                    $("#editOffice").val(json.Office);
                    $("#editDiscipline").val(json.Dispiline);
                    $("#editTitle").val(json.Title);
                    $("#editCompany").val(json.Company);
                    $("#editSellingRate").val(json.SellingRate);
                    $("#editUnit").val(json.Unit);
                    $("#modalDialog-Update").modal("show");
                }

            },
            error: function(e) {
                ;
            }
        });

        $("#modalDialog-Update").modal("show");
    });

    $("#btnUpdate").click(function() {
        var formdata = $("#frmStaffingBasicInformation").serialize();
        $.ajax({
            url: "actions/edit-staffingBasicInformation.aspx",
            type: "post",
            datatype: "json",
            data: formdata,
            success: function(d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                }
                $("#modalDialog-Update").modal("hide");
                window.location.reload();
            },
            error: function(e) {
                ;
            }
        });
    });

    /* ------ Edit End ------*/

    /* ------ Delete Start ------*/
    $(".delete").click(function() {
        var id = $(this).parent().parent().parent().find("td:eq(0)").html();
        $("#btnDelete").data("id", id);
        $("#modalDialog-delete").modal('toggle');
    });
    $("#btnDelete").click(function() {
        var id = $(this).data("id");
        $.ajax({
            url: "actions/delete-staffingBasicInformation.aspx?id=" + id,
            type: "post",
            datatype: "json",
            success: function(d) {
                //var rst = JSON.parse(d);
                //alert(rst.ErrorMessage);
                location.reload();
            },
            error: function(e) {
                alert("Error.");
            }
        });

        $("#modalDialog-delete").modal('toggle');

        return false;
    });

    /* ------ Delete End ------*/

    /* ------ 动态搜索联系人 Start ------*/
    $("#newEmployeeId").keyup(function() {
        var ownerId = $(this).attr("id");
        $.ajax({
            url: "../People/Actions/searchPeople.aspx?top=10&searchKey=" + $(this).val(),
            type: "post",
            success: function(d) {
                try {
                    $("#" + ownerId).next().html("");
                    var rst = JSON.parse(d);
                    if (rst.length === 0) return false;
                    var html = "<table class='table table-condensed table-hover' style='background-color:white;padding:0;margin:0; border:1px solid gray;'>";
                    $.each(rst, function(i, item) {
                        html += "<tr><td><a href='javascript:void(0);' class='search-result-item' data-owner='" + ownerId + "'>" + item.EmployeeId + "</a></td><td><a href='javascript:void(0);' class='search-result-item' data-owner='" + ownerId + "'>" + item.PeopleNameEn + "</a></td></tr>";
                    });
                    html += "</table>";
                    $("#" + ownerId).next().html(html);
                } catch (e) {
                    alert(e);
                }
                return false;
            }
        });

        return false;
    });

    $("body").on("click", ".search-result-item", function() {
        var ownerId = "#" + $(this).data("owner");
        $(ownerId).data("ownerid", $(this).parent().parent().find("td:eq(0) a").html());
        $(ownerId).data("ownername", $(this).parent().parent().find("td:eq(1) a").html());
        $(ownerId).val($(this).parent().parent().find("td:eq(0) a").html());
        $(this).parent().parent().parent().html("");

        if ($("#newEmployeeId").val() === "") {
            $("#newPeople").val("");
            $("#newOffice").val("");
            $("#newDiscipline").val("");
            $("#newTitle").val("");
            $("#newCompany").val("");
            return false;
        } else {
            $.ajax({
                url: "../People/actions/GetPeopleInfo.aspx?EmployeeId=" + $("#newEmployeeId").val(),
                type: "post",
                datatype: "json",
                success: function(d) {
                    try {
                        var json = JSON.parse(d);
                        $("#newPeople").val(json.PeopleName);
                        $("#newOffice").val(json.Office);
                        $("#newDiscipline").val(json.Dispiline);
                        $("#newTitle").val(json.Title);
                        $("#newCompany").val(json.Company);
                    } catch (ex) {
                        alert(ex.message);
                    }
                },
                error: function(e) {
                    alert(e);
                }
            });
            return false;
        }
        //console.log($("#searchKey").data("empid"));
        //console.log($("#searchKey").data("empname"));
    });

    /* ------ 动态搜索联系人 End ------*/

    /* ------ Search Start ------*/
    $("#btnSearch").click(function() {
        var url = $.removeLocationUrlParameter("searchKey");
        url = url + "&searchKey=" + encodeURIComponent($("#searchKey").val());
        window.location.href = url;
        return false;
    });
    /* ------ Search End ------*/
});
