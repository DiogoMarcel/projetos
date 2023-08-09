package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// STbCliente : Tabelas de cliente
type STbCliente struct{}

// TbCliente : Cadastro de clientes
func (s *STbCliente) TbCliente() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("tbCliente", "CLI", cnt.ShCliente)
}
