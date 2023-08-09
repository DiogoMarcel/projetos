package dbconfig

import "database/sql"

// init para geração de logs
func init() {
	dbConex = CarregarDB("PG")
}

// Criar variável inacessível externamente
var dbConex IConfigDB

// Conexao : Única forma de utilizar a conexão
func Conexao() *sql.DB {
	return dbConex.DBConexao()
}

// CloseDB :
func CloseDB() {
	dbConex.Close()
}
