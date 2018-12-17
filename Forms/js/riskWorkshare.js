$(function () {
    $(".save-change").click(function () {
        var url = "Actions/RiskWorkshareFormSaveChange.aspx?1=1";
        url += "&projectId=" + $("#projectId").val();
        url += "&subId=" + $("#subId").val();
        url += "&c1=" + $("#c1").is(':checked');
        url += "&c2=" + $("#c2").is(':checked');
        url += "&c3=" + $("#c3").is(':checked');
        url += "&c4=" + $("#c4").is(':checked');
        url += "&c5=" + $("#c5").is(':checked');
        url += "&c6=" + $("#c6").is(':checked');
        url += "&c7=" + $("#c7").is(':checked');
        url += "&c8=" + $("#c8").is(':checked');
        url += "&c9=" + $("#c9").is(':checked');
        url += "&c10=" + $("#c10").is(':checked');
        url += "&c11=" + $("#c11").is(':checked');
        url += "&c12=" + $("#c12").is(':checked');
        url += "&c13=" + $("#c13").is(':checked');
        url += "&c14=" + $("#c14").is(':checked');
        url += "&c15=" + $("#c15").is(':checked');
        url += "&c16=" + $("#c16").is(':checked');
        url += "&c17=" + $("#c17").is(':checked');
        url += "&c18=" + $("#c18").is(':checked');
        url += "&c19=" + $("#c19").is(':checked');
        url += "&c20=" + $("#c20").is(':checked');
        url += "&t1=" + $("#t1").val();
        url += "&t2=" + $("#t2").val();
        url += "&t3=" + $("#t3").val();
        url += "&t4=" + $("#t4").val();
        url += "&t5=" + $("#t5").val();
        url += "&t6=" + $("#t6").val();
        url += "&t7=" + $("#t7").val();
        url += "&t8=" + $("#t8").val();
        url += "&t9=" + $("#t9").val();
        url += "&t10=" + $("#t10").val();
        url += "&t11=" + $("#t11").data("empid");
        url += "&t12=" + $("#t12").val();
        url += "&t13=" + $("#t13").val();
        $.ajax(url, {
            type: "post",
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        alert(rst.ErrorMessage);
                    } else {
                        alert(rst.ErrorMessage);
                    }
                } catch (e) {
                    alert(e);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.responseText);
                //alert(jqXHR.status);
                //alert(jqXHR.readyState);
                //alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);
            }
        });
        return false;
    })

    $("#t11").keyup(function () {
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
        $(ownerId).data("empid", $(this).parent().parent().find("td:eq(0) a").html());
        $(ownerId).data("empname", $(this).parent().parent().find("td:eq(1) a").html());
        $(ownerId).val($(this).parent().parent().find("td:eq(1) a").html());
        $(this).parent().parent().parent().html("");
    });

    $(".ready-for-approval").click(function () {

        if ($("#t2").val() === "") {
            alert("[IEWO No.] is required.");
            return false;
        }
        if ($("#t3").val() === "") {
            alert("[Rev. No.] is required.");
            return false;
        }
        if ($("#t4").val() === "") {
            alert("[SO Project Title] is required.");
            return false;
        }
        if ($("#t5").val() === "") {
            alert("[Customer] is required.");
            return false;
        }
        if ($("#t6").val() === "") {
            alert("[Home Office] is required.");
            return false;
        }
        var isPass = false;
        if ($("#c1").val() == "true") isPass = true;
        if ($("#c2").val() != "true") isPass = true;
        if ($("#c3").val() != "true") isPass = true;
        if (!isPass)
        {
            alert("[Risk Classification] is required.");
            return false;
        }
        if ($("#t7").val() === "") {
            alert("[Project Location] is required.");
            return false;
        }
        if ($("#t8").val() === "") {
            alert("[SO Work Location] is required.");
            return false;
        }
        if ($("#t9").val() === "") {
            alert("[SO Scope] is required.");
            return false;
        }
        isPass = false;
        if ($("#c4").val() == "true") isPass = true;
        if ($("#c5").val() != "true") isPass = true;
        if ($("#c6").val() != "true") isPass = true;
        if (!isPass)
        {
            alert("[SO Proposal/Project Status] is required.");
            return false;
        }

        if ($("#t11").val() === "") {
            alert("[Project/Proposal Manager] is required.");
            return false;
        }

        $.ajax({
            url: 'Actions/RiskWorkshareFormReady4Approval.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val(),
            type: "post",
            datatype: "json",
            success: function () {
                alert("successful");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.responseText);
                //alert(jqXHR.status);
                //alert(jqXHR.readyState);
                //alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);
            }
        });

        return false;
    });

    $(".expediting").click(function () {
        $("#modalDialog-exediting-confirm").modal("show");

        return false;
    });
    $(".exediting-confirm").click(function () {
        $("#modalDialog-exediting-confirm").modal("hide");

        $.ajax({
            url: 'Actions/RiskWorkshareExediting.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val(),
            type: "post",
            datatype: "json",
            success: function () {
                alert("successful");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                ///alert(jqXHR.responseText);
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

    $(".reverse").click(function () {
        $.ajax({
            url: 'Actions/RiskWorkshareFormReverse.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                var rst = JSON.parse(d);
                if (rst.ErrorCode === "0") {
                    alert("successful");
                    window.location.reload();
                } else {
                    alert(rst.ErrorMessage);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.status);
            }
        });

        return false;
    });

    $(".menu-project").addClass("active");

    if ($("#islocked").val() === "1") {
        $(".save-change").remove();
        $(".ready-for-approval").remove();

        $('input').attr('readonly', 'readonly');
        $('input').attr('disabled', 'disabled');
        $('select').attr('disabled', 'disabled');
        $('textarea').attr('disabled', 'disabled');
        $('a').attr('disabled', 'disabled');
        $(".expediting").attr('disabled', false);
        $(".reverse").attr('disabled', false);
    }

    if ($("#isAllApproved").val() === "1") {
        $(".expediting").remove();
    }
})