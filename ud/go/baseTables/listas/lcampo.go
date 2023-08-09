package listas

import ifc "github.com/DiogoMarcel/baseTables/libinterface"

// ListaCampo é uma lista de campos genéricos
type ListaCampo []ifc.ICampo

// GetCampos carrega todos os campos da tabela
func (l *ListaCampo) GetCampos() []ifc.ICampo { return *l }

// AddCampo para adicionar novos campos do tipo [Interface]
func (l *ListaCampo) AddCampo(c ifc.ICampo) { *l = append(*l, c) }
