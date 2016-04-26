#!/bin/bash
# indexer - make a html from dir
# auth - hi@kesavan.info


#TODO 
# 1 - Add version control
# 2 - Remove the bugos code on sed and UI 


err_report() {
            echo "Error on line $1"
    }

trap 'err_report $LINENO' ERR


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



function ls_html(){
        for i in `ls -R . --color=never | awk '/:$/&&f{s=$0;f=0} /:$/&&!f{sub(/:$/,"");s=$0;f=1;next} NF&&f{ print s"/"$0 }'`;     
        do  
             echo -n `ls --color=never -hl  --time-style=+"%Y-%m-%d %H:%M:%S" $i  | 
                awk '{print "<tr>  <td> "  $1 "</td>   <td> " $3   " </td>  <td>" $5  " </td>  <td>"   $6 " </td>  <td>" $8  "</td> </td    >"}' 
                && file -b $i ` ;  
                echo " </td> </tr>" ;      
     done

}







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
        wget -O $TMP/.indexer_ki/demo_table.css         -o $TMP/.indexer_ki/log/dt.css.log      "http://kesavan.info/jquery/dataTable/css/demo_table.css"
fi

#combine all
	cat  $TMP/_0.html $TMP/.indexer_ki/indexer.js  $TMP/_3full.html  >> $TMP/_index.new.html

#misc
	grep -v 'href="."' $TMP/_index.new.html > $TMP/_index.new2.html
	awk '{gsub("</thead><tr>", "</thead>"); print}'  $TMP/_index.new2.html >  $TMP/_indexer.html

#remove first td+tr 
	sed "s#</td> </tr>##" < $TMP/_indexer.html > indexer_`date +%F_%k_%M_%S`.htm



# All-in-One
ALLINONE="all-in-one_`date +%F_%k_%M_%S`.html";
echo "<!doctype html> <html> <head> "                   >  $ALLINONE;
echo " <script>    <!-- jQuery --> "                    >> $ALLINONE;
cat "$TMP/.indexer_ki/jquery.js"                        >> $ALLINONE;
cat "$TMP/.indexer_ki/jquery.dataTables.js"             >> $ALLINONE;
echo " </script>        "                               >> $ALLINONE;
cat  $TMP/.indexer_ki/indexer.js  $TMP/_3full.html      >> $ALLINONE;
echo '<style type="text/css">'                          >> $ALLINONE;
cat "$TMP/.indexer_ki/demo_table.css"                   >> $ALLINONE;
echo '</style>'                                         >> $ALLINONE;

#sort-imgs
CSS_IMG_SORT_BOTH="background: url('../images/sort_both.png') no-repeat center right;"
CSS_IMG_SORT_D_UP="background: url('../images/sort_asc_disabled.png') no-repeat center right;"
CSS_IMG_SORT_UP="background: url('../images/sort_asc.png') no-repeat center right;"
CSS_IMG_SORT_D_DOWN="background: url('../images/sort_desc_disabled.png') no-repeat center right;"
CSS_IMG_SORT_DOWN="background: url('../images/sort_desc_disabled.png') no-repeat center right;"
BASE64_SORT_BOTH="background:url(data:image/gif;base64,R0lGODlhCwALAJEAAAAAAP///xUVFf///yH5BAEAAAMALAAAAAALAAsAAAIUnC2nKLnT4or00PvyrQwrPzUZshQAOw==) no-repeat center right;"
BASE64_SORT_UP="background:url(data:image/gif;base64,R0lGODlhCwALAJEAAAAAAP///xUVFf///yH5BAEAAAMALAAAAAALAAsAAAIRnC2nKLnT4or00Puy3rx7VQAAOw==) no-repeat center right;"
BASE64_SORT_DOWN="background:url(data:image/gif;base64,R0lGODlhCwALAJEAAAAAAP///xUVFf///yH5BAEAAAMALAAAAAALAAsAAAIPnI+py+0/hJzz0IruwjsVADs=) no-repeat center right;"

sed "s#$CSS_IMG_SORT_BOTH#$BASE64_SORT_BOTH#"   < $ALLINONE     > $ALLINONE.1.5
sed "s#$CSS_IMG_SORT_D_UP#$BASE64_SORT_UP#"     < $ALLINONE.1.5 > $ALLINONE.1.6
sed "s#$CSS_IMG_SORT_UP#$BASE64_SORT_UP#"       < $ALLINONE.1.6 > $ALLINONE.1.7
sed "s#$CSS_IMG_SORT_D_DOWN#$BASE64_SORT_DOWN#" < $ALLINONE.1.7 > $ALLINONE.1.8
sed "s#$CSS_IMG_SORT_DOWN#$BASE64_SORT_DOWN#"   < $ALLINONE.1.8 > $ALLINONE.1.9

SORTICON="<img src='../tmp/.indexer_ki/sorticon.gif'>"

#misc & #remove first td+tr
grep -v 'href="."' $ALLINONE.1.9  >  $ALLINONE.2
awk '{gsub("</thead><tr>", "</thead>"); print}'   $ALLINONE.2 >  $ALLINONE.3
sed "s#$SORTICON# #"                             < $ALLINONE.3 >$ALLINONE.3.5
sed "s#<img src='../tmp/.indexer_ki/sorticon.gif'># #"  < $ALLINONE.3.5 > $ALLINONE.4
mv $ALLINONE.4 "$ALLINONE.final.html"

#remove all
	rm -f $TMP/_*html
        rm -f $ALLINONE.1.5 $ALLINONE.1.6 $ALLINONE.1.7 $ALLINONE.1.8 $ALLINONE.1.8.5 $ALLINONE.1.9
        rm -f $ALLINONE.2   $ALLINONE.3  $ALLINONE.3.5  $ALLINONE; mv "$ALLINONE.final.html" $ALLINONE

echo "indexer_`date +%F_%k_%M_%S`.htm generated"
echo "also created portable: $ALLINONE file for your handy portability"

return 0
