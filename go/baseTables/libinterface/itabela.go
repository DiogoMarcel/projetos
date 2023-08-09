package libinterface

// ITabela : É uma interface para novas tabelas do tipo ITabela
type ITabela interface {
	ILibNomeTabela
	IListaCampos
	IListaConstraint
	IValidaTbl
}
