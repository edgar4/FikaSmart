<div class="company">
	<div class="map_canvas"></div>
</div>

<div class="admin">
	<form>
      <input id="geocomplete" type="text" placeholder="Type in an address" value="Nairobi, Kenya" />
      
      <input id="find" type="button" value="find" />

      <fieldset>
        <label>Latitude</label>
        <input name="lat" type="text" value="">
      
        <label>Longitude</label>
        <input name="lng" type="text" value="">
      
        <label>Formatted Address</label>
        <input name="formatted_address" type="text" value="">
      </fieldset>
      
      <a id="reset" href="#" style="display:none;">Reset Marker</a>
    </form>
</div>



</div>

<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="<?php echo base_url()."JS/jquery.geocomplete.js"; ?>"></script>
<script src="<?php echo base_url()."JS/logger.js"; ?>"></script>
    
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