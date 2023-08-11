package interfaces

// IListaCriarTabela : Interface com lista de criação de tabelas
type IListaCriarTabela interface {
	NewListaCriar()
	GetListaCriacao() []ICriarTabela
	AddCriarTabela(pCriar ICriarTabela) []ICriarTabela
}
