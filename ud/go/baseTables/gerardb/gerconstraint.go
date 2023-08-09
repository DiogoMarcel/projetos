package gerardb

import (
	"fmt"
	"sync"

	lst "github.com/DiogoMarcel/baseTables/adlistas"
)

// GerarConstraints : Após a geração de tabelas as constraints devem ser geradas
func GerarConstraints(listas *lst.SListasEsqTbl) {
	gtb := new(gerarConstraint)
	gtb.ls = listas
	gtb.startGerarConstraint()

	fmt.Println("TODO: Aqui ao gerar as relações, só passar a lista de tabelas, não haverá necessidade dos esquemas", "GerarConstraints()", "gerarconstraints.go")
}

// gerarConstraint : Geração de relações entre tabelas
type gerarConstraint struct {
	ls *lst.SListasEsqTbl
}

func (t *gerarConstraint) startGerarConstraint() {
	wg := new(sync.WaitGroup)
	//var mutx sync.Mutex

	for j := 1; j <= 1; j++ { // Empresas - Esquemas

		// for _, tb := range *ls.GetT().GetLista() {
		// for ky, vl := range *tb.GetEsquema() {
		// 	wg.Add(1)

		// 	go func(t lib.ITabela, es lib.SEsquema, emp int, wg *sync.WaitGroup) {
		// 		defer wg.Done()
		// 		mutx.Lock()

		// 		tb.PosicionaEsquema(es)

		// 		for _, rl := range t.GetConstraint() {
		// 			log.LogSis().Println(t.GetNomeTabela(), rl.Get(), rl.TipoEsquema().Get(), "Empresa:", emp)
		// 		}

		// 		mutx.Unlock()

		// 	}(tb, ky, vl, wg)
		// }
		//}
	}

	wg.Wait()
}
