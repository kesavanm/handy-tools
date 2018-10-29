<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
echo "<pre>";
$attempt = 1 ;

// client.php:
echo  "default_socket_timeout     : ".        ini_get('default_socket_timeout') ."\n";
$client = new SoapClient(null, array(
      'location'        => "http://SERVER_LOCATION/timeout.php",  # 'location' option is required in nonWSDL mode
      'uri'             => "http://SERVER_LOCATION/timeout.php",  # 'uri' option is required in nonWSDL mode
      'exceptions'      => true,
      'trace'           => 1,
      'stream_context'  => stream_context_create(['ssl' => ['verify_peer' => false]]),
       ));

# socket_timeout,sleep
test_timeout(2,5);
test_timeout(6,5);
test_timeout(4,5);

function test_timeout($timeout, $sleep){
        global $client, $attempt;
        ini_set('default_socket_timeout', $timeout);
        echo "\nAttempt : #$attempt";
        echo "\nnew default_socket_timeout  : ".        ini_get('default_socket_timeout') ."\n";
        $s = strtotime(date('c'));
        try {
        echo $client->__soapCall("methTimeOut", [$sleep]);
        } catch (Exception $e) {
            print("<error>Exception #{$attempt}:  {$e->getMessage()} </error>\n");
        }
        echo dcalc($s); $attempt++;
}

function dcalc($start,$end =NULL ){
        $end = $end?$end:strtotime(date('c'));
        return $end-$start ." seconds to process\n";
}
?>

<style>
pre error{
    color: red;       
}
</style>
