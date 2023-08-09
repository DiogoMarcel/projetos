package gerardb

import (
	"fmt"

	cdb "github.com/DiogoMarcel/baseTables/dbconfig"
	ldb "github.com/DiogoMarcel/baseTables/libdb"
	lib "github.com/DiogoMarcel/baseTables/libfuncoes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	tbl "github.com/DiogoMarcel/baseTables/libtabela"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// init
func init() {
	mapHashTbl = new(HashTable)
	mapHashTbl.mapHash = []tableHash{}
}

type tableHash struct {
	// ordenar no scan conforme a inclusão na tabela fconfigs.go
	idhash  int
	codhash string
	esquema string
	tabela  string
	empresa int
}

// HashTable :
type HashTable struct {
	mapHash []tableHash
}

// SMapHashTbl :
var mapHashTbl *HashTable

// GetMapHash : Carregar o ponteiro para os HASHs de tabelas
func GetMapHash() *HashTable {
	return mapHashTbl
}

func (h *HashTable) verifTableDB(e ifc.IEsquema) bool {
	libDB := new(ldb.DBLibrary)
	libDB.SetSchem(e)
	libDB.SetTable(tbl.TbHashTabela())

	return libDB.ExistsTable()
}

// SetHashs :
func (h *HashTable) SetHashs(e ifc.IEsquema) {
	if !h.verifTableDB(e) {
		return
	}

	tabela := tbl.TbHashTabela()

	SQL := "SELECT COUNT(*) FROM ep000." + tabela.GetNomeTabela()

	iCountSQL := 0
	err := cdb.Conexao().QueryRow(SQL).Scan(&iCountSQL)

	log.LogSis().IfFatalln(err, "SetHashs(): gerhash.go", "Falha ao verificar tabela de HASH")

	if iCountSQL != 0 {
		var fields string
		for _, v := range tabela.GetCampos() {
			if fields != "" {
				fields += ","
			}
			fields += v.GetNomeCampo()
		}

		SQL = fmt.Sprintf("SELECT %s FROM ep000.%s", fields, tabela.GetNomeTabela())

		rows, err := cdb.Conexao().Query(SQL)

		log.LogSis().IfFatalln(err, "SetHashs(): gerhash.go", "Não foi possível carregar os valores da tabela HASH")

		for rows.Next() {
			var tbl tableHash

			err = rows.Scan(&tbl.idhash, &tbl.codhash, &tbl.esquema, &tbl.tabela, &tbl.empresa)

			log.LogSis().IfFatalln(err, "SetHashs(): gerhash.go", "Falha ao mapear tabela de HASH")

			h.mapHash = append(h.mapHash, tbl)
		}
	}
}

// EncontrouHashTbl :
func (h *HashTable) EncontrouHashTbl(e ifc.IEsquema, t ifc.ITabela) (temHash bool, temTable bool, hashTB string, idHash int) {
	temHash = false
	temTable = false
	idHash = 0

	type SEsqTabela struct {
		ifc.IEsquema
		ifc.ITabela
	}
	esqtbl := SEsqTabela{IEsquema: e, ITabela: t}

	JSON := lib.GetJSON(esqtbl)

	//fmt.Println(JSON)

	hashTB = lib.GetHASH(JSON)
	//hashTB = lib.GetHASH(lib.GetJSON(esqtbl))

	//index, value := Find(h.mapHash, tbl)
	for _, v := range h.mapHash {
		if !temTable {
			temTable = e.GetNomeEsquema() == v.esquema && t.GetNomeTabela() == v.tabela

			if temTable {
				temHash = hashTB == v.codhash
				idHash = v.idhash
				return
			}
		}
	}
	return
}

// UpdateTbHash :
func (h *HashTable) UpdateTbHash(e ifc.IEsquema, t ifc.ITabela, hashTB string, idHash int) {
	var SQL string

	table := tbl.TbHashTabela()
	fields := "codhash, esquema, tabela, empresa"
	values := fmt.Sprintf("'%s', '%s', '%s', %v", hashTB, e.GetNomeEsquema(), t.GetNomeTabela(), e.GetEmpresa())

	if idHash == 0 {
		SQL = fmt.Sprintf("INSERT INTO ep000.%s (%s) VALUES (%s)", table.GetNomeTabela(), fields, values)
	} else {
		SQL = fmt.Sprintf("UPDATE ep000.%s SET codhash='%s' WHERE id_hash=%v", table.GetNomeTabela(), hashTB, idHash)
	}

	stmt, err := cdb.Conexao().Prepare(SQL)
	defer stmt.Close()

	log.LogSis().IfFatalln(err, "UpdateTbHash(): gerhash.go", "Falha ao preparar registro", SQL)

	_, err = stmt.Exec()

	log.LogSis().IfFatalln(err, "UpdateTbHash(): gerhash.go", "Falha ao executar", SQL)
}
