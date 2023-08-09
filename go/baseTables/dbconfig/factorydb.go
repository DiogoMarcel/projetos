package dbconfig

import (
	"fmt"

	log "github.com/DiogoMarcel/baseTables/logsis"
)

// CarregarDB : Carregar um banco de dados confome necessário
func CarregarDB(banco string) IConfigDB {
	var result IConfigDB

	switch {
	case banco == "PG":
		result = new(DBPostgres)
	case banco == "MySQL":
		result = new(DBMySQL)
	default:
		log.LogSis().Panicln(fmt.Errorf("(%s) Banco de dados informado não existe! Name: %s", "CarregarDB(): factorydb.go", banco))
		return nil
	}

	if b, err := result.Open(); !b || err != nil {
		log.LogSis().Panicf("(%s) Banco de dados não pode ser conectado! Falha: %s", "CarregarDB(): factorydb.go", err)
	}

	return result
}
