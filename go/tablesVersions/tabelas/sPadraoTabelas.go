package tabelas

import (
	vrs "github.com/DiogoMarcel/tablesVersions/versao"
)

// sPadraoTabelas : Estrutura para carregar as tabelas com as variáveis
type sPadraoTabelas struct {
	FTabelaCriar   vrs.SCriarTabela
	FTabelaAlterar vrs.SAlterarTabela
	FCampos        vrs.SCampo
	FNomeTabela    vrs.STabelas
}
