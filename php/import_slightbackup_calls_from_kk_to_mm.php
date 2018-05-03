<?php

#usage 
//1 php import_slightbackup_calls_from_kk_to_mm.php  > calllogs_export_1467299297651.xml.2016.sql
//2 adb push C:\Users\kmuthuvel\Desktop\andriod\calllogs_export_1467299297651.xml.2016.sql /sdcard/tools/ 
//2 adb shell
//3 su
//4 sqlite3 /data/data/com.android.providers.contacts/databases/contacts2.db </sdcard/tools/calllogs_export_1467299297651.xml.2016.sql

#TODO make sure only data in the following file 
$data = file('backups/calllogs_export_1467299297651.xml.csv');
$i=1;

$sql = "insert into calls (formatted_number,matched_number,number,type,date,lookup_uri,geocoded_location,countryiso,numbertype,new,duration,presentation,name,normalized_number,photo_id,is_read,numberlabel) values";

foreach($data as $datae) {
        list($formatted_number,$matched_number,$number,$type,$date,$lookup_uri,$geocoded_location,$countryiso,$numbertype,$new,$duration,$subscription,$presentation,$name,$normalized_number,$photo_id,$duration_type,$is_read,$numberlabel)  = explode(',',$datae);
        $numberlabel=trim($numberlabel); 
        $sql .= "  ('$formatted_number','$matched_number','$number',$type,'$date','$lookup_uri', '$geocoded_location','$countryiso','$numbertype','$new','$duration','$presentation','$name','$normalized_number','$photo_id','$is_read','$numberlabel'  ) , " ;
}
echo $sql ;
