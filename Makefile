CXX = g++
GO = go

TARGET_CPP = maincpp
TARGET_GO = maingo
.PHONY: all run_cpp run_go clean
all: $(TARGET_CPP) $(TARGET_GO)
#C++
$(TARGET_CPP): main.o
	$(CXX) main.o -o $(TARGET_CPP)
main.o: main.s
	as main.s -o main.o
main.s: main.i
	$(CXX) -S main.i -o main.s
main.i: cppFolder/main.cpp
	$(CXX) -E cppFolder/main.cpp -o main.i
#Go
gomain.s: goFolder/main.go
	$(GO) build -gcflags="-S" goFolder/gomain.go > gomain.s 2>&1
gomain.o: goFolder/gomain.go
	go tool compile -o gomain.o goFolder/gomain.go
$(TARGET_GO): goFolder/gomain.go
	$(GO) build -o $(TARGET_GO) goFolder/gomain.go
#Запуск
run_cpp:
	./$(TARGET_CPP)
run_go:
	./$(TARGET_GO)
#Очистка
clean:
	rm -f *.i *.s *.o $(TARGET_CPP) $(TARGET_GO)
