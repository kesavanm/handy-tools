<?php
/**************************************************
	@auth	: m.kesavan@hotmail.com
	@date	: 11/24/2008

	There is an ancient poem in Tamil which tells you how to calculate Hypotenuse for a triangle. 
	The time period in which the poem was written is unknown, 
	but it surely provides an (approximate) alternative to Pythogoras.

	Poem in Romanized Tamil:
	-----------------------
	Odiya n-ILan-thannai Orettu kURathAkki kURRilE onRu thaLLi
	kunRaththil pAthi sErththAl varuvathu karNam thAnE.

	Divide the distance you've run (longer side) into 8 equal parts and 
	discard one part from it. Then if you add the half the height to that, 
	you'll get Hypotenuse. 

***************************************************/
$count = 100;
$match0 = 0;
$match1 = 0;
$match2 = 0;
$match3 = 0;

echo "<table>";
for($i=1;$i<=$count;++$i){
	
	$base	= rand(0,100);
	$height = rand(0,100);
	
	# Pythogoras
	$hypotenuse = intval(sqrt(($base*$base)+($height*$height)));	
	
	#Tamil style, $base must be lengthy.,
	if($base>$height);
	else list($height,$base) = array($base,$height);		#swapping
	$hypotenuse2 = intval(((7/8)*$base) + ($height/2));

	$percent =100 - abs(($hypotenuse-$hypotenuse2));

	echo "<tr>
			<td>$hypotenuse </td>
			<td>$hypotenuse2 </td>
			<td>$percent </td>			
		</tr>";
	if(intval($percent)==100) 
		$match0++;
	elseif(100>intval($percent) && intval($percent)> 95 )
		 $match1++;
	elseif(94>intval($percent) && intval($percent)> 90 )
		 $match2++;
}
echo "</table>";
echo "Matched is $match0 out of $count at level 100%	<br>";
echo "Matched is $match1 out of $count at level above 95%	<br>";
echo "Matched is $match2 out of $count at level above 90%	<br>";
echo "Above 90% is ".($match0+$match1+$match2)." out of $count ";
?>
