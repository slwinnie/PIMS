$(function () {
    $(".save-change").click(function () {
        //var type = $.getLocationHrefParam("type");
        //if (type === "1") {
        //    alert("proposal");
        //    return false;
        //}
        console.log("----");
        console.log($("#t13").val());
        console.log($("#t17").val());

        $("#t21").ChangeStyle();
        $("#t24").ChangeStyle();
        $("#t27").ChangeStyle();
        $("#t30").ChangeStyle();
        $("#t33").ChangeStyle();
        $("#t36").ChangeStyle();
        $("#t39").ChangeStyle();
        $("#t42").ChangeStyle();
        $("#t45").ChangeStyle();
        $("#t48").ChangeStyle();
        $("#t51").ChangeStyle();
        $("#t54").ChangeStyle();
        $("#t57").ChangeStyle();
        $("#t60").ChangeStyle();
        $("#t77").ChangeStyle();
        $("#t80").ChangeStyle();
        $("#t83").ChangeStyle();
        $("#projectRisk").ChangeStyle(); 

        var pr = "High";
        if ($("#t21").val() === "High"
            || $("#t24").val() === "High"
            || $("#t27").val() === "High"
            || $("#t30").val() === "High"
            || $("#t33").val() === "High"
            || $("#t36").val() === "High"
            || $("#t39").val() === "High"
            || $("#t42").val() === "High"
            || $("#t45").val() === "High"
            || $("#t45").val() === "High"
            || $("#t48").val() === "High"
            || $("#t51").val() === "High"
            || $("#t54").val() === "High"
            || $("#t57").val() === "High"
            || $("#t60").val() === "High"

            || $("#t77").val() === "High"
            || $("#t80").val() === "High"
            || $("#t83").val() === "High"
        ) {
            pr = "High";
        } else if ($("#t21").val() === "Moderate"
                || $("#t24").val() === "Moderate"
                || $("#t27").val() === "Moderate"
                || $("#t30").val() === "Moderate"
                || $("#t33").val() === "Moderate"
                || $("#t36").val() === "Moderate"
                || $("#t39").val() === "Moderate"
                || $("#t42").val() === "Moderate"
                || $("#t45").val() === "Moderate"
                || $("#t45").val() === "Moderate"
                || $("#t48").val() === "Moderate"
                || $("#t51").val() === "Moderate"
                || $("#t54").val() === "Moderate"
                || $("#t57").val() === "Moderate"
                || $("#t60").val() === "Moderate"

                || $("#t77").val() === "Moderate"
                || $("#t80").val() === "Moderate"
                || $("#t83").val() === "Moderate"
        ) {
            pr = "Moderate";
        } else {
            pr = "Low";
        }
        $("#projectRisk").val(pr);

        var url = "Actions/RiskFormSaveChange.aspx?1=1";
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

        url += "&t1=" + encodeURIComponent($("#t1").val());
        url += "&t2=" + encodeURIComponent($("#t2").val());
        url += "&t3=" + encodeURIComponent($("#t3").val());
        url += "&t4=" + encodeURIComponent($("#t4").val());
        url += "&t5=" + encodeURIComponent($("#t5").val());
        url += "&t6=" + encodeURIComponent($("#t6").val());
        url += "&t7=" + encodeURIComponent($("#t7").val());
        url += "&t8=" + encodeURIComponent($("#t8").val());
        url += "&t9=" + encodeURIComponent($("#t9").val());
        url += "&t10=" + encodeURIComponent($("#t10").val());
        url += "&t11=" + encodeURIComponent($("#t11").val());
        url += "&t12=" + encodeURIComponent($("#t12").val());
        url += "&t13=" + encodeURIComponent($("#t13").val());
        url += "&t14=" + encodeURIComponent($("#t14").val());
        url += "&t15=" + encodeURIComponent($("#t15").val());
        url += "&t16=" + encodeURIComponent($("#t16").val());
        url += "&t17=" + encodeURIComponent($("#t17").val());
        url += "&t18=" + encodeURIComponent($("#t18").val());
        url += "&t19=" + encodeURIComponent($("#t19").val());
        url += "&t20=" + encodeURIComponent($("#t20").val());
        url += "&t21=" + encodeURIComponent($("#t21").val());
        url += "&t22=" + encodeURIComponent($("#t22").val());
        url += "&t23=" + encodeURIComponent($("#t23").val());
        url += "&t24=" + encodeURIComponent($("#t24").val());
        url += "&t25=" + encodeURIComponent($("#t25").val());
        url += "&t26=" + encodeURIComponent($("#t26").val());
        url += "&t27=" + encodeURIComponent($("#t27").val());
        url += "&t28=" + encodeURIComponent($("#t28").val());
        url += "&t29=" + encodeURIComponent($("#t29").val());
        url += "&t30=" + encodeURIComponent($("#t30").val());
        url += "&t31=" + encodeURIComponent($("#t31").val());
        url += "&t32=" + encodeURIComponent($("#t32").val());
        url += "&t33=" + encodeURIComponent($("#t33").val());
        url += "&t34=" + encodeURIComponent($("#t34").val());
        url += "&t35=" + encodeURIComponent($("#t35").val());
        url += "&t36=" + encodeURIComponent($("#t36").val());
        url += "&t37=" + encodeURIComponent($("#t37").val());
        url += "&t38=" + encodeURIComponent($("#t38").val());
        url += "&t39=" + encodeURIComponent($("#t39").val());
        url += "&t40=" + encodeURIComponent($("#t40").val());
        url += "&t41=" + encodeURIComponent($("#t41").val());
        url += "&t42=" + encodeURIComponent($("#t42").val());
        url += "&t43=" + encodeURIComponent($("#t43").val());
        url += "&t44=" + encodeURIComponent($("#t44").val());
        url += "&t45=" + encodeURIComponent($("#t45").val());
        url += "&t46=" + encodeURIComponent($("#t46").val());
        url += "&t47=" + encodeURIComponent($("#t47").val());
        url += "&t48=" + encodeURIComponent($("#t48").val());
        url += "&t49=" + encodeURIComponent($("#t49").val());
        url += "&t50=" + encodeURIComponent($("#t50").val());
        url += "&t51=" + encodeURIComponent($("#t51").val());
        url += "&t52=" + encodeURIComponent($("#t52").val());
        url += "&t53=" + encodeURIComponent($("#t53").val());
        url += "&t54=" + encodeURIComponent($("#t54").val());
        url += "&t55=" + encodeURIComponent($("#t55").val());
        url += "&t56=" + encodeURIComponent($("#t56").val());
        url += "&t57=" + encodeURIComponent($("#t57").val());
        url += "&t58=" + encodeURIComponent($("#t58").val());
        url += "&t59=" + encodeURIComponent($("#t59").val());
        url += "&t60=" + encodeURIComponent($("#t60").val());
        url += "&t61=" + encodeURIComponent($("#t61").val());
        url += "&t62=" + encodeURIComponent($("#t62").val());
        url += "&t63=" + encodeURIComponent($("#t63").val());
        url += "&t64=" + encodeURIComponent($("#t64").val());
        url += "&t65=" + encodeURIComponent($("#t65").val());
        url += "&t66=" + encodeURIComponent($("#t66").val());
        url += "&t67=" + encodeURIComponent($("#t67").val());
        url += "&t68=" + encodeURIComponent($("#t68").val());
        url += "&t69=" + encodeURIComponent($("#t69").val());
        url += "&t70=" + encodeURIComponent($("#t70").val());
        url += "&t71=" + encodeURIComponent($("#t71").val());
        url += "&t72=" + encodeURIComponent($("#t72").val());
        url += "&t73=" + encodeURIComponent($("#t73").val());
        url += "&t74=" + encodeURIComponent($("#t74").val());
        url += "&t75=" + encodeURIComponent($("#t75").val());
        url += "&t76=" + encodeURIComponent($("#t76").val());

        url += "&t77=" + encodeURIComponent($("#t77").val());
        url += "&t78=" + encodeURIComponent($("#t78").val());
        url += "&t79=" + encodeURIComponent($("#t79").val());
        url += "&t80=" + encodeURIComponent($("#t80").val());
        url += "&t81=" + encodeURIComponent($("#t81").val());
        url += "&t82=" + encodeURIComponent($("#t82").val());
        url += "&t83=" + encodeURIComponent($("#t83").val());
        url += "&t84=" + encodeURIComponent($("#t84").val());
        url += "&t85=" + encodeURIComponent($("#t85").val());

        url += "&r1="  + encodeURIComponent($("#r1").val());
        url += "&r2="  + encodeURIComponent($("#r2").val());
        url += "&r3="  + encodeURIComponent($("#r3").val());
        url += "&r4="  + encodeURIComponent($("#r4").val());
        url += "&r5="  + encodeURIComponent($("#r5").val());
        url += "&r6="  + encodeURIComponent($("#r6").val());
        url += "&r7="  + encodeURIComponent($("#r7").val());
        url += "&r8="  + encodeURIComponent($("#r8").val());
        url += "&r9="  + encodeURIComponent($("#r9").val());
        url += "&r10=" + encodeURIComponent($("#r10").val());
        url += "&r11=" + encodeURIComponent($("#r11").val());
        url += "&r12=" + encodeURIComponent($("#r12").val());
        url += "&r13=" + encodeURIComponent($("#r13").val());
        url += "&r14=" + encodeURIComponent($("#r14").val());
        url += "&r15=" + encodeURIComponent($("#r15").val());
        url += "&r16=" + encodeURIComponent($("#r16").val());
        url += "&r17=" + encodeURIComponent($("#r17").val());
        url += "&r18=" + encodeURIComponent($("#r18").val());
        url += "&r19=" + encodeURIComponent($("#r19").val());
        url += "&r20=" + encodeURIComponent($("#r20").val());
        url += "&r21=" + encodeURIComponent($("#r21").val());

        url += "&r22=" + encodeURIComponent($("#r22").val());
        url += "&r23=" + encodeURIComponent($("#r23").val());
        url += "&r24=" + encodeURIComponent($("#r24").val());

        url += "&s1="  + encodeURIComponent($("#s1").val());
        url += "&s2="  + encodeURIComponent($("#s2").val());
        url += "&s3="  + encodeURIComponent($("#s3").val());
        url += "&s4="  + encodeURIComponent($("#s4").val());
        url += "&s5="  + encodeURIComponent($("#s5").val());
        url += "&s6="  + encodeURIComponent($("#s6").val());
        url += "&s7="  + encodeURIComponent($("#s7").val());
        url += "&s8="  + encodeURIComponent($("#s8").val());
        url += "&s9="  + encodeURIComponent($("#s9").val());
        url += "&s10=" + encodeURIComponent($("#s10").val());
        url += "&s11=" + encodeURIComponent($("#s11").val());
        url += "&s12=" + encodeURIComponent($("#s12").val());
        url += "&s13=" + encodeURIComponent($("#s13").val());
        url += "&s14=" + encodeURIComponent($("#s14").val());
        url += "&s15=" + encodeURIComponent($("#s15").val());
        url += "&s16=" + encodeURIComponent($("#s16").val());
        url += "&s17=" + encodeURIComponent($("#s17").val());
        url += "&s18=" + encodeURIComponent($("#s18").val());
        url += "&s19=" + encodeURIComponent($("#s19").val());
        url += "&s20=" + encodeURIComponent($("#s20").val());
        url += "&s21=" + encodeURIComponent($("#s21").val());

        url += "&s22=" + encodeURIComponent($("#s22").val());
        url += "&s23=" + encodeURIComponent($("#s23").val());
        url += "&s24=" + encodeURIComponent($("#s24").val());

        url += "&projectRisk=" + encodeURIComponent($("#projectRisk").val());
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
                //alert(jqXHR.readyState);
                //alert(jqXHR.statusText);
                /*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);
            }
        });
        return false;
    });

    $(".ready-for-approval").click(function () {
        if ($("#t1").val() === "") {
            alert("[Project/Proposal Name] is required.");
            return false;
        }
        if ($("#t2").val() === "") {
            alert("[Project/Proposal Description] is required.");
            return false;
        }
        //if ($("#t3").val() === "") {
        //    alert("[Project/Proposal Number] is required.");
        //    return false;
        //}
        if ($("#t4").val() === "") {
            alert("[Revision] is required.");
            return false;
        }
        if ($("#c1").is(':checked') === false
            && $("#c2").is(':checked') === false
            && $("#c3").is(':checked') === false) {
            alert("[Project/Proposal Stage] is required.");
            return false;
        }
        if ($("#c4").is(':checked') === false
            && $("#c5").is(':checked') === false
            && $("#c6").is(':checked') === false) {
            alert("[Business Line/s involved in the poject] is required.");
            return false;
        }

        //if ($("#t5").val() === "") {
        //    alert("[PROPOSAL STAGE] is required.");
        //    return false;
        //}
        //if ($("#t9").val() === "") {
        //    alert("[PROJECT AWARD, NEW PHASE, or SIGNIFICANT CHANGE] is required.");
        //    return false;
        //}
        //if ($("#t13").val() === "") {
        //    alert("[ALL Risk Classification Forms] is required.");
        //    return false;
        //}
        //if ($("#t17").val() === "") {
        //    alert("[ALL High Risk Classifications] is required.");
        //    return false;
        //}

        var type = $.getLocationHrefParam("type");
        if (type === "1") {
            if ($("#t5").val() === "") {
                alert("PROPOSAL STAGE is required.");
                return false;
            }
        }
        else if (type === "2") {
            if ($("#t9").val() === "") {
                alert("PROJECT AWARD, NEW PHASE, or SIGNIFICANT CHANGE is required.");
                return false;
            }
        }

        if ($("#t13").val() === "") {
            alert("All Risk Classification Forms is required.");
            return false;
        }
        if ($("#projectRisk").val() === "High") {
            if ($("#t17").val() === "") {
                alert("All High Risk Classifications is required.");
                return false;
            }
        }

        if ($("#t21").val() === "") {
            alert("[Health, Safety & Environment (HSE)] is required.");
            return false;
        }
        if ($("#t24").val() === "") {
            alert("[R3 (Security & Emergency) & Travel] is required.");
            return false;
        }
        if ($("#t27").val() === "") {
            alert("[Contract Size] is required.");
            return false;
        }
        if ($("#t30").val() === "") {
            alert("[Delegation of Authority] is required.");
            return false;
        }
        if ($("#t33").val() === "") {
            alert("[Customer Credit Worthiness] is required.");
            return false;
        }
        if ($("#t36").val() === "") {
            alert("[Cash Flow] is required.");
            return false;
        }
        if ($("#t39").val() === "") {
            alert("[Capital Cost Estimating] is required.");
            return false;
        }
        if ($("#t42").val() === "") {
            alert("[Contract Terms and Conditions] is required.");
            return false;
        }
        if ($("#t45").val() === "") {
            alert("[Core Competency] is required.");
            return false;
        }
        if ($("#t48").val() === "") {
            alert("[Construction Management] is required.");
            return false;
        }
        if ($("#t51").val() === "") {
            alert("[Partners] is required.");
            return false;
        }
        if ($("#t54").val() === "") {
            alert("[Procurement of goods and sub-contracts / contracts for services] is required.");
            return false;
        }
        if ($("#t57").val() === "") {
            alert("[Media or Public Interest] is required.");
            return false;
        }
        if ($("#t60").val() === "") {
            alert("[Trade Sanctions] is required.");
            return false;
        }

        if ($("#r15").val() === "") {
            alert("[Tax] is required.");
            return false;
        }
        if ($("#r16").val() === "") {
            alert("[Exchange Rate] is required.");
            return false;
        }
        if ($("#r17").val() === "") {
            alert("[Confidentiality Agreement] is required.");
            return false;
        }
        if ($("#r18").val() === "") {
            alert("[Deferred Revenue] is required.");
            return false;
        }
        if ($("#r19").val() === "") {
            alert("[Facilitation Payments] is required.");
            return false;
        }
        if ($("#r20").val() === "") {
            alert("[New Jurisdiction] is required.");
            return false;
        }
        if ($("#r21").val() === "") {
            alert("[Nuclear] is required.");
            return false;
        }
        if ($("#r22").val() === "") {
            alert("[Ethical business practices] is required.");
            return false;
        }
        if ($("#r23").val() === "") {
            alert("[Carbon emissions] is required.");
            return false;
        }
        if ($("#r24").val() === "") {
            alert("[Social Licence] is required.");
            return false;
        }
        $.ajax({
            url: 'Actions/Risk1FormReady4Approval.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
            type: "post",
            datatype: "json",
            success: function () {
                alert("success");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                //alert(jqXHR.responseText);
                alert(jqXHR.status);
                //alert(jqXHR.readyState);
                //alert(jqXHR.statusText);
                ///*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);

            }
        });
    });

    $(".expediting").click(function () {
        $("#modalDialog-exediting-confirm").modal("show");

        return false;
    });

    $(".exediting-confirm").click(function () {
        $("#modalDialog-exediting-confirm").modal("hide");

        $.ajax({
            url: 'Actions/RiskFormExediting.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
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
                ///*弹出其他两个参数的信息*/
                //alert(textStatus);
                //alert(errorThrown);

            }
        });

        return false;
    });
    // 弹出选择框   Health, Safety & Environment (HSE)
    $(".Health").click(function() {
        $("#modalDialog-Health").modal("show");
    });
    $(".SelHealth").click(function () {
        $("#s1").val($(this).text());
        $("#r1").val($(this).parent().next().text());
        $("#t21").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-Health").modal("hide");
        $("#t21").ChangeStyle();
    });

    // 弹出选择框   R3 (Security & Emergency) & Travel
    $(".R3").click(function() {
        $("#modalDialog-R3").modal("show");
    });
    // 选择行
    $(".SelR3").click(function () {
        $("#s2").val($(this).text());
        $("#r2").val($(this).parent().next().text());
        $("#t24").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t24").ChangeStyle();
        $("#modalDialog-R3").modal("hide");
    });

    // 弹出选择框   Contract Size
    $(".ContractSize").click(function () {
        $("#modalDialog-ContractSize").modal("show");
    });
    // 选择行
    $(".SelContractSize").click(function () {
        $("#s3").val($(this).text());
        $("#r3").val($(this).parent().next().text());
        $("#t27").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t27").ChangeStyle();
        $("#modalDialog-ContractSize").modal("hide");
    });

    // 弹出选择框 Delegation of Authority
    $(".Delegation").click(function () {
        $("#modalDialog-Delegation").modal("show");
    });
    // 选择行
    $(".SelDelegation").click(function () {
        $("#s4").val($(this).text());
        $("#r4").val($(this).parent().next().text());
        $("#t30").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t30").ChangeStyle();
        $("#modalDialog-Delegation").modal("hide");
    });

    // 弹出选择框 Customer Credit Worthiness
    $(".CustomerCredit ").click(function () {
        $("#modalDialog-CustomerCredit").modal("show");
    });
    // 选择行
    $(".SelCustomerCredit").click(function () {
        $("#s5").val($(this).text());
        $("#r5").val($(this).parent().next().text());
        $("#t33").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t33").ChangeStyle();
        $("#modalDialog-CustomerCredit").modal("hide");
    });

    // 弹出选择框 Cash Flow
    $(".CashFlow ").click(function () {
        $("#modalDialog-CashFlow").modal("show");
    });
    // 选择行
    $(".SelCashFlow").click(function () {
        $("#s6").val($(this).text());
        $("#r6").val($(this).parent().next().text());
        $("#t36").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t36").ChangeStyle();
        $("#modalDialog-CashFlow").modal("hide");
    });

    // 弹出选择框 Capital Cost Estimating
    $(".Capital ").click(function () {
        $("#modalDialog-Capital").modal("show");
    });
    // 选择行
    $(".SelCapital").click(function () {
        $("#s7").val($(this).text());
        $("#r7").val($(this).parent().next().text());
        $("#t39").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t39").ChangeStyle();
        $("#modalDialog-Capital").modal("hide");
    });

    // 弹出选择框 Contract Terms and Conditions
    $(".ContractTerms ").click(function () {
        $("#modalDialog-ContractTerms").modal("show");
    });
    // 选择行
    $(".SelContractTerms").click(function () {
        $("#s8").val($(this).text());
        $("#r8").val($(this).parent().next().text());
        $("#t42").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t42").ChangeStyle();
        $("#modalDialog-ContractTerms").modal("hide");
    });

    // 弹出选择框 Core Competency
    $(".CoreCompetency ").click(function () {
        $("#modalDialog-CoreCompetency").modal("show");
    });
    // 选择行
    $(".SelCoreCompetency").click(function () {
        $("#s9").val($(this).text());
        $("#r9").val($(this).parent().next().text());
        $("#t45").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t45").ChangeStyle();
        $("#modalDialog-CoreCompetency").modal("hide");
    });

    // 弹出选择框 Construction Management
    $(".ConstructionManagement ").click(function () {
        $("#modalDialog-ConstructionManagement").modal("show");
    });
    // 选择行
    $(".SelConstructionManagement").click(function () {
        $("#s10").val($(this).text());
        $("#r10").val($(this).parent().next().text());
        $("#t48").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t48").ChangeStyle();
        $("#modalDialog-ConstructionManagement").modal("hide");
    });

    // 弹出选择框 Partners
    $(".Partners ").click(function () {
        $("#modalDialog-Partners").modal("show");
    });
    // 选择行
    $(".SelPartners").click(function () {
        $("#s11").val($(this).text());
        $("#r11").val($(this).parent().next().text());
        $("#t51").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t51").ChangeStyle();
        $("#modalDialog-Partners").modal("hide");
    });

    // 弹出选择框 Procurement of goods and sub-contracts / contracts for services
    $(".Procurement").click(function () {
        $("#modalDialog-Procurement").modal("show");
    });
    // 选择行
    $(".SelProcurement").click(function () {
        $("#s12").val($(this).text());
        $("#r12").val($(this).parent().next().text());
        $("#t54").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t54").ChangeStyle();
        $("#modalDialog-Procurement").modal("hide");
    });

    // 弹出选择框 Media or Public Interest
    $(".MediaOrPublic").click(function () {
        $("#modalDialog-MediaOrPublic").modal("show");
    });
    // 选择行
    $(".SelMediaOrPublic").click(function () {
        $("#s13").val($(this).text());
        $("#r13").val($(this).parent().next().text());
        $("#t57").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t57").ChangeStyle();
        $("#modalDialog-MediaOrPublic").modal("hide");
    });

    // 弹出选择框 Trade Sanctions
    $(".TradeSanctions").click(function () {
        $("#modalDialog-TradeSanctions").modal("show");
    });
    // 选择行
    $(".SelTradeSanctions").click(function () {
        $("#s14").val($(this).text());
        $("#r14").val($(this).parent().next().text());
        $("#t60").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t60").ChangeStyle();
        $("#modalDialog-TradeSanctions").modal("hide");
    });

    // 弹出选择框 Tax
    $(".Tax").click(function () {
        $("#modalDialog-Tax").modal("show");
    });
    // 选择行
    $(".SelTax").click(function () {
        $("#s15").val($(this).text());
        $("#r15").val($(this).parent().next().text());
        $("#t63").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-Tax").modal("hide");
    });

    // 弹出选择框 Exchange Rate
    $(".ExchangeRate").click(function () {
        $("#modalDialog-ExchangeRate").modal("show");
    });
    // 选择行
    $(".SelExchangeRate").click(function () {
        $("#s16").val($(this).text());
        $("#r16").val($(this).parent().next().text());
        $("#t67").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-ExchangeRate").modal("hide");
    });

    // 弹出选择框 Confidentiality Agreement
    $(".ConfidentialityAgreement").click(function () {
        $("#modalDialog-ConfidentialityAgreement").modal("show");
    });
    // 选择行
    $(".SelConfidentialityAgreement").click(function () {
        $("#s17").val($(this).text());
        $("#r17").val($(this).parent().next().text());
        $("#t70").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-ConfidentialityAgreement").modal("hide");
    });

    // 弹出选择框 Deferred Revenue
    $(".DeferredRevenue").click(function () {
        $("#modalDialog-DeferredRevenue").modal("show");
    });
    // 选择行
    $(".SelDeferredRevenue").click(function () {
        $("#s18").val($(this).text());
        $("#r18").val($(this).parent().next().text());
        $("#t73").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-DeferredRevenue").modal("hide");
    });

    // 弹出选择框 Facilitation Payments
    $(".FacilitationPayments").click(function () {
        $("#modalDialog-FacilitationPayments").modal("show");
    });
    // 选择行
    $(".SelFacilitationPayments").click(function () {
        $("#s19").val($(this).text());
        $("#r19").val($(this).parent().next().text());
        $("#t76").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-FacilitationPayments").modal("hide");
    });

    // 弹出选择框 New Jurisdiction
    $(".NewJurisdiction").click(function () {
        $("#modalDialog-NewJurisdiction").modal("show");
    });
    // 选择行
    $(".SelNewJurisdiction").click(function () {
        $("#s20").val($(this).text());
        $("#r20").val($(this).parent().next().text());
        $("#t79").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-NewJurisdiction").modal("hide");
    });

    // 弹出选择框 Nuclear
    $(".Nuclear").click(function () {
        $("#modalDialog-Nuclear").modal("show");
    });
    // 选择行
    $(".SelNuclear").click(function () {
        $("#s21").val($(this).text());
        $("#r21").val($(this).parent().next().text());
        $("#t82").val($(this).parent().parent().find("td:eq(2)").text());
        $("#modalDialog-Nuclear").modal("hide");
    });
    // ----------------------------------------------------------------------------------------
    // 弹出选择框 EthicalBusinessPractices
    $(".EthicalBusinessPractices").click(function () {
        $("#modalDialog-EthicalBusinessPractices").modal("show");
    });
    // 选择行
    $(".SelEthicalBusinessPractices").click(function () {
        $("#s22").val($(this).text());
        $("#r22").val($(this).parent().next().text());
        $("#t77").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t77").ChangeStyle();
        $("#modalDialog-EthicalBusinessPractices").modal("hide");
    });

    // 弹出选择框 CarbonEmissions
    $(".CarbonEmissions").click(function () {
        $("#modalDialog-CarbonEmissions").modal("show");
    });
    // 选择行
    $(".SelCarbonEmissions").click(function () {
        $("#s23").val($(this).text());
        $("#r23").val($(this).parent().next().text());
        $("#t80").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t80").ChangeStyle();
        $("#modalDialog-CarbonEmissions").modal("hide");
    });

    // 弹出选择框 Nuclear
    $(".SocialLicence").click(function () {
        $("#modalDialog-SocialLicence").modal("show");
    });
    // 选择行
    $(".SelSocialLicence").click(function () {
        $("#s24").val($(this).text());
        $("#r24").val($(this).parent().next().text());
        $("#t83").val($(this).parent().parent().find("td:eq(2)").text());
        $("#t83").ChangeStyle();
        $("#modalDialog-SocialLicence").modal("hide");
    });
    // ----------------------------------------------------------------------------------------

    $("#t5, #t9, #t61, #t13, #t17").keyup(function () {
        var ownerId = $(this).attr("id");
        $.ajax({
            url: "../People/Actions/searchPeople.aspx?top=10&searchKey=" + $(this).val(),
            type: "post",
            success: function (d) {
                try {
                    $("#" + ownerId).next().html("");
                    var rst = JSON.parse(d);
                    if (rst.length === 0) return false;
                    var html = "<table class='table table-bordered1 table-condensed table-hover' style='background-color:white;padding:0;margin:0;border:1px solid gray;'>";
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

    $(".copyFromProposal").click(function() {
        $.ajax({
            url: "actions/RiskFormCopyFromProposal.aspx?projectId=" + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
            type: "post",
            datatype: "json",
            success: function (d) {
                var rst = JSON.parse(d);
                alert(rst.ErrorMessage);
            },
            error:function(e) {
                alert("error.");
            }
        });
    });

    $(".reverse").click(function () {
        $.ajax({
            url: 'Actions/RiskFormReverse.aspx?projectId=' + $("#projectId").val() + "&subId=" + $("#subId").val() + "&type=" + $("#type").val(),
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
});