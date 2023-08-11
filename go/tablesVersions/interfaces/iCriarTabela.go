package interfaces

// ICriarTabela : Interface para inclusão/criação de tabelas
type ICriarTabela interface {
	ITabelaPadrao
	CriarTabela()
}
