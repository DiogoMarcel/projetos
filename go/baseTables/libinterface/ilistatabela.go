package libinterface

// IListaTabela :
type IListaTabela interface {
	AddTabela(t ITabela) []ITabela
	GetTabelas() []ITabela
	LogTabelas()
}
