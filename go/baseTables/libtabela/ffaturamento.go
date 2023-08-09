package libtabela

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// SetListaFaturamento : Lista de tabelas do faturamento
func SetListaFaturamento(l ifc.IListaTabela) {
	l.AddTabela(newTbFaturamento())
}

func newTbFaturamento() ifc.ITabela {
	t := tbs.NovaTabela(tbn.TbItem())

	t.AddCampo(cps.AddInt("PRODUT_ITE").SetTamanho(cnt.CBIGINT))
	t.AddCampo(cps.AddInt("CABECA_ITE").SetTamanho(cnt.CBIGINT))

	t.AddConstraint(rlg.NovaConstraint().SetCpPk("PRODUT_ITE").SetTbFk(tbn.TbProduto()).SetCpFk("CODIGO_PRO"))
	t.AddConstraint(rlg.NovaConstraint().SetCpPk("CABECA_ITE").SetTbFk(tbn.TbCliente()).SetCpFk("CABECALHO"))

	return t
}
