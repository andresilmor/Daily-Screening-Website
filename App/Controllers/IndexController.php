<?php

namespace App\Controllers;

//os recursos do miniframework
use MF\Controller\Action;
use MF\Model\Container;

class IndexController extends Action {
	
	public function index() {
		parent::verificarSeLogado();
		$this->render('loginPagina', 'layoutIndex');
	}

	public function registarPagina() {
		parent::verificarSeLogado();
		$this->render('registarPagina', 'layoutIndex');
	}

	public function logout() {
		session_start();
		$_SESSION['logged_in'] = false;
		session_destroy();
		header('Location: /');
	}

	public function autenticar() { //Este metodo criar um objeto do tipo medico, passando os valores de login, invoca um metodo da classe que com esses valores procura pelo médico na db, preenchendo o resto dos dados.
		
		parent::verificarSeLogado();

		$medico = Container::getModel('Medico');
		
		$medico->__set('identificacao', $_POST['identificacao']);
		$medico->__set('password', md5($_POST['password']));

		$medico->autenticar();

		if(isset($_SESSION['id_medico']) && $_SESSION['id_medico'] != '') {
			$_SESSION['logged_in'] = true;
			header('Location: /carregando');
		} else {
			header('Location: /?erro=invalido');
		}
		
	}

	public function registar() {

		parent::verificarSeLogado();
		
		$medico = Container:: getModel('Medico');

		if($_POST['password'] != $_POST['confirmPassword']) {
			header('Location: /registarPagina?erro=password');
			return;
		}

		if (!isset($_POST['identificacao']) || preg_match('([a-zA-Z].*[a-zA-Z])', $_POST['identificacao']) || strlen($_POST['identificacao']) < 5) {
			header('Location: /registarPagina?erro=id');
			return;
		} 

		if (!isset($_POST['nomeTodo']) || preg_match('([0-9].*[0-9])', $_POST['nomeTodo']) || strlen($_POST['nomeTodo']) < 5 || strpos($_POST['nomeTodo'], ' ') != true) {
			header('Location: /registarPagina?erro=nome');
			return;
		}

		if (!isset($_POST['password']) || !isset($_POST['confirmPassword']) || $_POST['password'] != $_POST['confirmPassword']) {
			echo 'erro';
		}

		$medico->__set('identificacao', $_POST['identificacao']);
		$medico->__set('password', md5($_POST['password']));

		if($medico->existeMedico()) {
			header('Location: /registarPagina?erro=registrado');
			return;
		}

		$partes = explode(' ', $_POST['nomeTodo']);

		$medico->__set('primeiro_nome', $partes[0]);

		if(sizeof($partes) >= 3) {
			$medico->__set('meio_nome', $partes[1]);
			for($index = 2; $index < sizeof($partes)-1; $index++) {
				$medico->__set('meio_nome', $medico->__get('meio_nome') . ' ' . $partes[$index]);
			}
		}

		$medico->__set('ultimo_nome', $partes[sizeof($partes)-1]);

		$medico->salvar();

		header('Location: /');

	}
	

}


?>