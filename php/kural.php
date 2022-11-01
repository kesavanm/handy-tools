<?php

class Kural {
    public $kural = '';
    public $success = [];
    public $MAX_WORDS = 7;
    public $varthaigal = [];

    public function kural($kural){
        $this->setKural($kural);
    }

    public function setKural($kural){
        $this->kural = $kural;
    }

    public function getKural(){
        return $this->kural;
    }
    public function wordsInKural(){
        $this->varthaigal = explode(' ', $this->kural);
    }

    public function validateKural(){
        $this->wordsInKural();
       return sizeof($this->varthaigal)==$this->MAX_WORDS?true:false;
    }

    public function isKuralMatchPiem(){
        #pi = 3.141592 65358979 3238462643383279502884197169399375105820974944592307816406286208998628034825342117067
        $piem = [3,1,4,1,5,9,2,6];

        if(!$this->validateKural($this->kural)){
            echo "WARNING: This appears doesn't a valid Kural! Continuing... ";
        };

        foreach ($this->varthaigal as $location => $varthai) {

            $varthai= trim($varthai,',');

            # Thanks: https://stackoverflow.com/questions/28582596

            $regex = "/\pL\pM*|./u";//Unicode letter & Unicode Mark
            preg_match_all($regex, $varthai, $varthai_out);

            $varthai_length = count($varthai_out[0]);

            $this->success[] = $varthai_length." : ".$varthai ;
            if($piem[$location] == $varthai_length){
                $isSuccess = true  ;
                continue;
            }else{
                $isSuccess = false  ;
            }
        }
        return $isSuccess;
    }

    public function explainPiem(){
        if($this->isKuralMatchPiem()){
            echo "Kural match Piem\n";
            print_r($this->success);
        }else{
            echo "Kural doesn't match Piem\n";
            print_r($this->success);
        }

    }

}

 $k = new Kural("Can a piem a vapid potpourri of");
 $k->explainPiem();



$y = "கவிதை நீ ஆகிறாய் பை கண்டதும் தீமோகங்கொண்டதென என்";
$zz = new Kural($y);
echo "INPUT: ==========> ".$zz->getKural()."<========== \n";
$zz->explainPiem();





