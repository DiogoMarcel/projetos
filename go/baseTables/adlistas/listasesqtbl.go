package adlistas

import (
	"sync"

	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	lst "github.com/DiogoMarcel/baseTables/listas"
	log "github.com/DiogoMarcel/baseTables/logsis"
	sts "github.com/DiogoMarcel/baseTables/structs"
)

// SListasEsqTbl : Estrutura principal para carregar as listas com esquemas e tabelas
type SListasEsqTbl struct {
	lst.SListaTabela
	lst.SListaEsquema
	sts.MEsquema
}

// GetListaTabela :
func (t *SListasEsqTbl) GetListaTabela() ifc.IListaTabela { return &t.SListaTabela }

// GetListaEsquema :
func (t *SListasEsqTbl) GetListaEsquema() ifc.IListaEsquema { return &t.SListaEsquema }

// SetListas : Comando receiver para iniciar o processo que carregará as listas em goroutines
func (t *SListasEsqTbl) SetListas() {
	var wg sync.WaitGroup

	// SetListas goroutine de cada lista
	t.ExecEsquemas(&wg)
	t.ExecTabelas(&wg)

	// Aguardar as duas execuções
	wg.Wait()

	// Configurado para impressão de log em arquivo
	t.LogEsquemas()
	t.LogTabelas()
}

// ExecTabelas : Criação de variáveis e carregamento de tabelas em goroutine
func (t *SListasEsqTbl) ExecTabelas(wg *sync.WaitGroup) {
	wg.Add(1)

	t.ListaTabela = make(lst.ListaTabela, 0)

	log.LogSis().Println("ExecTabelas(): listasesqtbl.go", "(GO) Carregando lista de tabelas")

	go CarregarTabelas(&t.SListaTabela, wg)
}

// ExecEsquemas : Criação de variáveis e carregamento de esquemas em goroutine
func (t *SListasEsqTbl) ExecEsquemas(wg *sync.WaitGroup) {
	wg.Add(1)

	t.ListaEsquema = make(lst.ListaEsquema, 0)

	var facEsquema = AdListaEsquemas{}
	facEsquema.WGroup = wg
	facEsquema.ListaEsquema = &t.SListaEsquema
	go facEsquema.ExecAddEsquemas()
}
