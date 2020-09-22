#include <iostream>
#include <algorithm>

using namespace std;

int main() {
    int n;
    cin >> n;
    
    double* arr1 = new double[n];
    double* arr2 = new double[n];
    double* res = new double[n];

    for (int i = 0; i < n; ++i) {
        cin >> arr1[i];
    }

    for (int i = 0; i < n; ++i) {
        cin >> arr2[i];
    }

    for (int i = 0; i < n; ++i) {
        res[i] = max(arr1[i], arr2[i]);
        cout << res[i] << " ";
    }

    return 0;
}
