<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 80%
}
</style>
    <?php
				// get the base URL and pass it in a Javascript Variable
				echo "<script type=\"text/javascript\">";
				echo "var serverURL = '" . base_url () . "index.php/'";
				echo "</script>";
				?>
    <script type="text/javascript"
	src="<?php echo base_url()?>JS/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		initialize();
		//alert(serverURL);
	});
    </script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBg79whAPOTQQuMzD6pajW8Cbx_VgrgWcE&sensor=false">
    </script>

<script type="text/javascript">
    function initialize() 
    {  
      var myOptions = 
          {
            zoom: 4,
            center: new google.maps.LatLng(1,1) ,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            streetViewControl: true
          }; 
		//alert(serverURL);
       var url = serverURL+'Company/company_users/all_terminals';

		$.ajax({
				url:url,
				success: function(data){
					//alert(data);
					var d = JSON.parse(data);
					 map= new google.maps.Map(document.getElementById("map_canvas"), myOptions);
				        var bounds=new google.maps.LatLngBounds();
				        infowindow = new google.maps.InfoWindow({
				                        content: 'oi'
				                      });
				       
				        $.each(d, function(index, c) {   
							//alert(c.latitude);
				          var latlng = new google.maps.LatLng(c.latitude,c.longitude); 

				          var marker = new google.maps.Marker({
				                          map: map,
				                          position: latlng,
				                          title:'Terminal: '+c.terminal_name
				                      });
				          bounds.extend(latlng);

				          google.maps.event.addListener(marker, 'click', function() {
				              infowindow.close();
				              infowindow.setContent(c.terminal_name);
				              infowindow.open(map, marker);
				          });


				    });//close each
				    map.fitBounds(bounds);
				}
			});
      	/*
      $.getJSON(url, function(data) {

        map= new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        var bounds=new google.maps.LatLngBounds();
        infowindow = new google.maps.InfoWindow({
                        content: 'oi'
                      });
       
        $.each(data, function(index, c) {   
			alert(c.fields['latitude']);
          var latlng = new google.maps.LatLng(c.fields['latitude'],c.fields['longitude']); 

          var marker = new google.maps.Marker({
                          map: map,
                          position: latlng,
                          title:'pk:'+c.pk
                      });
          bounds.extend(latlng);

          google.maps.event.addListener(marker, 'click', function() {
              infowindow.close();
              infowindow.setContent('pk:'+c.pk);
              infowindow.open(map, marker);
          });


    });//close each
    map.fitBounds(bounds);
    });//close getjson
	*/
      	
    }//close initialize
    </script>


<script type="text/javascript">
    
    </script>
</head>
<body>
	<div id="map_canvas" style="width: 100%; height: 100%"></div>

</body>
</html>