package adlistas

import (
	"sync"

	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	tbl "github.com/DiogoMarcel/baseTables/libtabela"
)

// CarregarTabelas : Principal método para adicionar tabelas na lista
// Apenas irá escrever no canal ao término do método
func CarregarTabelas(l ifc.IListaTabela, wg *sync.WaitGroup) {
	defer func() {
		wg.Done()
	}()

	tbl.SetListaEp000(l)
	tbl.SetListaEstoque(l)
	tbl.SetListaCliente(l)
	tbl.SetListaFaturamento(l)
}
