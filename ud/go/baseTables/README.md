# ![alt text][logo] baseTables

[logo]: ./imgs/db.png

  Projeto de gerenciamento de tabelas e funções em um banco de dados.

# <h3>01. [Constantes](./constantes)

  <h5> Utilizar constantes para padronizar nomes estruturais </h5>

    * Os nomes de arquivos devem iniciar em c seguido de descrição que o identifique.

  [- Configuração de base de dados](./constantes/cconfigdb.go "cconfigdb.go")

  [- Tamanho de campo integer](./constantes/ctamanhoint.go "ctamanhoint.go")
  
  [- Tipo de esquemas](./constantes/ctipoesquema.go "ctipoesquema.go")

  Teste de link [main]

  [main]: ./testes_main/testemain.go

# <h3>02. [Interfaces do sistema](./ifaces)

  <h5> </h5>

# <h3>03. [Biblioteca de funções](./lib)

  <h5> </h5>
  
# <h3>04. [Configuração do banco de dados](./dbconfig)

  <h5> Utilizado configurações de bancos de dados para possibilitar a conexão com banco de dados diferentes </h5>

    * Os nomes de arquivos devem ser explicitos e sugestivos para identificar facilmente.
  
  [- Conexão com MySQL](./dbconfig/conecmysql.go)

  [- Conexão com Postgres](./dbconfig/conecpg.go)

  [- Fábrica para retornar o tipo de DB](./dbconfig/factorydb.go)

  [- Interface para criação na fábrica](./dbconfig/iconfig.go)

  [- Carregar configuração através de arquivo](./dbconfig/sconfigdb.go)

# <h3>05. [Criação de tabelas em banco](./gerardb)

  <h5> </h5>
  
# <h3>06. [Listas para tabelas/esquemas](./listas)

  <h5> </h5>
  
# <h3>07. [Estruturas de tabelas/esquemas](./structs)

  <h5> </h5>
  
# <h3>08. [Fábrica de tabelas](./tabelas)

  <h5> </h5>
  
# <h3>09. [Logs](./logsis)
  
  <h5> </h5>
  
# <h3>10. [Main](main.go)

  <h5> </h5>
  
# <h1> AJUSTAR AINDA

  - Default logs tables

  - Primaty Key

  - Ainda: Bloquear adição de campos iguais (data, operador, filial).

  - Execute BD

  - AcertoGerais() *

  - DropViews()

  - Apenas atualiza empresa que o sistema está liberado (car. empresa com filtro)

  - ExecutaAcertos() *

  - Reorganizar()