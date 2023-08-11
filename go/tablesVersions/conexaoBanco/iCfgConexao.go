package conexaobanco

import "database/sql"

// ICfgConexao : Interface para configurações de conexão ao banco de dados
type ICfgConexao interface {
	ConexaoBanco() *sql.DB
	GetTipoBanco() string
	Open() (bool, error)
	Close()
	TesteConexaoInit()
}
