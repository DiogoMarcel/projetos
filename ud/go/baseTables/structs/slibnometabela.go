package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
)

// SLibNomeTabela : Estrutura para retornar os dados para cada tabela
type SLibNomeTabela struct {
	Nome     string           `json:"nome,omitempty"`
	Extensao string           `json:"-"`
	Esquema  cnt.CTipoEsquema `json:"-"`
}

// GetNomeTabela é uma função que retornará o nome de uma tabela
func (s *SLibNomeTabela) GetNomeTabela() string { return s.Nome }

// GetExtensao é uma função que retornará o nome de extensão utilizada nos campos da tabela
func (s *SLibNomeTabela) GetExtensao() string { return s.Extensao }

// GetTipoEsquema é uma função que retornará o tipo de esquema da tabela
func (s *SLibNomeTabela) GetTipoEsquema() cnt.CTipoEsquema { return s.Esquema }

// SetNomeTabela :
func (s *SLibNomeTabela) SetNomeTabela(n string) { s.Nome = n }

// SetExtensao :
func (s *SLibNomeTabela) SetExtensao(e string) { s.Extensao = e }

// SetTipoEsquema :
func (s *SLibNomeTabela) SetTipoEsquema(t cnt.CTipoEsquema) { s.Esquema = t }
