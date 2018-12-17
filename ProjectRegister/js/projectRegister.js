$(function () {

    $(".menu-register").addClass("active");

    $(".Edit-Row").click(function() {
        var $sender = $("#modalDialog").data("sender");
        var projectId = $("#txtProjectId").val();
        var $this = $(this);
        $("#editCsg").val($this.parent().parent().parent().find("td:eq(1) span").data("id"));
        $("#editYear").val($this.parent().parent().parent().find("td:eq(2)").html());
        $("#editOffice").val($this.parent().parent().parent().find("td:eq(3) span").data("id"));
        $("#editPhase").val($this.parent().parent().parent().find("td:eq(4) span").data("id"));
        $("#editSerialNo").val($this.parent().parent().parent().find("td:eq(5)").html());
        $("#editProjectNo").val($this.parent().parent().parent().find("td:eq(6)").html());
        $("#editProposallNo").val($this.parent().parent().parent().find("td:eq(7)").html());
        $("#editClientOwner").val($this.parent().parent().parent().find("td:eq(8)").html());
        $("#editProjectName").val($this.parent().parent().parent().find("td:eq(9)").html());
        $("#editProjectDescription").val($this.parent().parent().parent().find("td:eq(10)").html());
        $("#editSow").val($this.parent().parent().parent().find("td:eq(11)").html());
        $("#editProjectLocation").val($this.parent().parent().parent().find("td:eq(12)").html());
        $("#editStartDate").val($this.parent().parent().parent().find("td:eq(13)").html());
        $("#editEndDate").val($this.parent().parent().parent().find("td:eq(14)").html());
        $("#editContractType").val($this.parent().parent().parent().find("td:eq(15)").html());
        $("#editType").val($this.parent().parent().parent().find("td:eq(16)").html());
        $("#editServiceType").val($this.parent().parent().parent().find("td:eq(17)").html());
        $("#editContractHolder").val($this.parent().parent().parent().find("td:eq(18)").html());
        $("#editCurrency").val($this.parent().parent().parent().find("td:eq(19)").html());
        $("#editCV").val($this.parent().parent().parent().find("td:eq(20)").html());
        $("#editProjectSize").val($this.parent().parent().parent().find("td:eq(21)").html());
        $("#editPm").val($this.parent().parent().parent().find("td:eq(22) span").data("id"));
        $("#editRisk").val($this.parent().parent().parent().find("td:eq(23)").html());
        $("#editHSEResponsibility").val($this.parent().parent().parent().find("td:eq(24)").html());
        $("#editProjectInformation").val($this.parent().parent().parent().find("td:eq(25)").html());
        $("#editAwardMonth").val($this.parent().parent().parent().find("td:eq(26)").html());
        $("#editCreatedBy").val($this.parent().parent().parent().find("td:eq(27)").html());
        $("#editModified").val($this.parent().parent().parent().find("td:eq(28)").html());
        $("#editCreated").val($this.parent().parent().parent().find("td:eq(29)").html());
        $("#editSponsor").val($this.parent().parent().parent().find("td:eq(30)").html());
        $("#editClosedDate").val($this.parent().parent().parent().find("td:eq(31)").html());
        $("#editProjectStatus").val($this.parent().parent().parent().find("td:eq(32)").html());
        $("#editManhours").val($this.parent().parent().parent().find("td:eq(33)").html());
        $("#editWorkshare").val($this.parent().parent().parent().find("td:eq(34)").html());
        $("#editFinalCV ").val($this.parent().parent().parent().find("td:eq(35)").html());
        $("#editFinalManhours").val($this.parent().parent().parent().find("td:eq(36)").html());
        $("#editCrmtId").val($this.parent().parent().parent().find("td:eq(37)").html());
        $("#editRegisteredDate").val($this.parent().parent().parent().find("td:eq(38)").html());
        $("#editCustomerContactName").val($this.parent().parent().parent().find("td:eq(39)").html());
        $("#editTelNo").val($this.parent().parent().parent().find("td:eq(40)").html());
        $("#editItemType").val($this.parent().parent().parent().find("td:eq(41)").html());

        $("#editEntity").val($this.parent().parent().parent().find("td:eq(42)").html());
        $("#editCategory").val($this.parent().parent().parent().find("td:eq(43)").html());
        $("#editClassification").val($this.parent().parent().parent().find("td:eq(44)").html());
        $("#editHSECategory").val($this.parent().parent().parent().find("td:eq(45)").html());

        $("#modalDialog").modal("show");

        return false;

    });

    $("#btnSave").click(function () {
        var paramUrl = $("#form1").serialize();
        var invalidParams = ['__VIEWSTATE', '__VIEWSTATEGENERATOR', '__EVENTVALIDATION'];
        paramUrl = RemoveUrlParameter(paramUrl, invalidParams);
        $.ajax({
            url: "Actions/ProjectRegisterSaveChange.aspx?" + paramUrl,
            type: "post",
            datatype: "json",
            async: false,
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        $("#modalDialog").modal("hide");
                        alert("OK");
                    } else {
                        alert(rst.ErrorMessage);
                    }
                } catch (e) {
                    alert('e1');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                //alert(jqXHR.responseText);
                alert(jqXHR.status);
                //alert(jqXHR.readyState);
                alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);
            }
        });
    });

    $(".Update-Row").click(function () {
        var $this = $(this);
        var crmtId = $this.parent().parent().parent().find("td:eq(37)").html();

        $.ajax({
            url: "Actions/ProjectUpdate2Timesheet.aspx?crmtid=" + crmtId,
            type: "post",
            datatype: "json",
            async: false,
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        $("#modalDialog").modal("hide");
                        alert("OK");
                    } else {
                        alert(rst.ErrorMessage);
                    }
                } catch (e) {
                    alert('e1');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                //alert(jqXHR.responseText);
                alert(jqXHR.status);
                //alert(jqXHR.readyState);
                alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);
            }
        });

        return false;
    });

    $(".Insert-Row").click(function () {
        var $this = $(this);
        var crmtId = $this.parent().parent().parent().find("td:eq(37)").html();

        $.ajax({
            url: "Actions/ProjectInsert2Timesheet.aspx?crmtid=" + crmtId,
            type: "post",
            datatype: "json",
            async: false,
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        $("#modalDialog").modal("hide");
                        alert("OK");
                    } else {
                        alert(rst.ErrorMessage);
                    }
                } catch (e) {
                    alert('e1');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                //alert(jqXHR.responseText);
                alert(jqXHR.status);
                //alert(jqXHR.readyState);
                alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);
            }
        });

        return false;
    });

    $("#editPm").keyup(function () {
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

});

// 删除url中某些参数
// var paramUrl = $("#form1").serialize();
// var invalidParams = ['__VIEWSTATE', '__VIEWSTATEGENERATOR', '__EVENTVALIDATION'];
function RemoveUrlParameter(paramUrl, invalidParams) {
    for (var j = 0; j < invalidParams.length; j++) {
        var param = invalidParams[j];
        if (paramUrl.indexOf(param) > -1) {
            var obj = {}
            var arr = paramUrl.split("&");
            for (var i = 0; i < arr.length; i++) {
                arr[i] = arr[i].split("=");
                obj[arr[i][0]] = arr[i][1];
            };
            delete obj[param];
            paramUrl = JSON.stringify(obj).replace(/[\"\{\}]/g, "").replace(/\:/g, "=").replace(/\,/g, "&");
        };
    }
    return paramUrl;
}