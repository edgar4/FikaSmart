<div class="company">
	<div id="map_canvas" class="map_canvas"></div>

</div>
<div id="all_routes" style="display:none">
	<table id="all_routes_display" width="100%"></table>
</div>
<div id="save_route_details" style="display:none">
	<div id="display_route_details"></div>
	<div id="display_route_progress"></div>
	<hr>
	<label for="route_name">Route Name</label>
	<input type="text" placeholder="Route Name" id="route_name" name="route_name"/>
	<input type ="button" value="Save" id="proceed_save">	
</div>
<div class="admin">
	<?php 
	function terminals($name,$terminal_list){
		$t = "<select name='".$name."' id='".$name."'>";
		foreach($terminal_list as $value){
			$t .=  "<option id='".$value->id."' value='".$value->terminal_name."' lat='".$value->latitude."' lng='".$value->longitude."'>".$value->terminal_name."</option>";
		}
		$t .= "</select>";
		return $t;
	}
	echo "<ul>";
	echo "<li><label for=''>From</label></li>";
	echo "<li>";
	echo terminals("terminal_from", $terminal_list);
	echo "</li>";
	echo "<li><label for=''>To</label></li>";
	echo "<li>";
	echo terminals("terminal_to", $terminal_list);
	echo "</li>";
	?>
	<input type="button" id="show_route" value="Show Route" />
	<hr>
	
	<p id="route_info"></p>
	
	<input type="hidden" id="distance" name="distance" />
	<input type="hidden" id="duration" name="duration" />
	
	<div id="save_div">
		<input type="button" class="button_1" value="Save" id="save_route" disabled="disabled">
		<input type="button" class="button_1" value="View Routes" id="view_routes">
		</ul>
	</div>
</div>



</div>

<script type="text/javascript"
	src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script src="<?php echo base_url()."JS/add_routes.js"; ?>"></script>



		
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
			var directionDisplay;
			var directionsService = new google.maps.DirectionsService();
	
			function initialize() {
				var latlng = new google.maps.LatLng(-1.2369760196365676, 36.83018594609371);
				directionsDisplay = new google.maps.DirectionsRenderer();
				var settings = {
					zoom: 10,
					center: latlng,
					mapTypeControl: true,
					mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
					navigationControl: true,
					navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document.getElementById("map_canvas"), settings);
				directionsDisplay.setMap(map);
				
			}

			function calcRoute(start,end) {
				//alert(start);
				//alert(end);
				
				var request = {
					origin:start,
					destination:end,
					travelMode: google.maps.DirectionsTravelMode.DRIVING
				};
				
				directionsService.route(request, function(response, status) {
					if (status == google.maps.DirectionsStatus.OK) {
						directionsDisplay.setDirections(response);

						var distance = response.routes[0].legs[0].distance.value / 1000;
						var duration = response.routes[0].legs[0].duration.value / 3600;

						var route_info = "<h3>Route Info</h3><b>Distance:</b> "+ Math.round(distance) + " Kilometers";
						route_info = route_info + "<br/>";
						route_info = route_info + "<b>Duration:</b> "+ Math.round(duration) + " Hours";

						$("#route_info").html(route_info);
						$("#distance").attr("value",distance);
						$("#duration").attr("value",duration);

						$("#save_route").attr("disabled",false);
						//alert(response.routes[0].legs[0].distance.value);
					}
				});
			}

			
			//calcRoute();
			initialize();
		</script>

</body>
</html>