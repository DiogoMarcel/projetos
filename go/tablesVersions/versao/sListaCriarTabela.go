package versao

import (
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
)

// ListaCriarTabela : Lista para criação de tabelas
type ListaCriarTabela []ifc.ICriarTabela

// sListaCriarTabela : Estrutura para manter a lista de criação de tabelas
type sListaCriarTabela struct {
	Fjacrioulista bool `json:"-"`
	ListaCriarTabela
}

// NewListaCriar : Cria a lista para uso na classe
func (s *sListaCriarTabela) NewListaCriar() {
	s.ListaCriarTabela = make(ListaCriarTabela, 0)
	s.Fjacrioulista = true
}

// GetListaCriacao : Carregar toda lista com criações de tabela
func (s *sListaCriarTabela) GetListaCriacao() []ifc.ICriarTabela { return s.ListaCriarTabela }

// AddCriarTabela : Adicionar novas criações
func (s *sListaCriarTabela) AddCriarTabela(pCriar ifc.ICriarTabela) []ifc.ICriarTabela {
	if !s.Fjacrioulista {
		s.NewListaCriar()
	}
	s.ListaCriarTabela = append(s.ListaCriarTabela, pCriar)
	return s.ListaCriarTabela
}
