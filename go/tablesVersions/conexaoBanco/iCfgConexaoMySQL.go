package conexaobanco

import (
	"database/sql"
	"fmt"

	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
	log "github.com/DiogoMarcel/tablesVersions/logsGeral"
)

// ICfgConexaoMySQL Conexão com o banco de dados MySQL
type ICfgConexaoMySQL struct {
	FBanco  *sql.DB
	FConfig *SConfigDB
}

// ConexaoBanco : Carregar a conexão com o banco
func (c *ICfgConexaoMySQL) ConexaoBanco() *sql.DB { return c.FBanco }

// GetTipoBanco : Tipo do banco de dados
func (c *ICfgConexaoMySQL) GetTipoBanco() string { return cnt.MYSQL }

// Open : Abrir conexão com o banco
func (c *ICfgConexaoMySQL) Open() (bool, error) {
	// Carregar configurações do arquivo para carregar o banco de dados
	c.FConfig = new(SConfigDB)

	c.FConfig.setConfig()

	var err error
	c.FBanco, err = sql.Open("mysql", c.strConexao())

	if err != nil {
		return false, err
	}

	if err = c.FBanco.Ping(); err != nil {
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

// Close : Fechando a conexão com o banco
func (c *ICfgConexaoMySQL) Close() {
	c.FBanco.Close()
	log.LogSis().Infof("Close(): conectmysql.go", "DB %s desconectado!", c.FConfig.getDBName())
}

// strConexao : Carregar a string de conexão com o banco
func (c *ICfgConexaoMySQL) strConexao() string {
	return fmt.Sprintf("root:%s@/%s", c.FConfig.Fuser, c.FConfig.FdbName)
}

// SQLcreateDB : SQL padrão para criar uma base de dados
func (c *ICfgConexaoMySQL) SQLcreateDB() string {
	return fmt.Sprintf("create database if not exists %s", c.FConfig.FdbName)
}

// TesteConexaoInit : Testar a conexão após o create da fábrica
func (c *ICfgConexaoMySQL) TesteConexaoInit() {
	if b, err := c.Open(); !b || err != nil {
		log.LogSis().Panicf("(%s) Banco de dados não pode ser conectado! Falha: %s", "TesteConexaoInit(): ICfgConexaoMySQL.go", err)
	}
}
