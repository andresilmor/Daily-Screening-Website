<?php

namespace App;

class Connection {

	public static function getDb() {
		try {

			$conn = new \PDO(
				"mysql:host=localhost;dbname=dailyscreening;charset=utf8",
				"root",
				"" 
			);

			return $conn;

		} catch (\PDOException $erro) {
			echo '<b>Erro:</b> '.$erro.getCode().' <b>Mensagem:</b> <i>'.$erro.getMessage().'</i>';
		}
	}
}

?>