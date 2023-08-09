package libfuncoes

import (
	"encoding/json"
	"fmt"
)

// GetJSON : função para transformar uma struct em um JSON
func GetJSON(v interface{}) string {
	b, err := json.Marshal(v) //MarshalIndent(v, "", " ") //Marshal(v)
	if err != nil {
		fmt.Printf("Error: %s", err)
		return "e"
	}
	return string(b)
}
