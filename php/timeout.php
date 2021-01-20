<?php

/* Sample SOAP Server
1 - Place this script in local env where this can be access via https://SERVER_LOCATION/server.php
2 - Make sure it is accessible with right permissions
3 - Any printable stuff will end-up with XML fail in client
*/

#die ("Direct access not premitted");

ini_set('display_errors',1);
error_reporting(E_ALL);

class MyClass {
  public function helloWorld() {
            return "hello world! from server\n";
  }

  public function methTimeOut($sleep){
          sleep($sleep);
          return "server sleeping for $sleep sec... \n";
  }
}

try {
  echo "SOAP Server is running! Call me from a Client";
  $server = new SOAPServer(
    NULL,
    array(
     'uri' => 'http://SERVER_LOCATION/timeout.php'
    )
  );
  $server->setClass('MyClass');
  $server->handle();
}
catch (SOAPFault $f) {
  print $f->faultstring;
}

