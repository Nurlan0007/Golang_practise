package middleware

import (
	"encoding/json"
	"log"
	"net/http"
)

// Структура ошибки
type ErrorResponse struct {
	Error string `json:"error"`
}

// Middleware проверки API-ключа
func APIKeyMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// Логируем метод и путь
		log.Printf("%s %s", r.Method, r.URL.Path)

		// Проверяем заголовок
		apiKey := r.Header.Get("X-API-Key")
		if apiKey != "secret123" {
			w.Header().Set("Content-Type", "application/json")
			w.WriteHeader(http.StatusUnauthorized)
			json.NewEncoder(w).Encode(ErrorResponse{Error: "unauthorized"})
			return
		}

		// Если ключ правильный — пропускаем дальше
		next.ServeHTTP(w, r)
	})
}
