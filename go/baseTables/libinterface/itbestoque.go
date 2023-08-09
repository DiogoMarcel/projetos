package libinterface

// ITbEstoque : Interface para tabelas estoque
type ITbEstoque interface {
	TbProduto() INomeTabela
	TbMarca() INomeTabela
	TbUnidade() INomeTabela
}
