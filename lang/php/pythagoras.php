<?php
echo  " ஓடிய நீளந்தன்னை ஓரெட்டு கூறதாக்கி கூறிலே ஒன்று தள்ளி
          குன்றத்தில் பாதி சேர்த்தால் வருவது கர்ணம் தானே. \n ";
$sample = array(array(5,12),array(10,24),array(6,8),array(4,3), 
                array(9,12),array(8,15),array(24,7),array(9,40));
$fact = 40;
for($i=0;$i<10;$i++){
         $sample2[] = array(rand(40*$fact,100*$fact),rand(10*$fact,50*$fact));
}

$mask = "|%8.8s |%8.8s | %16.16s| %15.15s |%-8.8s |\n";
print_ln();
printf($mask,'length','height','hypotenuse_tamil','hypotenuse_pythagoras','match%');
print_ln();
foreach(array_merge($sample,$sample2) as $set){
          $a = $set[0]>$set[1]?array_shift($set):array_pop($set); #lenght
          $b = $set[0];#height
          $c0 = round(per_tamil($a,$b),4);
          $c1 = round(per_pythagoras($a,$b),4);
          $match= round(($c0*100/$c1),2);
          $match = $match>100?200-$match:$match;
          printf($mask,$a,$b,$c0,$c1,$match.'%');
}
print_ln();

function print_ln(){
          printf("-------------------------------------------------------------------\n");
          return 0;
}

function per_tamil($a,$b){           // $c = ($a – ($a/8) ) + ($b/2);
          return $a - ($a/8) +  $b/2;
}

function per_pythagoras($a,$b){
          return sqrt($a*$a + $b*$b);
}

