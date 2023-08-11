# <h3>01. Padronização dos fontes

<h5> Padrão de constantes </h5>

    * Os nomes de arquivos devem iniciar em c seguido de descrição que o identifique.

    * Todas as constantes devem ser declaradas com letras maiúsculas e identificação clara.

  [- Constantes estão armazenadas aqui](./constantes)

<h5> Padrão de variáveis </h5>

  - Os nomes de variáveis devem iniciar da seguinte maneira:

    Variáveis internas devem iniciar em v (minúsculo), seguido de descrição que o identifique.
  
    Parâmetros em funções devem iniciar em p (minúsculo), seguido de descrição que o identifique.

    As variáveis representando o "Self" de uma struct deve ser declarada apenas como 's'.

    Variáveis de classe devem iniciar em F (maiúsculo), seguido de descrição que o identifique.

    <b>Exceções:</b>

      - [Fonte de conexão com o banco de dados. A variável deve permanecer inacessível no sistema, apenas no arquivo.](./conexaoBanco/conexaoBanco.go)

      - Nomes de estruturas/listas de utilizações externas. Funcionalidades da linguagem.

<h5> Padrão de nomes para os arquivos </h5>

  - Os arquivos devem ser divididos da seguinte maneira:

  * Interfaces: 
    - Iniciar o nome do arquivo com i (minúsculo), seguido do nome de identificação.
  * Constantes:
    - Iniciar o nome do arquivo com c (minúsculo), seguido do nome de identificação.
  * Structs: 
    - Iniciar o nome do arquivo com s (minúsculo), seguido do nome de identificação.
  * Factorys:
    - Iniciar com o nome factory, seguido do nome de identificação.

  * <b>Exceções:</b>

    [- Pasta de gerenciamento de versão. Os arquivos podem iniciar com o v (minúsculo), seguido da versão das tabelas](./gerenciaVersao)
  
    [- Pasta com manutenção de logs do sistema.](./logsGeral)

<h5> Padrão de nomes de métodos/funções </h5>

  - Os nomes dos métodos e funções devem ser claros e seguir padronização entre pacotes.

  * Devido a linguagem, iniciando com maiúsculo é público e minúsculo é privado para o pacote.