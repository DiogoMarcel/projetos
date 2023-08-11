package constantes

import (
	"bytes"
	"encoding/json"
)

const (
	//VINICIAL : Versão Inicial
	VINICIAL = iota
	// V2102 : Versão
	V2102
	// V2103 : Versão
	V2103
)

// CVersoes : Configurações de conexão com o banco de dados
type CVersoes int

// ToStringVersoes : Cast para string
var ToStringVersoes = map[CVersoes]string{
	VINICIAL: "VINICIAL",
	V2102:    "V2102",
	V2103:    "V2103",
}

// ToIntVersoes : Cast para inteiro
var ToIntVersoes = map[string]CVersoes{
	"VINICIAL": VINICIAL,
	"V2102":    V2102,
	"V2103":    V2103,
}

// MarshalJSON : Construir o JSON Versões
func (s *CVersoes) MarshalJSON() ([]byte, error) {
	buffer := bytes.NewBufferString(`"`)
	buffer.WriteString(ToStringVersoes[*s])
	buffer.WriteString(`"`)
	return buffer.Bytes(), nil
}

// UnmarshalJSON : Desmontar o JSON Versões
func (s *CVersoes) UnmarshalJSON(pByte []byte) error {
	var j string
	if err := json.Unmarshal(pByte, &j); err != nil {
		return err
	}
	*s = ToIntVersoes[j]
	return nil
}
