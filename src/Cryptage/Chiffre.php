<?php

namespace App\Cryptage;

use App\Cryptage\MD5;
use App\Cryptage\Cesar;
use App\Cryptage\Vernam;
use App\Cryptage\Permutation;

class Chiffre
{
    public function enchiffre($text): ?string
    {
            $Ces = new Cesar();
            $encryptC = $Ces->encrypt($text);
            $P = new Permutation();
            $encryptP = $P->encrypt($encryptC);
            $V = new Vernam();
            $encryptV = $V->cryptage($encryptP);
            $md5 = new MD5("Clave");
            $encrypt = $md5->encrypt( $encryptV);

         return $encrypt;
    }

    public function dechiffre($encrypt): ?string
    {
            $md5 = new MD5("Clave");
            $decryptM = $md5->decrypt($encrypt);
            $V = new Vernam();
            $decryptV = $V->cryptage($decryptM);     
            $P = new Permutation();
            $decryptP = $P->decrypt($decryptV);
            $Ces = new Cesar();
            $text = $Ces->decrypt($decryptP);
            
        return $text;
    }
}