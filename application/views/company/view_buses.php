<div class="company">
	<a href="#" id="edit_bus_categories">Edit Bus Categories</a>
	<table id="all_buses_display" width="100%">
		
	</table>
</div>
<div id="all_terminals"></div>
<div class="admin">
	<form id="buses_form" name="buses_form">
	<ul>
		<li><label for="reg_num">Registration number</label></li>
			<li><input type="text" name="reg_num" id="reg_num" placeholder="Registration Number" class="bahati" /></li>
		
		<li><label for="bus_code">Bus Code</label></li>
			<li><input type="text" name="bus_code" id="bus_code" placeholder="Bus Code" class="bahati"  /></li>
		
		<li><label for="num_seats">Number of seats</label></li>
			<li><input type="text" name="num_seats" id="num_seats" placeholder="Number of seats" class="bahati"  /></li>
		
		<li><label for="seat_config">Set Configuration</label></li>
			<li><input type="text" name="seat_config" id="seat_config" placeholder="Seat configuration" class="bahati"  /></li>
		
		<li><label for="category">Category</label></li>
			<li><input type="text" name="category" id="category" placeholder="Category" class="bahati"  /></li>
			
			<li><input type="hidden" name="add_or_edit" id="add_or_edit" value="1" /></li>
			<li><input type="hidden" name="bus_id" id="bus_id"  value=""  /></li>
		
		<li><input type="button" id="add_bus" value="Add Bus" class="button_1"/></li>	
		<li><input type="button" id="view_buses" value="View Buses" class="button_1"/></li>
	</ul>	
	</form>
</div>



</div>
<script type="text/javascript" src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script src="<?php echo base_url()."JS/buses.js"; ?>"></script>
</body>
</html>