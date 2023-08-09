package libinterface

// ITbConfigs : Interface para tabelas cliente
type ITbConfigs interface {
	TbCfgEsquema() INomeTabela
	TbHashVerificacao() INomeTabela
}
