<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Map Example</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.css" />
  <style>
    #map { height: 100vh; }
  </style>
</head>
<body>
    <input type="hidden" id="lat" value="<%=request.getParameter("lat")%>"/>
    <input type="hidden" id="lon" value="<%=request.getParameter("lon")%>"/>
  <div id="map"></div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.js"></script>
  <script>
    var latitude = document.getElementById("lat").value; // Replace with the desired latitude
    var longitude = document.getElementById("lon").value; // Replace with the desired longitude

    var map = L.map("map").setView([latitude, longitude], 12);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
      maxZoom: 18
    }).addTo(map);

    L.marker([latitude, longitude]).addTo(map);
  </script>
</body>
</html>
