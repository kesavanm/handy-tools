<?php
/* Sample SOAP Server
1 - Place this script in local env where this can be access via https://SERVER_LOCATION/server.php
2 - Make sure it is accessible with right permissions
3 - Any printable stuff will end-up with XML fail in client
*/

#die ("Direct access not permitted");

ini_set('display_errors',1);
error_reporting(E_ALL);

class MyClass {
  public function helloWorld() {
            return "hello world! from soap server\n";
  }

  public function methTimeOut($sleep){
          sleep($sleep);
          return "server sleeping for $sleep sec... \n";
  }
}

$url_server = "https://localhost/delme/soap-server.php";

try {
  $server = new SOAPServer(
    NULL,
    array(
     'uri' => $url_server,
    )
  );
  $server->setClass('MyClass');
  $server->handle();
}catch (SOAPFault $f) {
  print $f->faultstring;
}