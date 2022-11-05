package main

import (
	"fmt"
	"log"
	"net/http"
)

func homeHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	_, _ = fmt.Fprintf(w, "Code.education Rocks!")

}
func main() {
	http.HandleFunc("/", homeHandler)
	err := http.ListenAndServe(":38000", nil)
	if err != nil {
		log.Fatalln(err)
	}
}
