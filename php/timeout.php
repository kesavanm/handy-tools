<?php
ini_set('display_errors',1);
error_reporting(E_ALL);

class MyClass {
  public function helloWorld() {
            return "hello";
  }

  public function methTimeOut($sleep){
          sleep($sleep);
          return "server sleeping for $sleep sec... \n";
  }
}

try {
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
