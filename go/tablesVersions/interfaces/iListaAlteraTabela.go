package interfaces

// IListaAlterarTabela : Interface com lista de alteração de tabelas
type IListaAlterarTabela interface {
	NewListaAlterar()
	GetListaAlteracao() []IAlterarTabela
	AddAlteraTabela(pAltera IAlterarTabela) []IAlterarTabela
}
