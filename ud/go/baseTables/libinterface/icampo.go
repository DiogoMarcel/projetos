package libinterface

// ICampo : É uma interface para novos campos do tipo ICampo
type ICampo interface {
	SQL() string
	GetNomeCampo() string
}
