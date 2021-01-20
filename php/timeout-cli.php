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
    'keep_alive'      => false,
    'trace'           => 1,
    'stream_context'  => stream_context_create(['ssl' => [
            'verify_peer'       =>false,
            'verify_peer_name'  =>false, //Exception:  Could not connect to host
            'allow_self_signed' =>true
        ],
        ]
    ),
));

getHelloFromServer();

function getHelloFromServer(){
    global $client;
    echo "Calling Server\n<br>";
    try {
        $serverMsg =  $client->__soapCall("helloWorld", []);
        print("<success>$serverMsg</success>\n");
    } catch (Exception $e) {
        print("Exception: <error>{$e->getMessage()} </error>\n");
        print("Raw response: <error>{$client->__getLastResponse()}</error>\n");
    }
}

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
<p>
    <a href="#" onclick="toggle_visibility('more_info');">Click here to toggle tech info</a>

<div style="display: none" id="more_info">Tech info:
    <table>
        <tr>
            <td>REQUEST:</td>
            <td>
            <pre class="prettyprint linenums">
            <code class="language-xml"><?=htmlentities($client->__getLastRequest()); ?></code>
            </pre>
            </td>
        </tr>
        <tr>
            <td>RESPONSE:</td>
            <td>
            <pre class="prettyprint linenums">
            <code class="language-xml"><?=htmlspecialchars($client->__getLastResponse(), ENT_QUOTES); ?></code>
            </pre>
            </td>
        </tr>
    </table>
</div>
</p>

<style>
    pre error{
        color: red;
    }
    pre success{
        color:green;
    }
    pre {
        white-space: pre-wrap;       /* Since CSS 2.1 */
        white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
        white-space: -pre-wrap;      /* Opera 4-6 */
        white-space: -o-pre-wrap;    /* Opera 7 */
        word-wrap: break-word;       /* Internet Explorer 5.5+ */
    }
</style>
<script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
<script type="text/javascript">
    <!--
    function toggle_visibility(id) {
        var e = document.getElementById(id);
        if(e.style.display == 'block')
            e.style.display = 'none';
        else
            e.style.display = 'block';
    }
    //-->
</script>