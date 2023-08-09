package libtabela

import (
	sts "github.com/DiogoMarcel/baseTables/structs"
)

// Variáveis auxiliares para a construção de tabelas
// dessa maneira não há necessidade de inclusão em cada nova função
var (
	tbs sts.STabela
	cps sts.SCampo
	rlg sts.SConstraint
	tbn sts.SNomeTabela
)
