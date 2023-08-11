package interfaces

// IVersao : Interface principal de versão que contém outras interfaces
type IVersao interface {
	IIdentificaVersao
	IListaCriarTabela
	IListaAlterarTabela
}
