package structs

import (
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	lst "github.com/DiogoMarcel/baseTables/listas"
)

// STabela : Estrutura genérica de uma tabela
type STabela struct {
	SLibNomeTabela      // o Json será criado na estrutura de origem
	lst.ListaCampo      `json:"campos"`
	lst.ListaConstraint `json:"constraints,omitempty"`
	SValidaTbl          `json:"-"` // por ser uma função, não contempla json...
}

// NovaTabela : tabela generica/interface para inclusão
// Por questão de composição deixei o parâmetro n *TableExt na rotina Nova,
// assim é obrigatório que seja informado e certificado que os dados foram inclusos
func (t *STabela) NovaTabela(i ifc.ILibNomeTabela) *STabela {
	g := new(STabela)
	g.setPadraoTbGeneric(i)
	return g
}

// setPadraoTbGeneric para adicionar em toda tabela generica o mesmo formato
func (t *STabela) setPadraoTbGeneric(i ifc.ILibNomeTabela) {
	t.SetNomeTabela(i.GetNomeTabela())
	t.SetExtensao(i.GetExtensao())
	t.SetTipoEsquema(i.GetTipoEsquema())

	t.SetCpsPadroes()
	t.SetValidacao(func() bool { return true })
}

// SetCpsPadroes para adicionar os campos padrões para todas as tabelas
func (t *STabela) SetCpsPadroes() {
	// c := SCampo{}

	// t.AddCampo(c.AddInt("OPERAD_" + t.GetExtensao())) // .SetTamanho(cnt.CINTEGER)
	// t.AddCampo(c.AddChr("EXPORT_" + t.GetExtensao()).SetTamanho(1))
	// t.AddCampo(c.AddDta("DCADAS_" + t.GetExtensao()))
}
