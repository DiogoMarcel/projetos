package conexaobanco

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq" // carregar lib postgres

	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
	log "github.com/DiogoMarcel/tablesVersions/logsGeral"
)

// ICfgConexaoPostgres Conexão com o banco de dados PostgreSQL
type ICfgConexaoPostgres struct {
	FBanco  *sql.DB
	FConfig *SConfigDB
}

// ConexaoBanco : Carregar a conexão com o banco
func (c *ICfgConexaoPostgres) ConexaoBanco() *sql.DB { return c.FBanco }

// GetTipoBanco : Tipo do banco de dados
func (c *ICfgConexaoPostgres) GetTipoBanco() string { return cnt.POSTGRESQL }

// Open : Abrir conexão com o banco
func (c *ICfgConexaoPostgres) Open() (bool, error) {
	// Carregar configurações do arquivo para carregar o banco de dados
	c.FConfig = new(SConfigDB)

	c.FConfig.setConfig()

	var err error
	c.FBanco, err = sql.Open("postgres", c.strConexao(false))

	if err != nil {
		return false, fmt.Errorf("Não foi possível conectar ao banco de dados! %s", err)
	}

	if err = c.FBanco.Ping(); err != nil {

		c.FBanco.Close()
		c.FBanco, err = sql.Open("postgres", c.strConexao(true))

		if err != nil {
			return false, fmt.Errorf("Não foi possível conectar ao banco de dados postgres para criar a base de dados! %s", err)
		}

		log.LogSis().Warningf("(%s) Banco de dados conectado, porém inválido! Tentando criar base %s", "Open(): iCfgConexaoPostgre.go", c.FConfig.getDBName())

		if _, err := c.FBanco.Exec(c.SQLcreateDB()); err != nil {
			return false, err
		}

		c.FBanco.Close()

		return c.Open()
	}

	log.LogSis().Infof("(%s) DB %s conectado!", "Open(): iCfgConexaoPostgre.go", c.FConfig.getDBName())

	return true, nil
}

// Close : Fechar a conexão com o banco
func (c *ICfgConexaoPostgres) Close() {
	c.FBanco.Close()
	log.LogSis().Infof("(%s) DB %s desconectado!", "Close(): iCfgConexaoPostgre.go", c.FConfig.getDBName())
}

// strConexao : Carregar a string de conexão com o banco
func (c *ICfgConexaoPostgres) strConexao(pCreateDB bool) string {
	formatar := "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable"
	nameDB := "postgres"
	if !pCreateDB {
		nameDB = c.FConfig.FdbName
	}
	return fmt.Sprintf(formatar, c.FConfig.Fhost, c.FConfig.Fport, c.FConfig.Fuser, c.FConfig.Fpassword, nameDB)
}

// SQLcreateDB : SQL padrão para criar uma base de dados
func (c *ICfgConexaoPostgres) SQLcreateDB() string {
	return fmt.Sprintf("CREATE DATABASE %s WITH OWNER = %s ENCODING = %s TABLESPACE = %s TEMPLATE= %s",
		c.FConfig.FdbName,
		c.FConfig.Fowner,
		c.FConfig.Fencoding,
		c.FConfig.FtableSpace,
		c.FConfig.Ftemplate)
}

// TesteConexaoInit : Testar a conexão após o create da fábrica
func (c *ICfgConexaoPostgres) TesteConexaoInit() {
	if b, err := c.Open(); !b || err != nil {
		log.LogSis().Panicf("(%s) Banco de dados não pode ser conectado! Falha: %s", "TesteConexaoInit(): ICfgConexaoPostgres.go", err)
	}
}
