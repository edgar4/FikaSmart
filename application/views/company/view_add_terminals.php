<div class="company">
	<div class="map_canvas"></div>
</div>

<div id="all_terminals"></div>
<div class="admin">
	<div id="info"></div>
	
	<form name="terminal_location" id="terminal_location">
	<ul>
     <li> <input id="geocomplete" type="text" placeholder="Type in an address" value="Nairobi, Kenya"  class="bahati"/></li>
      
      <li><input id="find" type="button" value="find" class="button2" /></li>
    	<br />
    	<li><p></p></li>
    	<li><p></p></li>
    	<li><p></p></li>
       <li> <label>Latitude</label></li>
       <li> <input name="lat" id="lat"  type="text" value="" class="bahati"></li>
      
       <li><label>Longitude</label></li>
        <li><input name="lng" id="lng" type="text" value="" class="bahati"></li>
      
        <li><label>Formatted Address</label></li>
        <input name="formatted_address" id="formatted_address" type="text" value="" class="bahati">
     
      
      <a id="reset" href="#" style="display:none;">Reset Marker</a>
      
      
      <input type = "button" class="button2" id="save" value="Save">
      <input type = "button" class="button2" id="view_terminals" value="Terminal List">
      <input type = "button" class="button2" id="view_terminal_maps" value="Map Terminals">
      </ul>
     
    </form>
</div>



</div>

<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="<?php echo base_url()."JS/jquery.geocomplete.js"; ?>"></script>
<script src="<?php echo base_url()."JS/logger.js"; ?>"></script>
<script type="text/javascript" src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script src="<?php echo base_url()."JS/add_terminals.js"; ?>"></script>
    
     <script>
      $(function(){
        $("#geocomplete").geocomplete({
          map: ".map_canvas",
          details: "form ",
          markerOptions: {
            draggable: true
          }
        });
        
        $("#geocomplete").bind("geocode:dragged", function(event, latLng){
          $("input[name=lat]").val(latLng.lat());
          $("input[name=lng]").val(latLng.lng());
          $("#reset").show();
        });
        
        
        $("#reset").click(function(){
          $("#geocomplete").geocomplete("resetMarker");
          $("#reset").hide();
          return false;
        });
        
        $("#find").click(function(){
          $("#geocomplete").trigger("geocode");
        }).click();
      });
    </script>
    
    
</body>
</html>