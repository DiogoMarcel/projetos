package dbconfig

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq" // carregar lib postgres

	log "github.com/DiogoMarcel/baseTables/logsis"
)

// DBPostgres Conexão com o banco de dados Postgres
type DBPostgres struct {
	banco  *sql.DB
	config *SConfigDB
}

// DBConexao : Carregar a conexão com o banco
func (c *DBPostgres) DBConexao() *sql.DB { return c.banco }

// GetTipoBanco : Tipo do banco de dados
func (c *DBPostgres) GetTipoBanco() string { return "PG" }

// Open : Abrir conexão com o banco
func (c *DBPostgres) Open() (bool, error) {
	// Carregar configurações do arquivo para carregar o banco de dados
	c.config = new(SConfigDB)

	c.config.setConfig()

	var err error
	c.banco, err = sql.Open("postgres", c.strConexao(false))

	if err != nil {
		return false, fmt.Errorf("Não foi possível conectar ao banco de dados! %s", err)
	}

	if err = c.banco.Ping(); err != nil {

		c.banco.Close()
		c.banco, err = sql.Open("postgres", c.strConexao(true))

		if err != nil {
			return false, fmt.Errorf("Não foi possível conectar ao banco de dados postgres para criar a base de dados! %s", err)
		}

		log.LogSis().Warningf("(%s) Banco de dados conectado, porém inválido! Tentando criar base %s", "Open(): conecpg.go", c.config.getDBName())

		if _, err := c.banco.Exec(c.SQLcreateDB()); err != nil {
			return false, err
		}

		c.banco.Close()
		return c.Open()
	}

	log.LogSis().Infof("(%s) DB %s conectado!", "Open(): conecpg.go", c.config.getDBName())

	return true, nil
}

// Close : Fechar a conexão com o banco
func (c *DBPostgres) Close() {
	c.banco.Close()
	log.LogSis().Infof("(%s) DB %s desconectado!", "Close(): conecpg.go", c.config.getDBName())
}

// strConexao : Carregar a string de conexão com o banco
func (c *DBPostgres) strConexao(createDB bool) string {
	formatar := "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable"
	nameDB := "postgres"
	if !createDB {
		nameDB = c.config.dbName
	}
	return fmt.Sprintf(formatar, c.config.host, c.config.port, c.config.user, c.config.password, nameDB)
}

// SQLcreateDB : SQL padrão para criar uma base de dados
func (c *DBPostgres) SQLcreateDB() string {
	return fmt.Sprintf("CREATE DATABASE %s WITH OWNER = %s ENCODING = %s TABLESPACE = %s TEMPLATE= %s",
		c.config.dbName,
		c.config.owner,
		c.config.encoding,
		c.config.tableSpace,
		c.config.template)
}
