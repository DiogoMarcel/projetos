package structs

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// STbConfigs : Tabelas de cliente
type STbConfigs struct{}

// TbCfgEsquema : Configurações dos esquemas
func (s *STbConfigs) TbCfgEsquema() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("esquemasdb", "SCH", cnt.Sh000)
}

// TbHashVerificacao : Hash de tabela inclusa
func (s *STbConfigs) TbHashVerificacao() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("hashtabela", "HSH", cnt.Sh000)
}

// TbOutraCfg : teste
func (s *STbConfigs) TbOutraCfg() ifc.INomeTabela {
	return new(SNovaTabela).NovaTabela("tbloutra", "OUT", cnt.Sh000)
}
