#include <iostream>
#include <iomanip>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <fstream>
#include <algorithm>

using namespace std;

__global__ void minVector(double* arr1_gpu, double* arr2_gpu, int n) {
    for (int i = 0; i < n; ++i) {
        arr1_gpu[i] = min(arr1_gpu[i], arr2_gpu[i]);
    }
}

int main() {
    int n;
    cin >> n;
    
    double* arr1 = new double[n];
    double* arr2 = new double[n];


    for (int i = 0; i < n; ++i) {
        cin >> arr1[i];
    }

    for (int i = 0; i < n; ++i) {
        cin >> arr2[i];
    }

    double* arr1_gpu;
    double* arr2_gpu;

    cudaMalloc((void**) &arr1_gpu, sizeof(double) * n);
    cudaMalloc((void**) &arr2_gpu, sizeof(double) * n);

    cudaMemcpy(arr1_gpu, arr1, sizeof(double) * n, cudaMemcpyHostToDevice);
    cudaMemcpy(arr2_gpu, arr2, sizeof(double) * n, cudaMemcpyHostToDevice);

    minVector<<<256, 512>>>(arr1_gpu, arr2_gpu, n);

    cudaMemcpy(arr1, arr1_gpu, sizeof(double) * n, cudaMemcpyDeviceToHost);

    for (int i = 0; i < n; ++i) {
        cout << std::scientific << std::setprecision(10) << arr1[i] << " ";
    }

    cout << endl;


    cudaFree(arr1_gpu);
    cudaFree(arr2_gpu);

    delete[] arr1;
    delete[] arr2;

    return 0;
}
