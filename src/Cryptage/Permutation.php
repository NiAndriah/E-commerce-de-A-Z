<?php

namespace App\Cryptage;

class Permutation
{
    private $keyEncrp;
    private $key_Dcrp;

    public function __construct()
    {
        $this->keyEncrp = [ 1,3,0,2 ];
        $this->key_Dcrp = [ 2,0,3,1 ];
    }

    public function encrypt($txt): ?string
    {
        $encrypt = "";
        for ($i = 0; $i < strlen($txt); $i += 4) {
            if ( $i+4 <= strlen($txt)){
                foreach($this->keyEncrp as $value){
                    $encrypt .= substr($txt, $i, $i+4)[$value];
                }
            }
            else
                $encrypt .= substr($txt, $i);
        }
        return $encrypt;
    }
   
    public function decrypt($encrypt): ?string
    {
        $decrypt = "";
        for ($i = 0; $i < strlen($encrypt); $i += 4) {
            if ($i+4 <= strlen($encrypt)) {
                foreach ($this->key_Dcrp as $value) {
                    $decrypt .= substr($encrypt, $i, $i+4)[$value];
                }
            } else {
                $decrypt .= substr($encrypt, $i);
            }
        }
        return $decrypt;
    }
            
}