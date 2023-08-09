package gerardb

import (
	"sync"

	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ldb "github.com/DiogoMarcel/baseTables/libdb"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	tbl "github.com/DiogoMarcel/baseTables/libtabela"
	sts "github.com/DiogoMarcel/baseTables/structs"
)

// PadraoInicial :
func PadraoInicial() {
	cfg := new(cfgInicialPadrao)
	cfg.inicio()
	cfg.tabelasIniciais()
}

// cfgInicialPadrao : Estrutura para gerar tabelas e outras configurações iniciais
type cfgInicialPadrao struct {
	esquema ifc.IEsquema
	gdb     *GerarDB
	wg      *sync.WaitGroup
}

func (c *cfgInicialPadrao) inicio() {
	c.wg = new(sync.WaitGroup)
	c.esquema = new(sts.SEmpEsquema)
	c.gdb = new(GerarDB)
}

// TabelasIniciais : Verificar tabelas de configurações iniciais
func (c *cfgInicialPadrao) tabelasIniciais() {
	c.verificaSchemCfgInicial()

	c.addTabelaHash() // Tabela principal para carregar todas as demais tabelas, portanto a primeira da lista

	c.verifTabela(tbl.TbCfgEsquema())
	c.verifTabela(tbl.TbOutra())

	// ... Add novas tabelas padrões aqui
	// ... Add novas tabelas padrões aqui
	// ... Add novas tabelas padrões aqui

	c.wg.Wait()
}

func (c *cfgInicialPadrao) addTabelaHash() {
	c.wg.Add(1)

	go func() {
		// Os hashs devem carregar assim que verificar a tabela
		GetMapHash().SetHashs(c.esquema)

		c.verifTabela(tbl.TbHashTabela())

		c.wg.Done()
	}()

	c.wg.Wait()
}

func (c *cfgInicialPadrao) verificaSchemCfgInicial() {
	c.esquema.SetTipo(cnt.ShShare)
	c.esquema.SetNomeEsquema("ep000")

	libDB := new(ldb.DBLibrary)
	libDB.SetSchem(c.esquema)
	libDB.ExistsCreateSchem()
}

func (c *cfgInicialPadrao) verifTabela(tabela ifc.ITabela) {
	c.wg.Add(1)

	go c.gdb.AddTabela(c.esquema, tabela, c.wg)
}
