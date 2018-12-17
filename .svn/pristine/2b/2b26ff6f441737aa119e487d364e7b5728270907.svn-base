//为jquery.serializeArray()解决radio,checkbox未选中时没有序列化的问题
$.fn.serializePlus = function () {
    var a = this.serializeArray();
    var $radio = $('input[type=radio],input[type=checkbox]', this);
    var temp = {};
    $.each($radio, function () {
        if (!temp.hasOwnProperty(this.name)) {
            if ($("input[name='" + this.name + "']:checked").length === 0) {
                temp[this.name] = "";
                a.push({ name: this.name, value: "" });
            }
        }
    });
    //console.log(a);
    return jQuery.param(a);
};