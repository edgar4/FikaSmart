<div class="companys">
	<div id="select_bus">
		
	</div>
	
	
	<div id="timetable_div">
	<form name='timetable_form' id='timetable_form'>
		<label for="select_bus_select">Select Bus</label>
		<select id="select_bus_select" name="select_bus_select">
			<?php 
			echo "<option value='0'>SELECT BUS</option>";
			foreach($bus_list as $bus){
				echo "<option value='$bus->id'>$bus->registration_num, $bus->bus_code</option>";
			} 
			
			?>
		</select>
		
		
		
			<table id="timetable_table" width="100%" border="1">
				
			</table>
		</form>
		<input type="button" class="button_2" value="Save"  id="save"/>
	</div>

</div>

<div class="admin">
	
</div>



</div>

<script type="text/javascript" src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script src="<?php echo base_url()."JS/timetable.js"; ?>"></script>

</body>
</html>