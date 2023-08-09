package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
)

// SNovaTabela : Estrutura para geração de novas tabelas
type SNovaTabela struct{ SNomeTabela }

// NovaTabela : Função que retorna a nova tabela com os dados inclusos
func (t *SNovaTabela) NovaTabela(n string, e string, s cnt.CTipoEsquema) *SNovaTabela {
	nt := new(SNomeTabela)
	nt.Nome = n
	nt.Extensao = e
	nt.Esquema = s

	return &SNovaTabela{SNomeTabela: *nt}
}
