<?php
if (PHP_SAPI != 'cli') {
    die("Not authorized");
}

if( !isset( $argv[1] ) ){
        die("no download file specified \n");
}

ob_start();
require_once 's3/sdk.class.php';

ini_set('display_errors',1);
error_reporting(E_ALL);

$s3 = new AmazonS3();

$bucket = 'remote_dir' ;
$filename = $argv[1] ;

$bucket_exists = $s3->if_bucket_exists($bucket);

if($bucket_exists){
        try{
                $fp = fopen($filename,'r');
                $result = $s3->create_object($bucket,$filename,array('body'=>fread($fp,filesize($filename))));
                #print_r($result->header['x-aws-requestheaders']);
                print_r($result->header['x-aws-requestbody']);
        }
        catch ( Exception $e)
        {
                gdebug("Failed uploading...");
                echo "Caught exception:".get_class($e).
                        "\n{$e->getMessage()}\nIn file:{$e->getFile()} at line #{$e->getLine()}\n{$e->getTraceAsString()}\n";
                throw $e;
        }
}else{
        echo "no bucket";
}

?>
