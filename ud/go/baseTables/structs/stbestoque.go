package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// STbEstoque : Tabelas do estoque
type STbEstoque struct{}

// TbProduto : Cadastro de produtos no sistema
func (s *STbEstoque) TbProduto() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("tbProduto", "PRO", cnt.ShMovimento)
}

// TbMarca : Cadastro de marca de produto no sistema
func (s *STbEstoque) TbMarca() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("tbMarca", "MAR", cnt.ShEstoque)
}

// TbUnidade : Cadastro de marca de produto no sistema
func (s *STbEstoque) TbUnidade() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("tbUnidade", "UND", cnt.ShEstoque)
}
