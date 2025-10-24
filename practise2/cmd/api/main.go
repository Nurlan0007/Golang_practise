package main

import (
	"fmt"
	"log"
	"net/http"

	"practice2/internal/handlers"
	"practice2/internal/middleware"
)

func main() {
	mux := http.NewServeMux()

	// Оборачиваем /user в middleware
	mux.Handle("/user", middleware.APIKeyMiddleware(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodGet {
			handlers.GetUserHandler(w, r)
		} else if r.Method == http.MethodPost {
			handlers.CreateUserHandler(w, r)
		} else {
			w.WriteHeader(http.StatusMethodNotAllowed)
		}
	})))

	fmt.Println("Server running on :8080")
	log.Fatal(http.ListenAndServe(":8080", mux))
}
