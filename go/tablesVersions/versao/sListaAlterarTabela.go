package versao

import (
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
)

// ListaAlteracao : Lista para alterações em tabela
type ListaAlteracao []ifc.IAlterarTabela

// sListaAlterarTabela : Estrutura para manter a lista de alterações de tabelas
type sListaAlterarTabela struct {
	Fjacrioulista bool `json:"-"`
	ListaAlteracao
}

// NewListaAlterar : Criar a lista para uso na classe
func (s *sListaAlterarTabela) NewListaAlterar() {
	s.ListaAlteracao = make(ListaAlteracao, 0)
	s.Fjacrioulista = true
}

// GetListaAlteracao : Carregar toda lista com alterações
func (s *sListaAlterarTabela) GetListaAlteracao() []ifc.IAlterarTabela { return s.ListaAlteracao }

// AddAlteraTabela : Adicionar novas alterações
func (s *sListaAlterarTabela) AddAlteraTabela(pAltera ifc.IAlterarTabela) []ifc.IAlterarTabela {
	if !s.Fjacrioulista {
		s.NewListaAlterar()
	}
	s.ListaAlteracao = append(s.ListaAlteracao, pAltera)
	return s.ListaAlteracao
}
