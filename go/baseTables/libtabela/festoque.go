package libtabela

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// SetListaEstoque : Lista de tabelas de estoque
func SetListaEstoque(l ifc.IListaTabela) {
	l.AddTabela(newTbProduto())
	l.AddTabela(newTbMarca())
	l.AddTabela(newUnidade())
}

func newTbProduto() ifc.ITabela {

	t := tbs.NovaTabela(tbn.TbProduto())
	//t.Schema = "diogo"

	// Exemplo para validar uma tabela
	/*v := func() bool {
		if t.Schema == "marcel" {
			fmt.Println("schema is marcel")
		} else {
			fmt.Println(" Chegou aqui " + t.Schema)
			return true
		}
		return false
	}

	t.SetValidacao(v)*/

	t.AddCampo(cps.AddNro("n_cp_00_Prod").SetTamanho(8).SetDecimal(3).SetDefault(5.6))
	t.AddCampo(cps.AddChr("n_cp_01_Prod").SetTamanho(5).SetDefault("def_DIOGO"))
	t.AddCampo(cps.AddLgc("cp_boolean").SetDefault(true))
	t.AddCampo(cps.AddInt("n_Inteiro").SetTamanho(cnt.CBIGINT))

	return t
}

func newTbMarca() ifc.ITabela {

	t := tbs.NovaTabela(tbn.TbMarca())
	t.AddCampo(cps.AddNro("codigo_marca").SetTamanho(9))
	t.AddCampo(cps.AddChr("descrição_marca").SetTamanho(5))

	t.AddConstraint(rlg.NovaConstraint().SetCpPk("CODIGO_CLI").SetTbFk(tbn.TbProduto()).SetCpFk("NOME_PRO"))

	return t
}

func newUnidade() ifc.ITabela {

	t := tbs.NovaTabela(tbn.TbUnidade())
	t.AddCampo(cps.AddInt("CODIGO_UND").SetTamanho(cnt.CINTEGER))
	t.AddCampo(cps.AddChr("DESCRI_UND").SetTamanho(50))
	t.SetValidacao(func() bool { return false })

	return t
}
