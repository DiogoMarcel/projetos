package interfaces

type INomeTabelas interface {
	GetTabela() string
	SetTabela(pTabela string)

	TabelaVersao() string
}
