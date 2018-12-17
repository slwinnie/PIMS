$(function () {
    $(".menu-project-contact-list").addClass('active');
    /* ------ 动态搜索联系人 Start ------*/
    $("#newEmployeeId").keyup(function () {
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
                success: function (d) {
                    try {
                        var json = JSON.parse(d);
                        $("#newPeople").val(json.PeopleName);
                        $("#newOffice").val(json.Office);
                        $("#newDiscipline").val(json.Dispiline);
                        $("#newTitle").val(json.Title);
                        $("#newCompany").val(json.Company);
                        $("#newPhone").val(json.Phone);
                        $("#newEmail").val(json.Email);
                    } catch (ex) {
                        alert(ex.message);
                    }
                },
                error: function (e) {
                    alert(e);
                }
            });
            return false;
        }
        //console.log($("#searchKey").data("empid"));
        //console.log($("#searchKey").data("empname"));
    });
    /* ------ 动态搜索联系人 End ------*/
})