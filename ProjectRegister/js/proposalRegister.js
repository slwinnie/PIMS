$(function () {

    $(".menu-register").addClass("active");

    $(".Edit-Row").click(function () {
        var $sender = $("#modalDialog").data("sender");
        var projectId = $("#txtProjectId").val();
        var $this = $(this);
        $("#editCsg").val($this.parent().parent().parent().find("td:eq(1) span").data("id"));
        $("#editYear").val($this.parent().parent().parent().find("td:eq(2)").html());
        $("#editOffice").val($this.parent().parent().parent().find("td:eq(3) span").data("id"));
        $("#editPhase").val($this.parent().parent().parent().find("td:eq(4) span").data("id"));
        $("#editSerialNo").val($this.parent().parent().parent().find("td:eq(5)").html());
        $("#editProposalNo").val($this.parent().parent().parent().find("td:eq(6)").html());
        $("#editClientOwner").val($this.parent().parent().parent().find("td:eq(7)").html());
        $("#editProposalName").val($this.parent().parent().parent().find("td:eq(8)").html());
        $("#editProposalDescription").val($this.parent().parent().parent().find("td:eq(9)").html());
        $("#editSow").val($this.parent().parent().parent().find("td:eq(10)").html());
        $("#editToc").val($this.parent().parent().parent().find("td:eq(11)").html());
        $("#editCountry").val($this.parent().parent().parent().find("td:eq(12)").html());
        $("#editLocation").val($this.parent().parent().parent().find("td:eq(13)").html());
        $("#editHomh").val($this.parent().parent().parent().find("td:eq(14)").html());
        $("#editCurrency").val($this.parent().parent().parent().find("td:eq(15)").html());
        $("#editCV").val($this.parent().parent().parent().find("td:eq(16)").html());
        $("#editPC").val($this.parent().parent().parent().find("td:eq(17)").html());
        $("#editBDD").val($this.parent().parent().parent().find("td:eq(18)").html());
        $("#editDuration").val($this.parent().parent().parent().find("td:eq(19)").html());
        $("#editProposalManager").val($this.parent().parent().parent().find("td:eq(20) span").data("id"));
        $("#editGo").val($this.parent().parent().parent().find("td:eq(21)").html());
        $("#editGet").val($this.parent().parent().parent().find("td:eq(22)").html());
        $("#editTIC").val($this.parent().parent().parent().find("td:eq(23)").html());
        $("#editRisk").val($this.parent().parent().parent().find("td:eq(24)").html());
        $("#editBidBond").val($this.parent().parent().parent().find("td:eq(25)").html());
        $("#editEda").val($this.parent().parent().parent().find("td:eq(26)").html());
        $("#editCompetitors").val($this.parent().parent().parent().find("td:eq(27)").html());
        $("#editRemarks").val($this.parent().parent().parent().find("td:eq(28)").html());
        $("#editPersonResp").val($this.parent().parent().parent().find("td:eq(29)").html());
        $("#editModified").val($this.parent().parent().parent().find("td:eq(30)").html());
        $("#editReportDate").val($this.parent().parent().parent().find("td:eq(31)").html());
        $("#editHSEResponsibility").val($this.parent().parent().parent().find("td:eq(32)").html());
        $("#editStatus").val($this.parent().parent().parent().find("td:eq(33)").html());
        $("#editCustomerContactName").val($this.parent().parent().parent().find("td:eq(34)").html());
        $("#editTelNo").val($this.parent().parent().parent().find("td:eq(35)").html());
        $("#editCrmtId").val($this.parent().parent().parent().find("td:eq(36)").html());
        $("#editArchive").val($this.parent().parent().parent().find("td:eq(37)").html());
        $("#editItemType").val($this.parent().parent().parent().find("td:eq(38)").html());
        $("#editFillDate").val($this.parent().parent().parent().find("td:eq(39)").html());

        $("#editEntity").val($this.parent().parent().parent().find("td:eq(40)").html());
        $("#editCategory").val($this.parent().parent().parent().find("td:eq(41)").html());
        $("#editClassification").val($this.parent().parent().parent().find("td:eq(42)").html());
        $("#editHSECategory").val($this.parent().parent().parent().find("td:eq(43)").html());

        $("#modalDialog").modal("show");

        return false;

    });

    $("#btnSave").click(function () {
        var paramUrl = $("#form1").serialize();
        var invalidParams = ['__VIEWSTATE', '__VIEWSTATEGENERATOR', '__EVENTVALIDATION'];
        paramUrl = RemoveUrlParameter(paramUrl, invalidParams);
        $.ajax({
            url: "Actions/ProposalRegisterSaveChange.aspx?" + paramUrl,
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
        var crmtId = $this.parent().parent().parent().find("td:eq(36)").html();
        $.ajax({
            url: "Actions/ProposalUpdate2Timesheet.aspx?crmtid=" + crmtId,
            type: "post",
            datatype: "json",
            async: false,
            success: function(d) {
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
            error: function(jqXHR, textStatus, errorThrown) {
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
        //alert(crmtId);
        //alert("Update to timesheet system.");
    });
    $(".Insert-Row").click(function () {
        var $this = $(this);
        var crmtId = $this.parent().parent().parent().find("td:eq(36)").html();
        $.ajax({
            url: "Actions/ProposalInsert2Timesheet.aspx?crmtid=" + crmtId,
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

        alert("Release to timesheet system.");
    });

    $("#editProposalManager").keyup(function () {
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