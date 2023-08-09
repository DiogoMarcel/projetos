package gerardb

import (
	"sync"

	lst "github.com/DiogoMarcel/baseTables/adlistas"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	log "github.com/DiogoMarcel/baseTables/logsis"
	sts "github.com/DiogoMarcel/baseTables/structs"
)

// GerarTabelas : Utilizado para geração de tabelas no sistema
func GerarTabelas(ls *lst.SListasEsqTbl) {
	gtb := new(gerarTabela)
	gtb.tabelas = ls.GetListaTabela()
	gtb.mpEsquema = ls.GetEsquemaSimplificado(&ls.SListaEsquema)

	gtb.startGerarTbl()
}

// gerarTabela : Estrutura para geração de tabelas
type gerarTabela struct {
	tabelas   ifc.IListaTabela
	mpEsquema *sts.MEsquema
}

func (t *gerarTabela) startGerarTbl() {
	wg := new(sync.WaitGroup)
	var mutx sync.Mutex

	for ky, vl := range *t.mpEsquema {
		for _, tb := range t.tabelas.GetTabelas() {
			if tb.GetTipoEsquema() == ky.Tipo {
				wg.Add(1)

				go t.atTabela(tb, ky, vl, wg, &mutx)
			}
		}
	}

	wg.Wait()
}

func (t *gerarTabela) atTabela(it ifc.ITabela, es sts.SEsquema, emp int, wg *sync.WaitGroup, mt *sync.Mutex) {
	defer func() {
		wg.Done()
		mt.Unlock()
	}()
	mt.Lock()

	//it.PosicionaEsquema(es)

	/*
		js := lib.GetJSON(it)
		fmt.Println(js)
		fmt.Println(lib.GetHASH(js))
	*/

	log.LogSis().Println("atTabela(): gerartbl.go", "Table:", it.GetNomeTabela(), "Esquema:", es)

	//log.LogSis().Println("atTabela:\nit", it, "\nes:", es, "\nemp:", emp, "\nwg:", wg, "\nmt:", mt)
}
