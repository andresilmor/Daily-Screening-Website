<?php

namespace App\Models;

use MF\Model\Model;

class Medico extends Model {

    private $id;
    private $primeiro_nome;
    private $meio_nome;
    private $ultimo_nome;
    private $identifacao;
    private $password;

    public function __get($atributo) {
        return $this->$atributo;
    }

    public function __set($atributo, $valor) {
        $this->$atributo = $valor;
    }

    public function efetuarRegistro() { //método para salvar/registrar novo médico
        $query('insert into medico (identificacao, primeiro_nome, meio_nome, ultimo_nome, password) values (:identificacao, :primeiro_nome, :meio_nome, :ultimo_nome, :passord;');

        $statement = $this->db->prepare($query);
        $statement->bindValue(':identificacao', $_POST['identificacao']);
        $statement->bindValue(':primeiro_nome', $_POST['primeiro_nome']);
        $statement->bindValue(':meio_nome', $_POST['meio_nome']);
        $statement->bindValue(':ultimo_nome', $_POST['ultimo_nome']);
        $statement->bindValue(':password', $_POST['password']);

        $statement->execute();
    }

    public function autenticar() { //método para verificar existência de médicos com a dita identificacao e password se existir preenche dados como o id do médico

        $query = ('select id_medico from medico where identificacao = :identificacao && password = :password;');

        $statement = $this->db->prepare($query);
        $statement->bindValue(':identificacao', $this->identificacao);
        $statement->bindValue(':password', $this->password);
        $statement->execute();

        $usuario = $statement->fetch(\PDO::FETCH_ASSOC);

        if($usuario['id_medico'] != '') {
            session_start();
            $_SESSION['id_medico'] = $usuario['id_medico'];

        } 

        return $this; 
    }

    public function existeMedico() {

        $query = ('select id_medico from medico where identificacao = :identificacao');

        $statement = $this->db->prepare($query);
        $statement->bindValue(':identificacao', $this->identificacao);
        $statement->execute();

        $usuario = $statement->fetch(\PDO::FETCH_ASSOC);

        if(isset($usuario['id_medico'])) {
            return true;
        } 
        return false;
    }

    public function salvar() {

        $query = ('insert into medico (primeiro_nome, meio_nome, ultimo_nome, identificacao, password)values(:primeiro_nome, :meio_nome, :ultimo_nome, :identificacao, :password);');

        $statement = $this->db->prepare($query);
        $statement->bindValue(':primeiro_nome', $this->primeiro_nome);
        $statement->bindValue(':meio_nome', $this->meio_nome);
        $statement->bindValue(':ultimo_nome', $this->ultimo_nome);
        $statement->bindValue(':identificacao', $this->identificacao);
        $statement->bindValue(':password', $this->password);

        $statement->execute();

        print_r($statement);
        return $this;
    }

}


?>