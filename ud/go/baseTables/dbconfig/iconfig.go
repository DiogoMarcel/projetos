package dbconfig

import "database/sql"

// IConfigDB : Interface para configurações de conexão ao banco de dados
type IConfigDB interface {
	DBConexao() *sql.DB
	GetTipoBanco() string
	Open() (bool, error)
	Close()
}
