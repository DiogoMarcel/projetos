package listas

import (
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// ListaEsquema é uma lista IEsquema genérica - Contém todos os esquemas contidos na base
type ListaEsquema []ifc.IEsquema

// SListaEsquema :
type SListaEsquema struct{ ListaEsquema }

// AddEsquema é uma função para adicionar novos esquemas genéricos
func (e *SListaEsquema) AddEsquema(s ifc.IEsquema) []ifc.IEsquema {
	e.ListaEsquema = append(e.ListaEsquema, s)
	return e.ListaEsquema
}

// GetEsquemas carrega todos os esquemas
func (e *SListaEsquema) GetEsquemas() []ifc.IEsquema { return e.ListaEsquema }

// LogEsquemas : Rotina para imprimir os logs, verificando o status da lista de esquemas
func (e *SListaEsquema) LogEsquemas() {
	for k, v := range e.ListaEsquema {
		log.LogSis().Println("LogEsquemas(): lesquema.go", "Esquema", k, v)
	}
}
