$(function () {
    $(".menu-manpowermanagement").addClass("active");

    $("a.emp").click(function () {
        $(this).parent().parent().siblings().find('td').removeClass('selected-td');
        $(this).parent().parent().find('td').addClass('selected-td');
        var pfy = getQueryString('fy');
        var pownerId = getQueryString('ownerId');
        location.href = "Default.aspx?ownerId=" + pownerId + "&fy=" + pfy + "&empId=" + $(this).data('id');
    })
})


function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var reg_rewrite = new RegExp("(^|/)" + name + "/([^/]*)(/|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    var q = window.location.pathname.substr(1).match(reg_rewrite);
    if (r != null) {
        return unescape(r[2]);
    } else if (q != null) {
        return unescape(q[2]);
    } else {
        return null;
    }
}