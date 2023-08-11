package gerenciaversao

import (
	"encoding/json"
	"fmt"

	vrs "github.com/DiogoMarcel/tablesVersions/versao"
)

// SGerenciaVersao : Estrutura principal para carregar e gerenciar as versões
type SGerenciaVersao struct {
	vrs.SListaVersao
}

// Executar : Primeira execução e o principal método do sistema
func (s *SGerenciaVersao) Executar() {
	s.CriarListaVersao()
	s.AddListaVersoes()
	s.PercorrerListaVersoes()
}

// PercorrerListaVersoes : Percorrer a lista das versões para execução
func (s *SGerenciaVersao) PercorrerListaVersoes() *SGerenciaVersao {
	geral, _ := json.MarshalIndent(s.Versoes(), "", "\t")
	fmt.Println(string(geral))

	for i, a := range s.Versoes() {
		prettyJSON, _ := json.Marshal(a)
		fmt.Println(i, string(prettyJSON), a, &a)

		for _, b := range a.GetListaAlteracao() {
			jsonListaAlt, _ := json.Marshal(b)
			fmt.Println("Alt:", string(jsonListaAlt), b, &b)
		}

		for _, c := range a.GetListaCriacao() {
			jsonListaCri, _ := json.Marshal(c)
			fmt.Println("Cri:", string(jsonListaCri), c, &c)
		}
	}

	return s
}

// AddListaVersoes : Adiconar as versões na lista
func (s *SGerenciaVersao) AddListaVersoes() *SGerenciaVersao {

	s.AddVersao(new(VersaoInicial).CarregarVersao())
	s.AddVersao(new(Versao2103).CarregarVersao())

	return s
}
