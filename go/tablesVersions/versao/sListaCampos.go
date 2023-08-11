package versao

import (
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
)

// ListaCampo é uma lista de campos genéricos
type ListaCampo []ifc.ICampo

// SListaCampo : Lista com os campos de uma tabela
type SListaCampo struct {
	Fjacrioulista bool `json:"-"`
	ListaCampo
}

// NewListaCampo : Criar a lista para uso na classe
func (s *SListaCampo) NewListaCampo() {
	s.ListaCampo = make(ListaCampo, 0)
	s.Fjacrioulista = true
	s.addCamposPadroes()
}

func (s *SListaCampo) addCamposPadroes() {
	vCampo := new(SCampo)
	s.AddCampo(vCampo.AddPk("ID").SetNotNull())
}

// GetCampos carrega todos os campos da tabela
func (s *SListaCampo) GetCampos() []ifc.ICampo { return s.ListaCampo }

// AddCampo para adicionar novos campos do tipo [Interface]
func (s *SListaCampo) AddCampo(pCampo ifc.ICampo) []ifc.ICampo {
	if !s.Fjacrioulista {
		s.NewListaCampo()
	}
	s.ListaCampo = append(s.ListaCampo, pCampo)
	return s.ListaCampo
}
