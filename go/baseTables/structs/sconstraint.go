package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// SConstraint : Strutura genérica para relação entre tabelas
type SConstraint struct {
	Nome       string          `json:"nome,omitempty"`
	CpPk       string          `json:"cpPk,omitempty"`
	TbFk       ifc.INomeTabela `json:"tbFk,omitempty"`
	CpFk       string          `json:"cpFk,omitempty"`
	DelCascade bool            `json:"cascade,omitempty"`
}

// NovaConstraint : Criação da struct de constraint
func (r *SConstraint) NovaConstraint() *SConstraint {
	return new(SConstraint)
}

// GetConstraint : implementar
func (r *SConstraint) GetConstraint() string {
	return r.Nome + " / " + r.CpPk + " / " + r.TbFk.GetNomeTabela() + " / " + r.CpFk
}

// TipoEsquema : Recuperar o tipo de esquema
func (r *SConstraint) TipoEsquema() cnt.CTipoEsquema {
	return r.TbFk.GetTipoEsquema()
}

// OnDeleteCascade : Ativar delete cascade para a constraint
func (r *SConstraint) OnDeleteCascade() *SConstraint {
	r.DelCascade = true
	return r
}

// SetNome para adicionar nome na constraint
func (r *SConstraint) SetNome(n string) *SConstraint { r.Nome = n; return r }

// SetCpPk para adicionar campos Primary Key na relação
func (r *SConstraint) SetCpPk(p string) *SConstraint { r.CpPk = p; return r }

// SetTbFk para adicionar a tabela da relação
func (r *SConstraint) SetTbFk(t ifc.INomeTabela) *SConstraint { r.TbFk = t; return r }

// SetCpFk para adicionar campos Foreing Key na relação
func (r *SConstraint) SetCpFk(f string) *SConstraint { r.CpFk = f; return r }
