#!/bin/bash
# indexer - make a html from dir
# auth - hi@kesavan.info

TMP='../tmp'		# Define Temp Dir

#1 tree the dir
	tree -CDHFfh . -o $TMP/_index.html		#No <tr> initially 

#2 beautify
	awk '{gsub("&nbsp;&nbsp;",""); print}' $TMP/_index.html  > $TMP/_index20.html 
	sed 's#[└──│├\n\t]##g' $TMP/_index20.html > $TMP/_index2.html 

#3 add table
	awk '{gsub("Tree</h1>", "Tree ! </h1> <p> \n <table ><tr><td align=left> <table STARTXXX>"); print}' $TMP/_index2.html > $TMP/_index3.html #PSEUDO TABLE
	awk '{gsub("<br>","</td> </tr>\n <tr> <td>"); gsub("<a","</td><td> <a"); print}' $TMP/_index3.html  > $TMP/_index3.5.html 

#4 close table
	awk '{gsub("<tr> <td></td> </tr>", "</table>"); print}' $TMP/_index3.5.html> $TMP/_index4.html	
 
# strip all
	sed -e "/<\/table>/,+50d" $TMP/_index4.html > $TMP/_index5.html

	TABLE=" class='display' id='books' border='1' cellpadding='0' cellspacing='0' align='left'>	\
		<thead>											\
			<tr> 										\
				<th>Information <img src='$TMP\/.indexer_ki\/sorticon.gif'> <\/th> 	\
				<th>File <img src='$TMP\/.indexer_ki\/sorticon.gif'> <\/th> 		\
			<\/tr>										\
		<\/thead	"	

	sed "s#STARTXXX#$TABLE#g" < $TMP/_index5.html > $TMP/_index6.html

	head -n -2  $TMP/_index6.html >  $TMP/_index7.html

# finish it
	echo " </table>   </td></tr></table>  </body> </html>" >> $TMP/_index7.html		#PSESUDO TABLE
	tail -n +4 $TMP/_index7.html >  $TMP/_3full.html

echo 	"<!doctype html> <html> <head>		\
	 <!-- jQuery -->			\
		<script type="text/javascript" language="javascript" src="$TMP/.indexer_ki/jquery.js"></script>			\
		<script type="text/javascript" language="javascript" src="$TMP/.indexer_ki/jquery.dataTables.js"></script> 	\
	"	> $TMP/_0.html


echo "Checks for supporting files"
if [ -f $TMP/.indexer_ki/jquery.js  -a -f $TMP/.indexer_ki/jquery.dataTables.js  -a -f $TMP/.indexer_ki/indexer.js -a -f $TMP/.indexer_ki/sorticon.gif  ] 
  then
	echo Cache avail 
else 
	echo "Getting support files [First time init]"
	mkdir -p $TMP/.indexer_ki/log/
	wget -O $TMP/.indexer_ki/jquery.js 		-o $TMP/.indexer_ki/log/jq.log 		"http://kesavan.info/jquery/jquery.js"
	wget -O $TMP/.indexer_ki/jquery.dataTables.js 	-o $TMP/.indexer_ki/log/jq.dt.log 	"http://kesavan.info/jquery/dataTable/jquery.dataTables.js"
	wget -O $TMP/.indexer_ki/indexer.js 		-o $TMP/.indexer_ki/log/jq.index.log	"http://kesavan.info/jquery/jq.indexer.js"
	wget -O $TMP/.indexer_ki/sorticon.gif		-o $TMP/.indexer_ki/log/img.log		"http://kesavan.info/jquery/sorticon.gif"
fi

#combine all
	cat  $TMP/_0.html $TMP/.indexer_ki/indexer.js  $TMP/_3full.html  >> $TMP/_index.new.html

#misc
	grep -v 'href="."' $TMP/_index.new.html > $TMP/_index.new2.html
	awk '{gsub("</thead><tr>", "</thead>"); print}'  $TMP/_index.new2.html >  $TMP/_indexer.html

#remove first td+tr 
	sed "s#</td> </tr>##" < $TMP/_indexer.html > indexer.htm

#remove all
	rm -f $TMP/_*html

echo "indexer.htm generated"	
exit 0	
