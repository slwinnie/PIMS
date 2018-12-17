$(function () {
    $(".menu-changepassword").addClass("active");

    $(".changePassword").click(function () {
        var bootstrapValidator = $("#form1").data('bootstrapValidator');
        bootstrapValidator.validate();

        if (bootstrapValidator.isValid()) {
            var param = "oldPassword=" + $("#oldPassword").val() + "&newPassword=" + $("#newPassword").val();
            $.ajax({
                url: "Actions/ChangePassword.aspx?" + param,
                type: "post",
                success: function (d) {
                    var json = JSON.parse(d);
                    if (json.ErrorCode === "0") {
                        location.href = '../Default.aspx';
                    } else {
                        alert(json.ErrorMessage);
                    }
                    
                    return false;
                },
                error: function (e) {
                    console.log(e);
                }
            });
        } else {

        }
        return false;
    });
    $('#form1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {/*输入框不同状态，显示图片的样式*/
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {/*验证*/
            oldPassword: {
                message: 'Invalid Old Password',
                validators: {
                    stringLength: {
                        min: 0,
                        max: 16,
                        message: 'Old Password valid length is between 0 and 16'
                    }
                }
            },
            newPassword: {
                message: 'Invalid New Password',
                validators: {
                    notEmpty: {
                        message: 'New Password is required.'
                    },
                    stringLength: {
                        min: 6,
                        max: 16,
                        message: 'New Password valid length is between 6 and 16'
                    }
                }
            },
            newPassword2: {
                message: 'Invalid New Password Again',
                validators: {
                    notEmpty: {
                        message: 'New Password Again is required.'
                    },
                    identical: {//相同
                        field: 'newPassword',
                        message: 'Two inconsistencies in cipher input.'
                    },
                    stringLength: {
                        min: 6,
                        max: 16,
                        message: 'New Password Again valid length is between 6 and 16'
                    }
                }
            }
        }
    });
    
})