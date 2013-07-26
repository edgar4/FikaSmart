

<div id="body">
<div id ="bc">
	<div id = "bc1" class ="bcsub">
	Search Bus
	<div class="arrow_box">
	</div>
	</div>
	<div id = "bc2" class ="bcsub">
	Select Bus
	<div class="arrow_box">
	</div>
	</div>
	<div id = "bc3"  class ="bcsub">
	Select Seats
	<div class="arrow_box">
	</div>
	</div>
	<div id = "bc4"  class ="bcsub">
	Enter Details
	<div class="arrow_box">
	</div>
	</div>
	<div id = "bc5" class ="bcsub">
	Payment
	<div class="arrow_box">
	</div>
	</div>
	<div id = "bc6" class ="bcsub">
	Finish Booking
	<div class="arrow_box">
	</div>
	
	</div>

</div>

	<div class="company2">
	<p id="info"></p>
	<img alt="" src="<?php echo base_url(); ?>img/search.png" />
	<form id = "book" name = "book">
	<ul id="double">
	<li>
	<label for="travel_date">Date</label>
	</li>
	<li>
	<input type="text" id="travel_date" name="travel_date" />
	</li>
	<li><p></p></li>
	<li>
	<label for="terminal1">From</label>
	</li>
	<li>
		<?php 

			$vals =  'id="terminal1"';
			echo form_dropdown("terminal1",$terminal_start,"",$vals);
		?>
	</li>
	<li>
	<label for="terminal2">To</label>
	</li>
	<li>
	<?php 

			$vals =  'id="terminal2"';
			echo form_dropdown("terminal2",$terminal_end,"",$vals);
	?>
		
	</li>
	<li>
		<input type="button" id="search" class="button" value="Search">
	</li>
</ul>	
	</div>
	<div id="pic">
	<div id="inside_pic">
	<h1>Book Online</h1>
	
	
	<p>
		sjakhdjkasdhshdshajkd
		sajdhajkshdas
		sajkdhasjkdhas
		sadjhhasdjkhajk
		asdkasjdkljs
		
		sjakhdjkasdhshdshajkd
		sajdhajkshdas
		sajkdhasjkdhas
		sadjhhasdjkhajk
		asdkasjdkljs
		
		sjakhdjkasdhshdshajkd
		sajdhajkshdas
		sajkdhasjkdhas
		sadjhhasdjkhajk
		asdkasjdkljs
		</p>
		
		
	</div>
	<img src="<?php echo base_url(); ?>img/pic3.png" />
	<div class="signup">
	<a href="<?php echo base_url()?>Test/reg_cust" ><img src="<?php echo base_url(); ?>img/signup.png" /></a>
	</div>
	
	</div>
	<div class="search">
	
	
		<table id="search_results" width="100%" border="1"></table>

	</div>

</div>
<input type="hidden" name="trip_id" id="trip_id" value="" />
<input type="hidden" name="step" id="step" value="1" />
<input type="hidden" name="prefix" id="prefix" value="" />
<input type="hidden" name="selected_seats" id="selected_seats" value="0" />
<input type="hidden" name="total_cost" id="total_cost" value="0" />
<input type="hidden" name="passenger_id" id="passenger_id" value="" />
<input type="hidden" name="bus_no" id="bus_no" value="" />
<input type="hidden" name="fare" id="fare" value="" />
<script type="text/javascript" src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script type="text/javascript" src="<?php echo base_url()?>JS/login.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>JS/booking.js"></script>
</div>

