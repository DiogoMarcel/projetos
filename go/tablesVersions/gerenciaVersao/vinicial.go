package gerenciaversao

import (
	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
	tbs "github.com/DiogoMarcel/tablesVersions/tabelas"
	vrs "github.com/DiogoMarcel/tablesVersions/versao"
)

// VersaoInicial : Versão com responsabilidades de criação inicial do banco de dados
type VersaoInicial struct {
	vrs.SVersao
}

// Identificacao : Identificar a versão corrente
func (s *VersaoInicial) Identificacao() {
	s.SetIdentificacao(cnt.VINICIAL)
}

// CarregarVersao : Carregar os dados da versão corrente
func (s *VersaoInicial) CarregarVersao() ifc.IVersao {
	s.Identificacao()

	s.AddCriarTabela(new(tbs.STabelasIniciais).GetTabelaVersao())

	/* Aqui eu devo iniciar a inclusão de tabelas de configuração e utilidades diversas para o sistema
	- São tabelas de controle (exemplo: tabela de última versão de atualização do sistema)
	- Configurações iniciais para o sistema - em tabelas (podem haver tabelas de backup ou dados de conexão/usuário)
	- Por ser uma versão inicial, sempre devem ser verificadas as tabelas e registros aqui inclusos
	*/

	return s
}
