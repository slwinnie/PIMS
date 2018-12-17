$(function() {
    
    /* ------ Create Start ------*/
    $(".create").click(function () {
        $("#modalDialog-Create").modal("show");
    });

    $("#btnCreate").click(function () {
        var formdata = $("#form1").serialize();
        console.log(formdata);
        $.ajax({
            url: "actions/create-staffingPanDetail.aspx?ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "Type")
                + "&WBS=" + $.getUrlParam(window.location.href, "WBS"),
            type: "post",
            datatype: "json",
            data: formdata,
            success: function (d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                }
                $("#modalDialog-Create").modal("hide");
                window.location.reload();
            },
            error: function (e) {
                ;
            }
        });
    });
    /* ------ Create End ------*/
    /* ------ Edit Start ------*/
    $(".edit").click(function () {
        $("#editEmployee").val($(this).parent().parent().parent().find("td:eq(3)").text());
        $("#editPosition").val($(this).parent().parent().parent().find("td:eq(2)").text());
        var html = $(this).parent().parent().parent().find("td");
        console.log(html);
        console.log("length" + $(html).length);
        $(html).each(function (index, item) {
            console.log(index + "-" + $(item).text());
            if (index >= 7 && index < $(html).length) {
                $(".edit-year-month-field input:eq(" + (index - 7) + ")").val($(item).text());
            }
        });

        $("#modalDialog-Edit").modal("show");
    });

    $("#btnEdit").click(function () {
        var formdata = $("#form1").serialize();
        $.ajax({
            url: "actions/edit-staffingPlanDetail.aspx?1=1"
                + "&ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "Type")
                + "&WBS=" + $.getUrlParam(window.location.href, "WBS"),
            type: "post",
            datatype: "json",
            data: formdata,
            success: function (d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                }
                $("#modalDialog-Edit").modal("hide");
                window.location.reload();
            },
            error: function (e) {
                ;
            }
        });
    });

    /* ------ Edit End ------*/
    /* ------ Delete Start ------*/
    $(".delete").click(function () {
        var empid = $(this).parent().parent().parent().find("td:eq(3)").html();
        $("#btnDelete").data("empid", empid);
        $("#modalDialog-delete").modal('toggle');
    });
    $("#btnDelete").click(function () {
        var employeeId = $(this).data("empid");
        $.ajax({
            url: "actions/delete-staffingPlanDetail.aspx?1=1"
                + "&ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "Type")
                + "&WBS=" + $.getUrlParam(window.location.href, "WBS")
                + "&EmployeeId=" + employeeId
            ,
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
    /* ------ Delete End ------*/

    $("#newEmployee").blur(function() {
        var id = $(this).val();
        console.log(id);
        $.ajax({
            url: "actions/GetStaffingBasicInformation.aspx?ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "Type")
                + "&EmployeeId=" + id,
            type: "post",
            datatype: "json",
            success: function (d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                }
                $("#newPosition").val(json.Position);
            },
            error: function (e) {
                ;
            }
        });
    });
})