package libinterface

// IListaConstraint :
type IListaConstraint interface {
	AddConstraint(r IConstraint)
	GerarConstraints() []IConstraint
}
