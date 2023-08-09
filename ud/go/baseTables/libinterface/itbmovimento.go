package libinterface

// ITbMovimento : Interface para tabelas movimento
type ITbMovimento interface {
	TbCabecalho() INomeTabela
	TbItem() INomeTabela
}
