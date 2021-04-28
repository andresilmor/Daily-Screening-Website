<?php

namespace App\Controllers;

//os recursos do miniframework
use MF\Controller\Action;
use MF\Model\Container;

class AppController extends Action {

	public function noticiasPagina() {
		session_start();
		if (!isset($_SESSION['id_medico']) || $_SESSION['id_medico'] == '') {
			header('Location: /');
		}

		$this->render('noticiasPagina', 'layoutNoticias');
	}

	public function carregandoPagina() {
		session_start();
		if (!isset($_SESSION['id_medico']) || $_SESSION['id_medico'] == '') {
			header('Location: /');
		}
		$this->render('carregandoPagina', 'layoutNoticias');
    }
    
    public function pacientesPagina() {
		session_start();
		if (!isset($_SESSION['id_medico']) || $_SESSION['id_medico'] == '') {
			header('Location: /');
		}

		$this->render('pacientesPagina');
	}

	public function procurarPaciente() {
		session_start();
		if (!isset($_SESSION['id_medico']) || $_SESSION['id_medico'] == '') {
			header('Location: /');
		}

		$paciente = Container::getModel('Paciente');
		
		$paciente->procurar($_POST['nome']);
	}


}


?>