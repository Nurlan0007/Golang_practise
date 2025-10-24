file, err := os.Open("data.txt")
if err != nil {
    log.Fatal(err)
}
defer file.Close() // файл закроется автоматически при выходе из функции
