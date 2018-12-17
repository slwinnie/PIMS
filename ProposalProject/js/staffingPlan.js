$(function () {
    $(".menu-staffing-plan").addClass('active');
    $("#searchKey").val($.getUrlParam(window.location.href, "searchKey"));

    /* ------ Create Start ------*/
    $(".create").click(function () {
        $("#modalDialog-Create").modal("show");
    });

    $("#btnCreate").click(function () {
        var formdata = $("#form1").serialize();
        var ownerId = $("#newOwner").data("ownerid");
        console.log(ownerId);
        console.log($.getUrlParam(window.location.href, "ProjectNo"));
        $.ajax({
            url: "actions/create-staffingPlan.aspx?ownerId=" + ownerId
                + "&ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "Type"),
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
        var wbs = $(this).parent().parent().parent().find("td:eq(0)").text();
        var ownerId = $(this).parent().parent().parent().find("td:eq(5) span").text();
        //console.log(ownerId);
        $.ajax({
            url: "actions/GetStaffingPlan.aspx?WBS=" + wbs
                + "&ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "type")
            ,
            type: "post",
            datatype: "json",
            success: function (d) {
                var json = JSON.parse(d);
                if (json.ErrorCode !== "0") {
                    alert(json.ErrorMessage);
                } else {
                    $("#editWBS").val(json.WBS);
                    $("#editCTR").val(json.CTR);
                    $("#editBudgetHours").val(json.BudgetHours);
                    $("#editPlannedHours").val(json.PlannedHours);
                    $("#editActualHours").val(json.ActualHours);
                    $("#editOwner").val(json.Owner);
                    $("#editOwner").data("ownerid", json.OwnerId);
                    $("#editOwner").data("ownername", json.Owner);
                }
            },
            error: function (e) {
                //alert(e);
            }
        });

        $("#modalDialog-Edit").modal("show");
    });

    $("#btnEdit").click(function () {
        var formdata = $("#form1").serialize();
        $.ajax({
            url: "actions/edit-staffingPlan.aspx?"
                + "&ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "type")
                + "&editOwnerId=" + $("#editOwner").data("ownerid")
                + "&editCTR=" + $("#editCTR").val()
            ,
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
        var wbs = $(this).parent().parent().parent().find("td:eq(0) a").html();
        $("#btnDelete").data("wbs", wbs);
        $("#modalDialog-delete").modal('toggle');
    });
    $("#btnDelete").click(function () {
        var wbs = $(this).data("wbs");
        $.ajax({
            url: "actions/delete-staffingPlan.aspx?WBS=" + wbs
                + "&ProjectNo=" + $.getUrlParam(window.location.href, "ProjectNo")
                + "&Type=" + $.getUrlParam(window.location.href, "type")
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

    /* ------ 动态搜索联系人 Start ------*/
    $("#newOwner, #editOwner").keyup(function () {
        var ownerId = $(this).attr("id");
        $.ajax({
            url: "../People/Actions/searchPeople.aspx?top=10&searchKey=" + $(this).val(),
            type: "post",
            success: function (d) {
                try {
                    $("#" + ownerId).next().html("");
                    var rst = JSON.parse(d);
                    if (rst.length === 0) return false;
                    var html = "<table class='table table-condensed table-hover' style='background-color:white;padding:0;margin:0; border:1px solid gray;'>";
                    $.each(rst, function (i, item) {
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

    $("body").on("click", ".search-result-item", function () {
        var ownerId = "#" + $(this).data("owner");
        $(ownerId).data("ownerid", $(this).parent().parent().find("td:eq(0) a").html());
        $(ownerId).data("ownername", $(this).parent().parent().find("td:eq(1) a").html());
        $(ownerId).val($(this).parent().parent().find("td:eq(1) a").html());
        $(this).parent().parent().parent().html("");
        $("#newOwnerId").val($(this).parent().parent().find("td:eq(0) a").html());
        $("#editOwnerId").val($(this).parent().parent().find("td:eq(0) a").html());
        //console.log($("#searchKey").data("empid"));
        //console.log($("#searchKey").data("empname"));
    });
    /* ------ 动态搜索联系人 End ------*/

    /* ------ Search Start ------*/
    $("#btnSearch").click(function () {
        var url = $.removeLocationUrlParameter("searchKey");
        url = url + "&searchKey=" + encodeURIComponent($("#searchKey").val());
        window.location.href = url;
        return false;
    });
    /* ------ Search End ------*/
})