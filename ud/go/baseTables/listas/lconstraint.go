package listas

import (
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// ListaConstraint é uma lista de relação genérica
type ListaConstraint []ifc.IConstraint

// AddConstraint para adicionar novas relações entre tabelas
func (l *ListaConstraint) AddConstraint(r ifc.IConstraint) { *l = append(*l, r) }

// GerarConstraints carrega todas as relações da tabela
func (l *ListaConstraint) GerarConstraints() []ifc.IConstraint { return *l }
