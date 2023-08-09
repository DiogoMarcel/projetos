package adlistas

import (
	"sync"

	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	log "github.com/DiogoMarcel/baseTables/logsis"
	sts "github.com/DiogoMarcel/baseTables/structs"
)

// AdListaEsquemas : Manutenção de esquemas na base de dados
type AdListaEsquemas struct {
	WGroup       *sync.WaitGroup
	TbEsquema    ifc.ITabela
	ListaEsquema ifc.IListaEsquema
}

// ExecAddEsquemas : Executar a adição de esquemas na lista e banco de dados
func (e *AdListaEsquemas) ExecAddEsquemas() {
	log.LogSis().Println("ExecAddEsquemas(): adlistaesquema.go", "(GO) Carregando lista de esquemas")
	e.setListaEsquema()
}

// setListaEsquema : É utilizado para adicionar todos os esquemas encontrados/configurados na base ao map
func (e *AdListaEsquemas) setListaEsquema() {
	defer func() {
		e.WGroup.Done()
	}()

	//SEmpEsquema
	// c.libDB = ldb.DBLibrary{}

	// c.esquema.Tipo = cnt.ShShare
	// c.esquema.Descricao = "ep000"

	// c.libDB.SetSchem(&c.esquema)
	// c.libDB.ExistsCreateSchem()

	var es novoEsquemaEmpresa
	esqCfg := es.esquemasDB(false)
	defer esqCfg.Close()

	e.ListaEsquema.AddEsquema(es.schemShare())

	for esqCfg.Next() {
		err := esqCfg.Scan(&es.empresa, &es.esqmovto, &es.esqcliente, &es.esqestoque)
		log.LogSis().IfFatalln(err)

		e.ListaEsquema.AddEsquema(es.schemCliente())
		e.ListaEsquema.AddEsquema(es.schemEstoque())
		e.ListaEsquema.AddEsquema(es.schemMovimento())
	}

	// obter qualquer erro encontrado durante a iteração
	err := esqCfg.Err()
	log.LogSis().IfFatalln(err)
}

type novoEsquemaEmpresa struct {
	sts.SEmpEsquema
	DBListaEsquema
}

func (n *novoEsquemaEmpresa) schemShare() *sts.SEmpEsquema {
	return n.NovoEmpEsquema(cnt.ShShare, "ep000", 0)
}

func (n *novoEsquemaEmpresa) schemCliente() *sts.SEmpEsquema {
	return n.NovoEmpEsquema(cnt.ShCliente, n.esqcliente, n.empresa)
}

func (n *novoEsquemaEmpresa) schemEstoque() *sts.SEmpEsquema {
	return n.NovoEmpEsquema(cnt.ShEstoque, n.esqestoque, n.empresa)
}

func (n *novoEsquemaEmpresa) schemMovimento() *sts.SEmpEsquema {
	return n.NovoEmpEsquema(cnt.ShMovimento, n.esqmovto, n.empresa)
}
