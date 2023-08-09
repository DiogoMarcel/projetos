package libdb

/// Carregar todos os esquemas do banco de dados
/// 	//SELECT schema_name FROM information_schema.schemata

// SQLExistsTable : Verificar existência de tabela em banco de dados
func SQLExistsTable() string {
	/*
		$1 = esquema
		$2 = tabela
	*/
	SQL := "SELECT EXISTS ("
	SQL += "SELECT "
	SQL += " FROM pg_catalog.pg_class c"
	SQL += " JOIN   pg_catalog.pg_namespace n ON n.oid = c.relnamespace"
	SQL += " WHERE  n.nspname = $1"
	SQL += " AND    c.relname = $2"
	SQL += " AND    c.relkind = 'r'"
	SQL += ")"

	return SQL
}

// SQLCreateTable : Criação de tabelas em banco de dados
func SQLCreateTable() string {
	/*
		$1 = esquema
		$2 = tabela
		$3 = campos
	*/
	return "CREATE TABLE $1::text$2::text ($3)"
}

// SQLExistsCreateSchem :
func SQLExistsCreateSchem() string {
	/*
		%s = esquema
	*/
	SQL := "DO $$"
	SQL += " BEGIN"
	SQL += " IF NOT EXISTS("
	SQL += " SELECT schema_name"
	SQL += " FROM information_schema.schemata"
	SQL += " WHERE schema_name = '%s'"
	SQL += ") THEN"
	SQL += " EXECUTE 'CREATE SCHEMA %s';"
	SQL += " END IF;"
	SQL += " END $$;"

	return SQL
}
