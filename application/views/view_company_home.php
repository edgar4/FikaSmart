

<div id="body">
	<div class="book">
		<label for='terminal_from'>From</label>
		<select id='terminal_from' name='terminal_from'>
		<?php 
			foreach ($terminals->result() as $t){
				echo "<option value='$t->id'>$t->terminal_name</option>";
			}
		?>
		</select>
		
		<select id='termnal_to' name='termnal_to' disabled='disabled'></select>

	</div>


</div>

<script type="text/javascript" src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script src="<?php echo base_url()."JS/company_home.js"; ?>"></script>
</body>
</html>