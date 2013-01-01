# ~/.bashrc: executed by bash(1) for non-login shells.


##############################################
#	TOOL (1) datec - Quickly find your age 
##############################################

datec(){
	echo `mysql -uUSER -pPASSWORD -e "SELECT MYDB.getDateDifferenceString('$1',NOW()) AS 'Difference is:'" `
}
#mysql> show create function kesavan.getDateDifferenceString \G
#*************************** 1. row ***************************
#           Function: getDateDifferenceString
#            sql_mode: 
#     Create Function: CREATE DEFINER=`root`@`localhost` FUNCTION `getDateDifferenceString`(date1 DATE, date2 DATE) RETURNS varchar(30) CHARSET latin1
#RETURN CONCAT(    @years := TIMESTAMPDIFF(YEAR, date1, date2),  IF (@years = 1, ' year, ', ' years, '),    @months := TIMESTAMPDIFF(MONTH, DATE_ADD(date1, INTERVAL @years YEAR), date2),  IF (@months = 1, ' month, ', ' months, '),    @days := TIMESTAMPDIFF(DAY, DATE_ADD(date1, INTERVAL @years * 12 + @months MONTH), date2),  IF (@days = 1, ' day', ' days')  )
#character_set_client: latin1
#collation_connection: latin1_swedish_ci
#  Database Collation: latin1_swedish_ci
#1 row in set (0.00 sec)

##################################################
#	TOOL (2) software - List of software packs   
##################################################

software() { if [ $# -ne 1 ] ; then { echo "Usage: software <pack>"; }
		else dpkg -l "*$@*"; fi
	 }
#alias software="dpkg -l *$1* "

#################################################################
#	TOOL (3) cleanit - Remove unwanted logs & free more space   
#################################################################

cleanit() { 
if [ $# -ne 0 ] ; then { echo  "Usage: $1" ;  } 
else {	DIR='/var/log' ; 
	find $DIR -maxdepth 1 -type f -size +1M -exec ls -lhS {} \; | awk '{ print $5,"",$9 }'|sort -nr | head -10
	echo -n "Clean top 5? [y|n]:" ;
	read -n 1 choice
	echo 
	if [ $choice == "y" ] ; then { 
		echo -n Cleaning system...
		find $DIR -maxdepth 1 -type f -size +1M -exec ls -lhS {} \; | awk '{ print $9 }'|sort -nr | head -5|xargs rm -f
		echo System cleaned status!
		find $DIR -maxdepth 1 -type f -size +1M -exec ls -lhS {} \; | awk '{ print $5,"",$9 }'|sort -nr | head -10
 	}
	else echo "System NOT CLEANED";
	fi
}
fi
}

##############################################################
#	TOOL (4) yt - List the WebM cache files in local disk
##############################################################

yt(){
	find ~/.mozilla/firefox/*.default/Cache -type f -ls|head -10|awk '{printf $11 "\n"}'|xargs file|grep -i webm|awk -F: '{printf $1 "\n"}'|xargs ls -lh|awk '{printf $9 " -->  "  $5 " " $6" " $7 " "  $8 "\n"} '
}

