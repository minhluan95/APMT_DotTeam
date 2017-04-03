﻿$('#btnClose').click(function (e) {
    clear();
    $("#Add_New_Modal").modal('hide');
});
function clear() {
    $("#somevalue").val("");
    $("#txtResult").text("");
}
function setProAdmin(id) {
    $.ajax({
        url: "/Systems/User/setProAdministrator/" + id,
        datatype: "json",
        success: function (response) {
            console.log(response.isAdministrator);
        }
    });
}
function setStatus(id) {
    $.ajax({
        url: "/Systems/User/setStatus/" + id,
        success: function (response) {
            console.log(response);
        }
    });
}


