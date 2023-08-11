package conexaobanco

import (
	"database/sql"

	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
)

// init para a conexão com o banco de dados desejado
func init() {
	dbConexao = GetFactoryDB(cnt.POSTGRESQL)
	dbConexao.TesteConexaoInit()
}

// Variável inacessível externamente
var dbConexao ICfgConexao

// Conexao : Única forma de utilizar a conexão - Retornando a var criada no início do sistema
func Conexao() *sql.DB {
	return dbConexao.ConexaoBanco()
}

// CloseDB : Para não ter de chamar 'toda' nomenclatura externamente e possibilitar algum tratamento
func CloseDB() {
	dbConexao.Close()
}
