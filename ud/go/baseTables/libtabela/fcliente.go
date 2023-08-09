package libtabela

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// SetListaCliente : Lista de tabelas cliente
func SetListaCliente(l ifc.IListaTabela) {
	l.AddTabela(newTbCliente())
}

func newTbCliente() ifc.ITabela {

	t := tbs.NovaTabela(tbn.TbCliente())

	t.AddCampo(cps.AddNro("CODIGO_CLI").SetTamanho(8))
	t.AddCampo(cps.AddChr("NOME01_CLI").SetTamanho(5))
	t.AddCampo(cps.AddInt("NUMERO_CLI").SetTamanho(cnt.CBIGINT))

	t.AddConstraint(rlg.NovaConstraint().SetNome("Depend").SetCpPk("CODIGO_CLI,NOME01_CLI").SetTbFk(tbn.TbCabecalho()).SetCpFk("CODIGO_PRO"))
	t.AddConstraint(rlg.NovaConstraint().SetCpPk("CODIGO_CLI").SetTbFk(tbn.TbProduto()).SetCpFk("NOME_PRO"))

	return t
}
