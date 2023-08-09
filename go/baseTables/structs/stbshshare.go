package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// STbSh000 : Tabelas do esquema Sh000
type STbSh000 struct{}

// TbPassword : Tabela usuários
func (s *STbSh000) TbPassword() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("Password", "SNH", cnt.ShShare)
}
