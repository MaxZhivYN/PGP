#include <iostream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;


struct Pixel {
	int r;
	int g;
	int b;
	int a;
};

int main() {
	string inputString = "Q:\\VS 2019 Projects\\PGP2\\PGP2\\paris.data";
	string outputString;
	//cin >> inputString >> outputString;

	ifstream input(inputString, ios::in | ios::binary);
	ofstream output(outputString, ios::out | ios::binary);

	int w, h;
	if (input.is_open()) {
		input.read(reinterpret_cast<char*>(&w), sizeof(int));
		input.read(reinterpret_cast<char*>(&h), sizeof(int));
	}

	vector<vector<Pixel>> matrix(h, vector<Pixel>(w));
	for (int i = 0; i < h; ++i) {
		for (int j = 0; j < w; ++j) {
			input.read(reinterpret_cast<char*>(&(matrix[i][j].r)), sizeof(char));
			input.read(reinterpret_cast<char*>(&(matrix[i][j].g)), sizeof(char));
			input.read(reinterpret_cast<char*>(&(matrix[i][j].b)), sizeof(char));
			input.read(reinterpret_cast<char*>(&(matrix[i][j].a)), sizeof(char));
		}
	}
	
	return 0;
}