#!/bin/bash
# indexer - make a html from dir
# auth - hi@kesavan.info


#1 tree the dir
	tree -CDHFfhi . -o /tmp/_index.html

#2 beautify
	awk '{gsub("\&nbsp;\&nbsp;",""); print}' /tmp/_index.html  > /tmp/_index2.html 

#3 add table

	awk  -v T=$TABLE ' {gsub("</h1><p>", "</h1><p> <table><tr><td>  <table STARTXXX><tr>"); print}' /tmp/_index2.html  > /tmp/_index3.html #PSEUDO TABLE
	awk '{gsub("\<br\>","</td> </tr>\n <tr> <td>"); gsub("\<a","</td><td> <a"); print}' /tmp/_index3.html  > /tmp/_index3.5.html 

#4 close table
	awk '{gsub("\<tr\> \<td\>\<\/td\> \<\/tr\>", "</table>"); print}' /tmp/_index3.5.html> /tmp/_index4.html	
	# <tr> <td></td> </tr>
  
#5 grep </table> ?
	#echo 'grep start'
	#grep -n "</table>" index4.html
	#echo 'grep done'
	
# strip all
	sed -e '/<\/table>/,+50d' /tmp/_index4.html > /tmp/_index5.html
	TABLE=" class='display' id='books' border='1' cellpadding='0' cellspacing='0' align='left' > <thead> <tr> <th>Information <img src='\/tmp\/.indexer_ki\/sorticon.gif'> <\/th>    <th>File <img src='\/tmp\/.indexer_ki\/sorticon.gif'> <\/th> <\/tr> <\/thead" 	
	
	sed "s/STARTXXX/$TABLE/g" < /tmp/_index5.html > /tmp/_index6.html

	head -n -2  /tmp/_index6.html >  /tmp/_index7.html

# finish it
	echo " </table>   </td></tr></table>  </body> </html>" >> /tmp/_index7.html		#PSESUDO TABLE
	tail -n +4 /tmp/_index7.html >  /tmp/_3full.html

echo ' <!doctype html><html>	<head>' > /tmp/_0.html


echo "Checks for supporting files"
if [ -f /tmp/.indexer_ki/jquery.js  -a -f /tmp/.indexer_ki/jquery.dataTables.js  -a -f /tmp/.indexer_ki/indexer.js -a -f /tmp/.indexer_ki/sorticon.gif  ] 
  then
	echo Cache avail 
else 
	echo "Getting support files [First time init]"
	mkdir -p /tmp/.indexer_ki/log/
	wget -O /tmp/.indexer_ki/jquery.js 		-o /tmp/.indexer_ki/log/jq.log 		"http://kesavan.info/jquery/jquery.js"
	wget -O /tmp/.indexer_ki/jquery.dataTables.js 	-o /tmp/.indexer_ki/log/jq.dt.log 	"http://kesavan.info/jquery/dataTable/jquery.dataTables.js"
	wget -O /tmp/.indexer_ki/indexer.js 		-o /tmp/.indexer_ki/log/jq.index.log	"http://kesavan.info/jquery/jq.indexer.js"
	wget -O /tmp/.indexer_ki/sorticon.gif		-o /tmp/.indexer_ki/log/img.log		"http://kesavan.info/jquery/sorticon.gif"
fi
	
cat  /tmp/_0.html /tmp/.indexer_ki/indexer.js  /tmp/_3full.html  >> /tmp/_index.new.html

grep -v 'href="."' /tmp/_index.new.html > /tmp/_index.new2.html
awk '{gsub("\<\/thead\>\<tr\>", "</thead>"); print}'  /tmp/_index.new2.html >  indexer.htm

#remove all
	rm -f /tmp/_*html

echo "indexer.htm generated"	
exit 0	
	
	
	
	
	
	
	
	
	
	
