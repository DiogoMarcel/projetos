package conexaobanco

import (
	"fmt"

	log "github.com/DiogoMarcel/tablesVersions/logsGeral"
)

// GetFactoryDB : Carregar um banco de dados confome necessário
func GetFactoryDB(pBanco string) ICfgConexao {
	var vresult ICfgConexao

	switch {
	case pBanco == "PG":
		vresult = new(ICfgConexaoPostgres)
	case pBanco == "MySQL":
		vresult = new(ICfgConexaoMySQL)
	default:
		log.LogSis().Panicln(fmt.Errorf("(%s) Banco de dados informado não existe! Name: %s", "GetFactoryDB(): factoryConexao.go", pBanco))
		return nil
	}

	return vresult
}
