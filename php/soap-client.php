<?php

/*
 * 1 - Place these both scripts server+client in a separate accessible dir (https://localhost/tmp/)
 */

ini_set('display_errors', 1);
error_reporting(E_ALL);

$attempt = 1 ;
$url_server = "https://localhost/delme/soap-server.php";

// client.php:
echo  "default_socket_timeout : ".ini_get('default_socket_timeout') ."\n";
$client = new SoapClient(null, array(
    'location'        => $url_server,  # 'location' option is required in nonWSDL mode
    'uri'             => $url_server,  # 'uri' option is required in nonWSDL mode
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

//# socket_timeout,sleep # test for socket_timeout settings
//test_timeout(2,5);

function getHelloFromServer(){
    global $client;
    try {
        $serverMsg =  $client->__soapCall("helloWorld", []);
        print("<pre>");
        print("<success>$serverMsg</success>\n<br>");
        print("<pre>");
    } catch (Exception $e) {
        print("<pre>");
        print("Exception: <error>{$e->getMessage()} </error>\n<br>");
        print("Raw response: <error>{$client->__getLastResponse()}</error>\n<br>");
        print("<pre>");
    }
}

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
}?>

<p>
    <a href="#" onclick="toggle_visibility('more_info');">Click here to toggle request/response:</a>

    <div style="display:none" id="more_info">
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