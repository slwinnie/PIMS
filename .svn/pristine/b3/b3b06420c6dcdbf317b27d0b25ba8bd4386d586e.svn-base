$(function () {
    //读取当前SubId的详细信息
    $(".header tr:gt(0)").click(function () {
        $("#subId").val($(this).find("td:eq(0)").html());
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        $.ajax({
            url: "./Actions/ProposalJsonData.aspx?projectId=" + $("#projectId").val() + "&subId=" + $("#subId").val(),
            type: "post",
            datatype: "json",
            async: false,
            success: function (d) {
                try {
                    var json = JSON.parse(d);
                    $("#txtBusinessUnit").val(json.BusinessUnit);
                    $("#txtProjectId").val(json.ProjectId);
                    $("#txtBusinessLine").val(json.BusinessLine);
                    $("#txtOpportunityLeadSector").val(json.OpportunityLeadSector);
                    $("#txtProjectName").val(json.ProjectName);
                    $("#txtCustomer").val(json.Customer);
                    $("#txtProspectStatus").val(json.Status);
                    $("#txtBidDueDate").val(json.BidDueDate);
                    $("#txtAwardDate").val(json.AWardDate);
                    $("#txtGo").val(json.Go);
                    $("#txtGet").val(json.Get);
                    $("#txtWPCV").val(json.WorleyParsonsCV);
                    $("#txtWPEBIT").val(json.WorleyParsonsEBIT);
                    $("#txtEstimatedWork").val(json.EstimatedWork);
                    $("#txtContractDuration").val(json.ContractDuration);
                    $("#txtContractType").val(json.ContractType);
                    $("#txtBidOffice").val(json.BidOffice);
                    $("#txtFacilityLocationCountry").val(json.FacilityLocationCountry);
                    $("#txtWorkshareOffice").val(json.WorkshareOffices);
                    $("#txtScopes").val(json.Scopes);
                    $("#txtOpportunityLeadSubsector").val(json.OpportunityLeadSubsector);
                    $("#txtCustodian").val(json.Custodian);
                    $("#txtOpportunityPriority").val(json.OpportunityPriority);
                    $("#txtContractCurrency").val(json.ContractCurrency);
                    $("#txtProjectManager").val(json.ProjectManager);
                    $("#projectManagerId").val(json.ProjectManagerId);

                    $("#txtBidSubmitDate").val(json.BidSubmitDate);
                    $("#txtBidApproveDate").val(json.BidApproveDate);
                    $("#txtRiskSubmitDate").val(json.RiskSubmitDate);
                    $("#txtRiskApproveDate").val(json.RiskApproveDate);
                    $("#txtPifSubmitDate").val(json.NPISSubmitDate);
                    $("#txtpifApproveDate").val(json.NPISApproveDate);
                    $("#txtProjectManagerId").val(json.ProjectManager);
                    $("#txtProjectManagerId").data("pmid", json.ProjectManagerId);

                } catch (e) {
                    alert(e);
                }
            },
            error: function () {
                alert("e");
            }
        });
    });
    // 保存变更
    $("#SaveChange").click(function () {
        var param = $("#form1").serialize();
        if ($("#txtProjectId").val() === "") {
            alert("Please select a row first.");
            return false;
        }
        $.ajax({
            url: "./Actions/ProposalSaveChange.aspx?" + param,
            type: "post",
            datatype: "json",
            async: false,
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
            error: function () {
                alert("e");
            }
        });

        return false;
    });
    // 打开对话框
    $(".header td a:contains('Delete')").click(function () {
        var subId = $(this).parent().parent().parent().find("td:eq(0)").text();
        var $modal = $('#modalDialog');
        //$modal.draggable();
        $("#modalDialog").draggable({
            handle: ".modal-header"
        });
        $("#modalDialog").data("sender", $(this));
        $("#modalDialog").data("subid", subId);
        var $editProposalNo = $(this).parent().parent().parent().find("td:eq(1)").html();
        $("#editProposalNo").val($editProposalNo);
        $modal.modal("show");

        return false;
    });
    // 删除当前SUBID
    $("#btnDelete").click(function () {
        var $sender = $("#modalDialog").data("sender");
        var $subid = $("#modalDialog").data("subid");
        var projectId = $.getUrlParam(document.location.href, "projectId");
        $.ajax({
            url: "./Actions/DeleteProposalXSubId.aspx?projectId=" + projectId + "&subId=" + $subid,
            type: "post",
            datatype: "json",
            async: false,
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        $("#modalDialog").modal("hide");
                        $sender.parent().parent().parent().remove();
                        $("#SubIDList tr:last").click();

                    } else {
                        alert(rst.ErrorMessage);
                    }
                } catch (e) {
                    alert(e);
                }
            },
            error: function () {
                alert("Error.");
            }
        });

        return false;
    });
    // 动态格式化货币
    $("#txtWPCV, #txtEstimatedWork, #txtWPEBIT, #txtContractDuration").blur(function () {
        //console.log($(this).val());
        //console.log($(this).val().replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,'));
        $(this).val($(this).val().replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,'));

        return false;
    });
    $("#txtProjectManagerId").keyup(function () {
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
    $(".open-proposal").click(function () {
        var status = false;
        var subId = $(this).parent().parent().parent().find("td:eq(0)").text();
        $.ajax({
            url: "./Actions/OpenProposalCheck.aspx?projectId=" + $("#projectId").val() + "&subId=" + subId,
            type: "post",
            datatype: "json",
            async: false,
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        status = true;
                        return true;
                    } else {
                        alert(rst.ErrorMessage);
                        return false;
                    }
                } catch (e) {
                    alert(e);
                    return false;
                }
            },
            error: function () {
                alert("e");
                return false;
            }
        });
        return status;
    });
    $(".new-proposal").click(function () {
        var projectId = $.getUrlParam(document.location.href, "projectId");

        if (projectId === "") {
            alert("Please select a row first.");
            return false;
        }
        var isPrompt = false;
        $.ajax({
            url: "./Actions/GetMaxSubId.aspx?type=1&projectId=" + projectId ,
            type: "post",
            datatype: "json",
            async: false,
            success: function (d) {
                try {
                    if (d === "0") {
                        isPrompt = false;
                    } else {
                        isPrompt = true;
                    }
                } catch (e) {
                    alert(e);
                }
            },
            error: function () {
                alert("Error.");
                return false;
            }
        });
        if (isPrompt) {
            $("#modalDialog-new-proposal-confirm").modal('show');
            return false;
        } else {
            return true;
        }
    });
    $("#modalDialog-new-proposal-confirm .btn-success").click(function () {
        window.location.href = $(".new-proposal").attr("href");
    });

    // === 系统初始化 ===
    $(".menu-project").addClass("active");
    $(".header tr:last").click();

});

