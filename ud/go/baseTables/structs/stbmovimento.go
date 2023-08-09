package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// STbMovimento : Tabelas de movimento
type STbMovimento struct{}

// TbItem : Tabela de itens
func (s *STbMovimento) TbItem() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("Itens", "ITE", cnt.ShMovimento)
}

// TbCabecalho : Tabela Cabeçalho
func (s *STbMovimento) TbCabecalho() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("Cabecalho", "CAB", cnt.ShMovimento)
}
