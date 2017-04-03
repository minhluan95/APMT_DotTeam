function setStatus(id) {
    $.ajax({
        url: "/Systems/Client/setStatus/" + id,
        success: function (response) {
            console.log(response);
        }
    });
}