$(function() {
    $(".menu-my").addClass("active");

    $(".save").click(function() {
        $.ajax({
            url: "Actions/EditUser.aspx?account=" + $("#account").val()
                + "&email=" + $("#email").val(),
            type: "post",
            success: function (d) {
                var json = JSON.parse(d);
                alert(json.ErrorMessage);
                return false;
            },
            error: function(e) {
                alert("Error.");
            }
        });

        return false;
    });
})