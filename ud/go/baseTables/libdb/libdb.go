package libdb

import (
	"fmt"

	cdb "github.com/DiogoMarcel/baseTables/dbconfig"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// DBLibrary :
type DBLibrary struct {
	esquema ifc.IEsquema
	tabela  ifc.ITabela
}

// SetSchem :
func (l *DBLibrary) SetSchem(esq ifc.IEsquema) { l.esquema = esq }

// SetTable :
func (l *DBLibrary) SetTable(tbl ifc.ITabela) { l.tabela = tbl }

// ExecuteSchem :
func (l *DBLibrary) ExecuteSchem(islog bool) {
	var nEsq string

	if islog {
		nEsq = l.esquema.GetNomeEsquemaLog()
	} else {
		nEsq = l.esquema.GetNomeEsquema()
	}

	SQL := fmt.Sprintf(SQLExistsCreateSchem(), nEsq, nEsq)

	stmt, err := cdb.Conexao().Prepare(SQL)

	defer stmt.Close()

	log.LogSis().IfFatalln(err, "ExistsCreateSchem(): libdb.go", "Falha ao preparar verif and create schem")

	_, err = stmt.Exec()

	log.LogSis().IfFatalln(err, "ExistsCreateSchem(): libdb.go", "Falha ao executar verif and create schem")
}

// ExistsCreateSchem :
func (l *DBLibrary) ExistsCreateSchem() {
	l.ExecuteSchem(false)
	l.ExecuteSchem(true)
}

// ExistsTable : Verificar se existe uma tabela em banco de dados - Configurações
func (l *DBLibrary) ExistsTable() bool {
	var result bool

	err := cdb.Conexao().QueryRow(SQLExistsTable(), l.esquema.GetNomeEsquema(), l.tabela.GetNomeTabela()).Scan(&result)

	log.LogSis().IfFatalln(err, "ExistsTable(): libdb.go", "Falha ao verificar existencia de tabela")

	return result
}

// AlterTable :
func (l *DBLibrary) AlterTable() {
	log.LogSis().Infoln("Alteração de tabelas", l.tabela.GetNomeTabela())
}

// CreateTable :
func (l *DBLibrary) CreateTable(tbLog bool) {
	var (
		fields string
		schem  string
		table  string
	)

	if tbLog {
		schem = l.esquema.GetNomeEsquemaLog() + "."

		fmt.Println(schem)
	} else {
		schem = l.esquema.GetNomeEsquema() + "."
	}

	table = l.tabela.GetNomeTabela()

	for _, v := range l.tabela.GetCampos() {
		if fields != "" {
			fields += ","
		}
		fields += v.SQL()
	}

	stmt, err := cdb.Conexao().Prepare(fmt.Sprintf("CREATE TABLE %s%s (%s)", schem, table, fields))
	defer stmt.Close()

	log.LogSis().IfFatalln(err, "CreateTable(): libdb.go", "Falha ao preparar registro na criação da tabela:", table)

	_, err = stmt.Exec()

	log.LogSis().IfFatalln(err, "CreateTable(): libdb.go", "Falha ao executar criação da tabela:", table)

	if !tbLog {
		l.CreateTable(true)
	}
}
