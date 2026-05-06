package main

import (
	"errors"
	"fmt"
)

func addVectors(a, b []int) ([]int, error) {
	if len(a) != len(b) {
		return nil, errors.New("слайсы должны быть одинакого размера!")
	}
	result := make([]int, len(a))
	for i := 0; i < len(a); i++ {
		result[i] = a[i] + b[i]
	}
	return result, nil
}

func main() {
	v1 := []int{1, 2, 3, 4, 5}
	v2 := []int{10, 20, 30, 40, 50}
	sum, err := addVectors(v1, v2)
	if err != nil {
		fmt.Println("Ошибка:", err)
		return
	}
	fmt.Print("Результат сложения: ")
	for _, x:= range sum {
		fmt.Print(x, " ")
	}
	fmt.Println()
}
