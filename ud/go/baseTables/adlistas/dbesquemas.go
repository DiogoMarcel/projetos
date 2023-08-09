package adlistas

import (
	"database/sql"

	cdb "github.com/DiogoMarcel/baseTables/dbconfig"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

type dbTblEsquema struct {
	id         int    `db:"id"`
	empresa    int    `db:"empresa"`
	esqmovto   string `db:"esqmovto"`
	esqcliente string `db:"esqcliente"`
	esqestoque string `db:"esqestoque"`
}

// DBListaEsquema :
type DBListaEsquema struct {
	dbTblEsquema
}

func (n *DBListaEsquema) esquemasDB(recursiva bool) *sql.Rows {
	esquemasSQL := "SELECT COUNT(*) FROM ep000.esquemasdb"
	iCountSQL := 0

	err := cdb.Conexao().QueryRow(esquemasSQL).Scan(&iCountSQL)

	if err != nil || iCountSQL == 0 {

		if !recursiva && iCountSQL == 0 { // chamada da função recursiva
			n.inserirEsquemasPadrao()
			return n.esquemasDB(true)
		}

		log.LogSis().IfFatalln(err, "esquemasDB(): dbesquemas.go", "Falha ao carregar os esquemas")
		return nil
	}

	esquemasSQL = "SELECT empresa,esqmovto,esqcliente,esqestoque FROM ep000.esquemasdb ORDER BY ID"

	rows, err := cdb.Conexao().Query(esquemasSQL)

	log.LogSis().IfFatalln(err, "esquemasDB(): dbesquemas.go", "Falha ao carregar os esquemas")

	return rows
}

func (n *DBListaEsquema) inserirEsquemasPadrao() {

	SQL := "INSERT INTO ep000.esquemasdb "
	SQL += "(empresa"
	SQL += ",esqmovto"
	SQL += ",esqcliente"
	SQL += ",esqestoque)"
	SQL += " VALUES "
	SQL += "(1, $1, $1, $1)"

	stmt, err := cdb.Conexao().Prepare(SQL)
	defer stmt.Close()

	log.LogSis().IfFatalln(err, "inserirEsquemasPadrao(): dbesquemas.go", "Falha ao preparar insert esquemas padrão")

	_, err = stmt.Exec("ep001")

	log.LogSis().IfFatalln(err, "inserirEsquemasPadrao(): dbesquemas.go", "Falha ao executar insert esquemas padrão")
}
