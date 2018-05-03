<?php
if (PHP_SAPI != 'cli') {
    die("Not authorized");
}

if( !isset( $argv[1] ) ){
        die("no upload file specified \n");
}

ob_start();
require_once 's3/sdk.class.php';

ini_set('display_errors',1);
error_reporting(E_ALL);

$remote_path =  $argv[1];
$local_path = "/tmp/downloaded.txt";

aws_download($remote_path,$local_path);
echo "done with doc! \n " ;

function aws_download($remote_path,$local_path){
        $s3 = new AmazonS3();
        $bucket = 'remote_dir' ;
        $bucket_exists = $s3->if_bucket_exists($bucket);
        echo "checking bucket \n" ;
        if($bucket_exists){
                $file_download = $s3->get_object($bucket, $remote_path);
                if($file_download->isOK()){
                        print_r($file_download->body);
                        $fp = $file_download->body;
                        $temp = fopen($local_path , 'w');
                        fwrite($temp, $fp);
                        fclose($temp);
                }
        }      
}

?>
