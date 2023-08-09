package listas

import (
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// ListaTabela é uma lista ITabela genérica
type ListaTabela []ifc.ITabela

// SListaTabela :
type SListaTabela struct{ ListaTabela }

// AddTabela é uma função para adicionar novas tabelas genéricas
func (l *SListaTabela) AddTabela(t ifc.ITabela) []ifc.ITabela {
	l.ListaTabela = append(l.ListaTabela, t)
	return l.ListaTabela
}

// GetTabelas : Carregar a var lista de tabelas
func (l *SListaTabela) GetTabelas() []ifc.ITabela { return l.ListaTabela }

// LogTabelas : Rotina para imprimir os logs, verificando o status da lista de tabelas
func (l *SListaTabela) LogTabelas() {
	for i, v := range l.ListaTabela {
		log.LogSis().Println("LogTabelas(): ltabela.go", "Tabela", i, v)
	}
}
