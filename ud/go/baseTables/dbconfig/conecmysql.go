package dbconfig

import (
	"database/sql"
	"fmt"

	log "github.com/DiogoMarcel/baseTables/logsis"
)

// DBMySQL Conexão com o banco de dados Postgres
type DBMySQL struct {
	banco  *sql.DB
	config *SConfigDB
}

// DBConexao : Carregar a conexão com o banco
func (c *DBMySQL) DBConexao() *sql.DB { return c.banco }

// GetTipoBanco : Tipo do banco de dados
func (c *DBMySQL) GetTipoBanco() string { return "MySQL" }

// Open : Abrir conexão com o banco
func (c *DBMySQL) Open() (bool, error) {
	// Carregar configurações do arquivo para carregar o banco de dados
	c.config = new(SConfigDB)

	c.config.setConfig()

	var err error
	c.banco, err = sql.Open("mysql", c.strConexao())

	if err != nil {
		return false, err
	}

	if err = c.banco.Ping(); err != nil {
		//c.Conexao, err = sql.Open("postgres", c.strConexao())
		// if err != nil {
		// 	return false, fmt.Errorf("Não foi possível conectar ao banco de dados postgres para criar a base de dados! %s", err)
		// }
		// log.Warning("Banco de dados conectado, porém inválido! Tentando criar base " + c.Config.getDBName())
		// if _, err := c.Conexao.Exec(c.SQLCreateDB()); err != nil {
		// 	return false, err
		// }
		// return c.Open()
	}

	return true, nil
}

// Close : Fechar a conexão com o banco
func (c *DBMySQL) Close() {
	c.banco.Close()
	log.LogSis().Infof("Close(): conectmysql.go", "DB %s desconectado!", c.config.getDBName())
}

// strConexao : Carregar a string de conexão com o banco
func (c *DBMySQL) strConexao() string {
	return fmt.Sprintf("root:%s@/%s", c.config.user, c.config.dbName)
}

// SQLcreateDB : SQL padrão para criar uma base de dados
func (c *DBMySQL) SQLcreateDB() string {
	return fmt.Sprintf("create database if not exists %s", c.config.dbName)
}
