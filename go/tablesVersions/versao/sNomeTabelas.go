package versao

// SNomeTabela : Estrutura para nomeação de tabelas
type SNomeTabelas struct {
	FTabela string `json:"FNomeTabela,omitempty"`
}

// SetNomeTabela : Adicionar o nome de uma tabela
func (s *SNomeTabelas) SetTabela(pTabela string) { s.FTabela = pTabela }

// GetNomeTabela : Carregar o nome de uma tabela
func (s *SNomeTabelas) GetTabela() string { return s.FTabela }

func (s *SNomeTabelas) TabelaVersao() string   { return "TabelaVersao" }
func (s *SNomeTabelas) TabelaPortador() string { return "Portador" }
