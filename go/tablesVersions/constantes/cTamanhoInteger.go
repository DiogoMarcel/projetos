package constantes

import (
	"bytes"
	"strconv"
)

const (
	// CSMALLINT : Integer de tamanho 04
	CSMALLINT = iota
	// CINTEGER : Integer de tamanho 09
	CINTEGER
	// CBIGINT : Integer de tamanho 16
	CBIGINT
)

// CTamanhoInteger é o tamanho de um campo inteiro no banco de dados
type CTamanhoInteger int

// MarshalJSON : Carregar para o JSON
func (s *CTamanhoInteger) MarshalJSON() ([]byte, error) {
	buffer := bytes.NewBufferString(s.StrTamanhoInt())
	return buffer.Bytes(), nil
}

// GetTamanhoInt carrega o valor inteiro para a constante
func (s *CTamanhoInteger) GetTamanhoInt() int {
	return [...]int{4, 9, 16}[*s]
}

// StrTamanhoInt converte a constante inteira para string
func (s *CTamanhoInteger) StrTamanhoInt() string {
	return strconv.Itoa(s.GetTamanhoInt())
}
