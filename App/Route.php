<?php

namespace App;

use MF\Init\Bootstrap;

class Route extends Bootstrap {

	protected function initRoutes() {

		$routes['noticias_pagina'] = array(
			'route' => '/noticias',
			'controller' => 'AppController',
			'action' => 'noticiasPagina'
		);

		$routes['home'] = array(
			'route' => '/',
			'controller' => 'IndexController',
			'action' => 'index'
		);

		$routes['pacientes'] = array(
			'route' => '/patients',
			'controller' => 'AppController',
			'action' => 'pacientesPagina'
		);

		$routes['procurar_paciente'] = array(
			'route' => '/procurar',
			'controller' => 'AppController',
			'action' => 'procurarPaciente'
		);

		$routes['login'] = array(
			'route' => '/login',
			'controller' => 'IndexController',
			'action' => 'autenticar'
		);

		$routes['registar_pagina'] = array(
			'route' => '/registarPagina',
			'controller' => 'IndexController',
			'action' => 'registarPagina'
		);

		$routes['registar'] = array(
			'route' => '/registar',
			'controller' => 'IndexController',
			'action' => 'registar'
		);

		$routes['carregando_noticias'] = array(
			'route' => '/carregando',
			'controller' => 'AppController',
			'action' => 'carregandoPagina'
		);

		$routes['logout'] = array(
			'route' => '/logout',
			'controller' => 'IndexController',
			'action' => 'logout'
		);

		$this->setRoutes($routes);
	}

}

?>