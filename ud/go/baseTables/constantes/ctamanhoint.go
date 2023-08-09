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

// CTamanhoInt é o tamanho de um campo inteiro
type CTamanhoInt int

// MarshalJSON : Carregar para o JSON
func (d CTamanhoInt) MarshalJSON() ([]byte, error) {
	buffer := bytes.NewBufferString(d.StrTamanhoInt())
	return buffer.Bytes(), nil
}

// GetTamanhoInt carrega o valor inteiro para a constante
func (d CTamanhoInt) GetTamanhoInt() int {
	return [...]int{4, 9, 16}[d]
}

// StrTamanhoInt converte a constante inteira para string
func (d CTamanhoInt) StrTamanhoInt() string {
	return strconv.Itoa(d.GetTamanhoInt())
}
