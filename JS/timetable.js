var serverURL = serverURL;

$(document).ready(function(){
	$("#save").hide();
	disable_save();
	//buses select change
	$("#select_bus_select").change(function() {
        var bus_id = $(this).val();
        if(bus_id != 0){
        	load_timetable(bus_id);
        	$("#save").show();
        }else{
        	reset_timetable();
        }
        
    });
	
	$("#day").live("change",function(){
		var day = $(this).val();
		if(day == "Day"){
			$("#route").attr("disabled",true);
		}else{
			$("#route").attr("disabled",false);
		}
		
	});
	
	$("#route").live("change",function(){
		var route = $(this).val();
		
		if(route != 0){
			var st = $("#route option:selected").attr("start_terminal");
			var st_id = $("#route option:selected").attr("start_terminal_id");
			
			var et = $("#route option:selected").attr("end_terminal");
			
			var et_id = $("#route option:selected").attr("end_terminal_id");
			var dis = $("#route option:selected").attr("distance");
			var dur = $("#route option:selected").attr("duration");
			
			var option_list = "";
			
			option_list = option_list + "<option value='"+st_id+"'>"+st+"</option>";
			option_list = option_list +  "<option value='"+et_id+"'>"+et+"</option>";
			
			$("#start_terminal").html(option_list);
			$("#start_terminal").attr("disabled",false);
			$("#start_time").attr("disabled",false);
		}else{
			alert("Invalid Route selected")
		}
		
		
		//alert(route);
		//alert(st);
		//alert(st_id);
		
		//alert(et);
		//alert(et_id);
		//alert(dis);
		//alert(dur);
		//fetch_routes(terminal);
	});
	
	$("#start_time").live("focusout", function(){
		var dur = $("#route option:selected").attr("duration");
		//alert(dur);
		$("#fare").attr("disabled",false);
		$("#fare").focus();
	});
	
	$("#fare").live("focusout", function(){
		//alert(dur);
		$("#conductor").attr("disabled",false);
		$("#driver").attr("disabled",false);
		
		enable_save()
	});
	
	$("#save").click(function(){
		var validate = validate_form();
		
		if(validate = true){
			var bus_id = $("#select_bus_select option:selected").val();
			var form_data = $("#timetable_form").serialize();
			var URL = serverURL+"Company/Timetabler/save_timetable";
			
			$.ajax({
				url:URL,
				data:form_data,
				type:"post",
				success: function(data){
					//alert(bus_id);
					
					load_timetable(bus_id)
				}
			});
			
		}else{
			alert("form validation failed terribly");
		}
	});
		
});

function load_timetable(bus_id){
	//alert(bus_id);
	var URL = serverURL+"Company/Company_users/get_timetable";
	var data = {bus_id:bus_id};
	$.ajax({
		url:URL,
		type:"post",
		data:data,
		success: function(data){
			//alert(data);
			$("#timetable_table").html(data);
		}
	});
}

function reset_timetable(){
	$("#timetable_table").html("");
	$("#save").hide();
}

/*
function fetch_routes(terminal){
	var URL = serverURL+"Company/timetabler/get_specific_routes";
	var data = {terminal:terminal};
	
	$.ajax({
		url:URL,
		data:data,
		type:"post",
		success: function(data){
			alert(data);
			var d = JSON.parse(data);
			var html = "";
			$.each(d,function(index, value){
				html =html + "<option></option>";
			} );
			//$("#route").
		}
	});
}
*/

function disable_save(){
	$("#save").attr("disabled",true);
}

function enable_save(){
	$("#save").attr("disabled",false);
}

function validate_form(){
	return true;
}