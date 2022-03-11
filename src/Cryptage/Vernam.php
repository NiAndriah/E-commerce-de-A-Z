<?php

namespace App\Cryptage;

class Vernam
{
   
    private $key;

    public function __construct()
    {
        $this->key = "Vernam";
    }
    
    public function cryptage($chat)
    {
            $l_message = strlen($chat);
            $l_cle = strlen($this->key);
            if($l_cle>$l_message){
                $this->key = substr($this->key,0,$l_message);
            }elseif($this->key<$l_message){
                $this->key = str_pad($this->key,$l_message,$this->key,STR_PAD_RIGHT);
            }
            return $chat ^ $this->key;
    }

}