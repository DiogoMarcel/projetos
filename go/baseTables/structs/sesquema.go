package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
)

// SEsquema : Todo esquema terá um tipo e o valor
// Ex.: Tipo Movto = ep01
type SEsquema struct {
	Tipo      cnt.CTipoEsquema `json:"-"`
	Descricao string           `json:"nome,omitempty"`
}

// SEmpEsquema :
type SEmpEsquema struct {
	Empresa int `json:"emp,omitempty"`
	SEsquema
}

// NovoEmpEsquema : Nova estrutura com esquema
func (s *SEmpEsquema) NovoEmpEsquema(t cnt.CTipoEsquema, d string, e int) *SEmpEsquema {
	n := new(SEmpEsquema)
	n.Tipo = t
	n.Descricao = d
	n.Empresa = e
	return n
}

// GetTipo :
func (s *SEmpEsquema) GetTipo() cnt.CTipoEsquema { return s.Tipo }

// GetNomeEsquema :
func (s *SEmpEsquema) GetNomeEsquema() string { return s.Descricao }

// GetNomeEsquemaLog :
func (s *SEmpEsquema) GetNomeEsquemaLog() string { return "lg" + s.Descricao[len(s.Descricao)-3:] }

// GetEmpresa :
func (s *SEmpEsquema) GetEmpresa() int { return s.Empresa }

// SetTipo :
func (s *SEmpEsquema) SetTipo(t cnt.CTipoEsquema) { s.Tipo = t }

// SetNomeEsquema :
func (s *SEmpEsquema) SetNomeEsquema(d string) { s.Descricao = d }

// SetEmpresa :
func (s *SEmpEsquema) SetEmpresa(e int) { s.Empresa = e }
