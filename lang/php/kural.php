<?php

class Kural {
    public $kural = '';
    public $printable = [];
    public $MAX_WORDS = 7;
    public $varthaigal = [];
    public $varthaigalSliced = [];

    #pi = 3.141592 65358979 3238462643383279502884197169399375105820974944592307816406286208998628034825342117067
    //public $piem = [3,1,4,1,5,9,2,6];
    public $piem = array(3,1,4,1,5,9,2,6);
    public $log = false;
    
    public function kural($kural){
        $this->setKural($kural);
    }

    public function setKural($kural){
        $this->kural = $kural;
        $this->kural = preg_replace('/\./','',$this->kural);
        $this->kural = trim(preg_replace('/\s+/', ' ',$this->kural));      
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
        if(!$this->validateKural($this->kural)){
           if($this->log) echo "WARNING: This appears doesn't a valid Kural! Continuing...\n";
        };

        $this->varthaigalSliced = array_slice($this->varthaigal, 0, sizeof($this->piem));   // returns "a", "b", and "c"
        
        foreach ($this->varthaigalSliced as $location => $varthai) {
            $varthai= trim($varthai,',');

            # Thanks: https://stackoverflow.com/questions/28582596
            $regex = "/\pL\pM*|./u";//Unicode letter & Unicode Mark
            preg_match_all($regex, $varthai, $varthai_out);

            $varthai_length = count($varthai_out[0]);

            $this->printable[] = $varthai_length." : ".$varthai ;
            if($this->piem[$location] == $varthai_length){
                $isSuccess[$location] = true  ;
                continue;
            }else{
                $isSuccess[$location] = false  ;
            }
        }

        return array_product($isSuccess);
    }

    public function explainPiem(){
        if($this->isKuralMatchPiem()){
            echo "INPUT: ==========>".$this->getKural()."<==========";
            echo " Kural match Piem\n";
            print_r($this->printable);
        }else{
            // echo " Kural doesn't match Piem\n";
            //print_r($this->printable);
        }

    }
}

$zz = new Kural("கவிதை நீ ஆகிறாய் பை கண்டதும் தீமோகங்தூண்டிவிடு மாறா மாறலிநீயடி");
$zz->explainPiem();

$kurals = file('kural.txt');       # https://github.com/jskswamy/dailykural
foreach($kurals as $kural ){
    $zz = new Kural($kural);
    $zz->explainPiem();


}