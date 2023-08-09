package gerardb

import (
	"sync"

	ldb "github.com/DiogoMarcel/baseTables/libdb"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// GerarDB :
type GerarDB struct{}

// AddTabela :
func (g *GerarDB) AddTabela(e ifc.IEsquema, t ifc.ITabela, wg *sync.WaitGroup) {
	libDB := new(ldb.DBLibrary)
	libDB.SetSchem(e)
	libDB.SetTable(t)

	temHash, temTabela, hashTB, idHash := GetMapHash().EncontrouHashTbl(e, t)

	/* Se tem o hash passar para a próxima tabela */
	/* Se não tem o hash mas encontrou a tabela, é pq esta criada com outra estrutura */
	/* Ainda assim, verificar em banco se a tabela existe ou não para garantir que será criada sem falhas */

	if !temHash {
		if temTabela {
			libDB.AlterTable()
		} else if !libDB.ExistsTable() {
			libDB.CreateTable(false)
		}

		GetMapHash().UpdateTbHash(e, t, hashTB, idHash)

		log.LogSis().Infoln("AddTabela(): gerarbanco.go", "Tabela adicionada:", t.GetNomeTabela())
	}

	wg.Done()
}
