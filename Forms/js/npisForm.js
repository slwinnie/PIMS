$(function () {
    $(".save-change").click(function () {
        var url = "Actions/NPISFormSaveChange.aspx?1=1";
        url += "&projectId=" + $("#projectId").val();
        url += "&subId=" + $("#subId").val();
        url += "&type=" + $("#type").val();
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
        url += "&t1=" + $("#t1").val();
        url += "&t2=" + $("#t2").val();
        url += "&t3=" + $("#t3").val();
        url += "&t4=" + $("#t4").val();
        url += "&t5=" + $("#t5").val();
        //url += "&t6=" + $("#t6").val();
        url += "&t7=" + $("#t7").val();
        url += "&t8=" + $("#t8").val();
        url += "&t9=" + $("#t9").val();
        url += "&t10=" + $("#t10").val();
        url += "&t11=" + $("#t11").val();
        url += "&t12=" + $("#t12").val();
        url += "&t13=" + $("#t13").val();
        url += "&t14=" + encodeURIComponent($("#t14").val());
        url += "&t15=" + $("#t15").val();
        url += "&t16=" + encodeURIComponent($("#t16").val());
        url += "&t17=" + encodeURIComponent($("#t17").val());
        url += "&t18=" + $("#t18").val();
        url += "&t19=" + $("#t19").val();
        url += "&t20=" + $("#t20").val();
        url += "&t21=" + $("#t21").val();
        url += "&t22=" + $("#t22").val();
        url += "&t23=" + $("#t23").val();
        //url += "&t24=" + $("#t24").val();
        //url += "&t25=" + $("#t25").val();
        url += "&t26=" + $("#t26").val();
        url += "&t27=" + $("#t27").val();
        url += "&t28=" + $("#t28").val();
        url += "&t29=" + $("#t29").val();
        url += "&t30=" + $("#t30").val();
        url += "&t31=" + $("#t31").val();
        url += "&t32=" + $("#t32").val();
        url += "&t33=" + $("#t33").val();
        url += "&t34=" + $("#t34").val();
        url += "&t35=" + $("#t35").val();
        url += "&t36=" + $("#t36").val();
        url += "&t37=" + $("#t37").val();
        url += "&t38=" + $("#t38").val();
        url += "&t39=" + $("#t39").val();
        url += "&t40=" + $("#t40").val();
        url += "&t41=" + $("#t41").val();
        url += "&t42=" + $("#t42").val();
        url += "&t43=" + $("#t43").val();
        url += "&t44=" + $("#t44").val();
        url += "&t45=" + $("#t45").val();
        url += "&t46=" + $("#t46").val();
        url += "&t47=" + $("#t47").val();
        //console.log(":::" + $("#t48").val());
        url += "&t48=" + $("#t48").val();
        url += "&t49=" + $("#t49").val();
        url += "&t50=" + $("#t50").val();
        url += "&t51=" + $("#t51").val();
        url += "&t52=" + $("#t52").val();
        url += "&t53=" + $("#t53").val();
        url += "&t54=" + $("#t54").val();
        url += "&t55=" + $("#t55").val();
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
                //alert(jqXHR.responseText);
                alert(jqXHR.status);
                alert(jqXHR.readyState);
                alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);
            }
        });
        return false;
    });

    $(".ready-for-approval").click(function () {

        if ($("#t1").val() === "") {
            alert("[Project Start Date] is required.");
            return false;
        }
        if ($("#t2").val() === "-1") {
            alert("[Project Type] is required.");
            return false;
        }
        if ($("#t3").val() === "-1") {
            alert("[WP Contracting Entity or JV] is required.");
            return false;
        }
        if ($("#t4").val() === "-1") {
            alert("[Business Line] is required.");
            return false;
        }
        if ($("#t6").val() === "-1") {
            alert("[Industry Sector Number] is required.");
            return false;
        }
        if ($("#t7").val() === "") {
            alert("[Home Office Location] is required.");
            return false;
        }
        if ($("#t8").val() === "-1") {
            alert("[GBS Project Template] is required.");
            return false;
        }
        if ($("#t9").val() === "") {
            alert("[Project Title] is required.");
            return false;
        }
        if ($("#t12").val() === "-1") {
            alert("[Customer Type] is required.");
            return false;
        }
        if ($("#t13").val() === "-1") {
            alert("[Internal Entity] is required.");
            return false;
        }
        if ($("#t14").val() === "") {
            alert("[Customer Name] is required.");
            return false;
        }
        if ($("#t16").val() === "") {
            alert("[Bill to address] is required.");
            return false;
        }
        if ($("#t18").val() === "") {
            alert("[Estimated WP Hour] is required.");
            return false;
        }
        if ($("#t19").val() === "") {
            alert("[Estimated WP Revenue] is required.");
            return false;
        }
        if ($("#t20").val() === "-1") {
            alert("[Contract Currency] is required.");
            return false;
        }
        if ($("#t23").val() === "-1") {
            alert("[Project Risk Classification] is required.");
            return false;
        }
        if ($("#t24").val() === "") {
            alert("[Services Type] is required.");
            return false;
        }
        if ($("#t26").val() === "") {
            alert("[Existing WP Contract] is required.");
            return false;
        }
        if ($("#t29").val() === "") {
            alert("[Billing Type] is required.");
            return false;
        }
        if ($("#t30").val() === "") {
            alert("[Contractual basis for commencement of billable work] is required.");
            return false;
        }
        if ($("#t31").val() === "") {
            alert("[Project Manager] is required.");
            return false;
        }
        if ($("#t33").val() === "") {
            alert("[Project Accountant] is required.");
            return false;
        }
        if ($("#t35").val() === "") {
            alert("[Project Controller] is required.");
            return false;
        }
        if ($("#t39").val() === "" || $("#t39").val() === "-1") {
            alert("[Project Manager Name] is required.");
            return false;
        }
        if ($("#t40").val() === "" || $("#t40").val() === "-1") {
            alert("[Authorized Approval Signatory Name] is required.");
            return false;
        }
        if ($("#t45").val() === "" || $("#t40").val() === "-1") {
            alert("[Location Finance] is required.");
            return false;
        }
        var status = true;
        $.ajax({
            url: 'Actions/NpisCheck.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        // ====== Read for approval start ====== //
                        $.ajax({
                            url: 'Actions/NPISFormReady4Approval.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
                            type: "post",
                            datatype: "json",
                            success: function () {
                                alert("successful");
                                $(".ready-for-approval").attr("disabled", true);
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

                        // ====== Read for approval end   ====== //

                    } else {
                        alert(rst.ErrorMessage);
                        status = false;
                    }
                } catch (e) {
                    alert("Error::" + e);
                    status = false;
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.responseText);
                status = false;
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
            url: 'Actions/NPISFormExediting.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
            type: "post",
            datatype: "json",
            success: function () {
                alert("successful");
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

    $(".reverse").click(function () {
        $.ajax({
            url: 'Actions/NpisFormReverse.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                var rst = JSON.parse(d);
                if (rst.ErrorCode === "0") {
                    alert("successful");
                    window.location.reload();
                }else {
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

    $(".delete-attach-row").click(function() {
        $(".delete-attach").data("projectId", $(this).parent().parent().find("td:eq(0) span:eq(0)").html());
        $(".delete-attach").data("subId", $(this).parent().parent().find("td:eq(0) span:eq(1)").html());
        $(".delete-attach").data("type", $(this).parent().parent().find("td:eq(0) span:eq(2)").html());
        $(".delete-attach").data("seq", $(this).parent().parent().find("td:eq(0) span:eq(3)").html());

        $("#modalDialog-delete-attach").modal("show");
        return false;
     });

    $(".delete-attach").click(function() {
        //var projectId = $(this).parent().parent().find("td:eq(0) span:eq(0)").html();
        //var subId = $(this).parent().parent().find("td:eq(0) span:eq(1)").html();
        //var type = $(this).parent().parent().find("td:eq(0) span:eq(2)").html();
        //var seq = $(this).parent().parent().find("td:eq(0) span:eq(3)").html();

        var projectId = $(this).data("projectId");
        var subId = $(this).data("subId");
        var type = $(this).data("type");
        var seq = $(this).data("seq");
        $.ajax({
            url: 'Actions/NPISFormDeleteAttach.aspx?projectId=' + projectId
                + "&subId=" + subId
                + "&type=" + type
                + "&seq=" + seq,
            type: "post",
            datatype: "json",
            success: function (d) {
                $("#modalDialog-delete-attach").modal("toggle");
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        //alert(rst.ErrorMessage);
                        location.reload();

                    } else {
                        alert(rst.ErrorMessage);
                    }
                } catch (e) {
                    alert(e);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.responseText);
                alert(jqXHR.status);
                alert(jqXHR.readyState);
                alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                alert(textStatus);
                alert(errorThrown);

            }
        });
        return false;
    });

    $(".btn-add-attachment").click(function () {
        $("#modalDialog-add-attach").modal("show");
        return false;
    });

    $(".add-attach").click(function () {
        var frm = $("#frmUploadFile");

        if (frm.find('[type="file"]')[0].files.length === 0) {
            alert("File Name is required.");
            return false;
        }
        if ($("#no").val() === "") {
            alert("No is required.");
            return false;
        }
        if ($("#fuDesc").val() === "") {
            alert("Attach Description is required.");
            return false;
        }

        var formData = new FormData(),
        params = frm.serializeArray();
        formData.append("f", frm.find('[type="file"]')[0].files[0]); // 添加文件
        //$.each(files, function (i, file) {
        //    formData.append('uploadedFiles-' + i, file);
        //});

        $.each(params, function (i, val) {
            formData.append(val.name, val.value);
        });

        formData.append("projectId", $("#projectId").val());
        formData.append("subId", $("#subId").val());
        formData.append("type", $("#type").val());

        $.ajax({
            url: "Actions/NPISFormUploadFile.aspx",
            type: "post",
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (d) {
                try {
                    var rst = JSON.parse(d);
                    if (rst.ErrorCode === "0") {
                        //alert(rst.ErrorMessage);
                        location.reload();

                    } else {
                        alert(rst.ErrorMessage);
                    }
                } catch (e) {
                    alert(e);
                }
            }
        });
        return false;  // 阻止表单自动提交事件
    });

    // 动态格式化货币
    $("#t18, #t19， #t20, #t21").blur(function () {
        $(this).val($(this).val().replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,'));

        return false;
    });

    $("#t31, #t33, #t35, #t37, #t39, #t40").keyup(function () {
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

    $(".copyFromProposal").click(function () {
        $.ajax({
            url: "actions/NPISFormCopyFromProposal.aspx?projectId=" + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                var rst = JSON.parse(d);
                alert(rst.ErrorMessage);
            },
            error: function (e) {
                alert("error.");
            }
        });
    });

    if ($("#islocked").val() === "1") {
        $(".save-change").remove();
        $(".ready-for-approval").remove();

        $('input').attr('readonly', 'readonly');
        $('input').attr('disabled', 'disabled');
        // $('input').removeAttr("disabled");
        $('select').attr('disabled', 'disabled');
        $('textarea').attr('disabled', 'disabled');
        $('a').attr('disabled', 'disabled');
        $(".expediting").attr('disabled', false);
        $(".reverse").attr('disabled', false);
        $(".btn-add-attachment").remove();
        $(".delete-attach-row").remove();
    }
    if ($("#isAllApproved").val() === "1") {
        $(".expediting").remove();
    }
});