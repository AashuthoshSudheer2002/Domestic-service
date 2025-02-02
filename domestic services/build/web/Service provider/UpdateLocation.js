function updateLocation()
{
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
    } else {
        console.log("Geolocation is not supported by this browser.");
    }

    function successCallback(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
         $.ajax({url:"../Assets/AjaxPages/AjaxLocation.jsp?latitude="+latitude+"&longitude="+longitude,
                                success: function(result){
                                    alert('updated');
                                }
                            });
    }

    function errorCallback(error) {
        console.log("Error occurred: " + error.message);
    }

}