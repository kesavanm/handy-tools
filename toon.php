<?php

#$x= fopen('toon.log','a+w'); fwrite($x, date('Ymd-His')."--".print_r($_REQUEST,true));fclose($x);
date_default_timezone_set('IST');	//set the default timezone to use. Available since PHP 5.1

if($_GET[date]){
	$YYYY 	= substr($_GET[date],0,4);
	$MM	= substr($_GET[date],4,2);
	$DD	= substr($_GET[date],6,2);
}elseif(array_key_exists('rand',$_REQUEST)){
 	list($YYYY,$MM,$DD) = explode('-',randomDate('2010-08-02',date('Y-m-d')));
	$uri = $_SERVER['PHP_SELF']."?rand&date=$YYYY$MM$DD";
	header("Location:$uri");exit; 	
}else{
	$uri = $_SERVER['PHP_SELF']."?date=".date('Ymd');
	header("Location:$uri");exit;
}/*elseif($_REQUEST['date_toon']){
        $YYYY   = substr($_REQUEST['date16956'],0,4);
        $MM     = substr($_REQUEST['date16956'],5,2);
        $DD     = substr($_REQUEST['date16956'],8,2);
}*/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Kesavan M's Cartoons</title>
    <link rel="shortcut icon" href="kesavan.png" type="image/x-icon">

<link rel="icon" href="k7.png">

	<script>
	document.onkeydown = checkKey;
	
	function checkKey(e) {

	    e = e || window.event;
	    
	      switch (e.keyCode) {
	        case 37:			//leftArrowPressed();
								var uri = window.location.toString();
								var res = uri.substr(-8,8);
								var d = new Date(res.substr(0,4),parseInt(res.substr(4,2)) - 1,res.substr(6,2) );
									    	                
	    					Date.prototype.yyyymmdd = function() {
								   var yyyy = this.getFullYear().toString();
								   var mm = (this.getMonth()).toString(); // getMonth() is zero-based
								   var dd  = (this.getDate()).toString();
								   
								   var newdate = new Date(yyyy ,mm,dd);
								   newdate.setDate(newdate.getDate() - 1);
								   
								   yyyy = newdate.getFullYear().toString();
								   mm = (newdate.getMonth()+1).toString(); // getMonth() is zero-based
								   dd  = (newdate.getDate()).toString();
								   								   
								   return yyyy + (mm[1]?mm:"0"+mm[0]) + (dd[1]?dd:"0"+dd[0]); // padding
								  };	
								
									uri = uri.substring(0, uri.length - 8);
									uri = uri.replace("rand","");
									uri = uri + d.yyyymmdd();
									window.location=uri;
	            break;

	        case 39:			//rightArrowPressed();
		    
								var uri = window.location.toString();
								var res = uri.substr(-8,8);
								var d = new Date(res.substr(0,4),parseInt(res.substr(4,2)) - 1,res.substr(6,2) );
									    	                
	    					Date.prototype.yyyymmdd = function() {
								   var yyyy = this.getFullYear().toString();
								   var mm = (this.getMonth()).toString(); // getMonth() is zero-based
								   var dd  = (this.getDate()).toString();
								   
								   var newdate = new Date(yyyy ,mm,dd);
								   newdate.setDate(newdate.getDate() + 1);
								   
								   yyyy = newdate.getFullYear().toString();
								   mm = (newdate.getMonth()+1).toString(); // getMonth() is zero-based
								   dd  = (newdate.getDate()).toString();
								   								   
								   return yyyy + (mm[1]?mm:"0"+mm[0]) + (dd[1]?dd:"0"+dd[0]); // padding
								  };	
								
									uri = uri.substring(0, uri.length - 8);
									uri = uri.replace("rand","");
									uri = uri + d.yyyymmdd();
									window.location=uri;
	            break;
	        case 13:			//rightArrowPressed();
							window.location="toon.php?rand";
	            break;	            
	   }
	   							

									

	            
	}
	</script>

  </head>

  <body>
<?php
include('head.php');  	

$month = array(
	'01'=>'Jan','02'=>'Feb','03'=>'Mar',
	'04'=>'Apr','05'=>'May','06'=>'Jun',
	'07'=>'Jul','08'=>'Aug','09'=>'Sep',
	10=>'Oct',11=>'Nov',12=>'Dec');

if($YYYY) $url = "http://www.dinamalar.com/cartoon.asp?year=$YYYY&month=$month[$MM]&date=$DD&submit=Submit";
else $url = "http://www.dinamalar.com/cartoon.asp?year=".date('Y')."&month=".date('M')."&date=".date('d')."&submit=Submit";

$lines = file($url, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
$date = $_GET[date]?$_GET[date]:date("Ymd");

foreach ($lines as $line_num => $line) {
	if(strstr($line,'Hilarious political cartoon images'))
	break;
}	

echo "<table>\
		<tr>
		<td>".str_replace('center','left',$line).
		"<form> \n
						<input type='submit' name='rand' value='show me random'></input>\n
		 </form>	
		 </td>
     <td valign='top'>Be lazy. Try using LEFT , RIGHT and SUPER(Enter) Keys
     </td>
     </tr></table> ";

# @auth:http://stackoverflow.com/users/1045444/somnath-muluk
// Find a randomDate between $start_date and $end_date
function randomDate($start_date, $end_date){
    $min = strtotime($start_date);	// Convert to timetamps
    $max = strtotime($end_date);
    return date('Y-m-d', rand($min, $max));	// Generate random number & Convert back to desired date format	
}

include('tail.php');

?>

