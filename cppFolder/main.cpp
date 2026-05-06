#include <iostream>
#include <vector>
#include <stdexcept>
using namespace std;

vector<int> addVectors(const vector<int>& a, const vector<int>& b) {
	if (a.size() != b.size()) {
		throw invalid_argument("Векторы должны быть одинакого размера!");
	}
	vector<int> result;
	result.reserve(a.size());
	for (size_t i = 0; i < a.size(); i++){
		result.push_back(a[i] + b[i]);}
	return result;}

int main() {
	vector<int> v1 = {1, 2, 3, 4, 5};
	vector<int> v2 = {10, 20, 30, 40, 50};
	vector<int> sum = addVectors(v1, v2);
	cout << "Результат сложения: ";
	for (int x : sum) {
		cout << x << " ";
	}
	return 0;
}


