package versao

import (
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
	log "github.com/DiogoMarcel/tablesVersions/logsGeral"
)

// ListaVersao : Lista para controle de versões
type ListaVersao []ifc.IVersao

// SListaVersao : Estrutura para controle de versões
type SListaVersao struct {
	ListaVersao `json:"versoes,omitempty"`
}

// CriarListaVersao : Cria a lista de versões
func (s *SListaVersao) CriarListaVersao() *SListaVersao {
	s.ListaVersao = make(ListaVersao, 0)
	return s
}

// AddVersao : Adicionar novos itens do tipo versão
func (s *SListaVersao) AddVersao(pVersao ifc.IVersao) *SListaVersao {
	s.ListaVersao = append(s.ListaVersao, pVersao)
	return s
}

// Versoes : Recuperar todas as versões adicionadas
func (s *SListaVersao) Versoes() []ifc.IVersao { return s.ListaVersao }

// Log : Impressão de log de versões. Conferir a lista.
func (s *SListaVersao) Log() {
	for i, v := range s.ListaVersao {
		log.LogSis().Println("LogTabelas(): ltabela.go", "Tabela", i, v)
	}
}
