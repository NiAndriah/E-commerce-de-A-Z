<?php

namespace App\Cryptage;

class Cesar
{
    private $key;
    private $pos;

    public function __construct()
    {
        $this->key = 17;
        $this->pos = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    }

    public function encrypt($text): ?string
    {
        for($i=0 ; $i<strlen($text); $i++){	
            if(strpos($this->pos, $text[$i]) !== false){
                $j=strpos($this->pos, substr($text,$i,1));			
                $j += $this->key;
                if ($j>51)
                    $j -=52;
                $text[$i]=$this->pos[$j];
            }
        }
        return $text;
    }

    public function decrypt($text): ?string
    {
        for($i=0 ; $i<strlen($text); $i++){	
            if(strpos($this->pos, $text[$i]) !== false){
                $j=strpos($this->pos, substr($text,$i,1));			
                $j -= $this->key;
                if ($j<0)
                    $j +=52;
                $text[$i]=$this->pos[$j];
            }
        }
        return $text;
    }

}