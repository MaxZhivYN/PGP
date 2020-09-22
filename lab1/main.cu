#include <iostream>
#include <algorithm>

using namespace std;

__global__ void add(int a, int b, int* c) {
    *c = a + b;
}

int main() {
    // int n;
    // cin >> n;
    
    // double* arr1 = new double[n];
    // double* arr2 = new double[n];
    // double* res = new double[n];

    // for (int i = 0; i < n; ++i) {
    //     cin >> arr1[i];
    // }

    // for (int i = 0; i < n; ++i) {
    //     cin >> arr2[i];
    // }

    // for (int i = 0; i < n; ++i) {
    //     res[i] = max(arr1[i], arr2[i]);
    //     cout << res[i] << " ";
    // }

    int c;
    int* dev_c;

    cudaMalloc((void**) &dev_c, sizeof(int));

    add<<<1, 1>>>(1, 2, dev_c);

    cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);

    cout << c;

    return 0;
}
