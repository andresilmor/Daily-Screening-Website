<?php

namespace App\Models;

use MF\Model\Model;

class Paciente extends Model {

    private $id;
    private $primeiro_nome;
    private $meio_nome;
    private $ultimo_nome;

    public function __get($atributo) {
        return $this->$atributo;
    }

    public function __set($atributo, $valor) {
        $this->$atributo = $valor;
    }

    public function procurar($nome) {
        $query = "select primeiro_nome + ' ' + meio_nome + ' ' + ultimo_nome as paciente_nome where ";
    }

}


?>