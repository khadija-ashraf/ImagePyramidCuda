// This is the REAL "hello world" for CUDA!
// It takes the string "Hello ", prints it, then passes it to CUDA with an array
// of offsets. Then the offsets are added in parallel to produce the string "World!"
// By Ingemar Ragnemalm 2010

#include <stdio.h>
#include <opencv2/opencv.hpp>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"


using namespace cv;
using namespace std;

const int N = 16;
const int blocksize = 16;

__global__
void hello(char *a, int *b)
{
	a[threadIdx.x] += b[threadIdx.x];
}

int main()
{
	Mat image = imread("C:/Users/kashraf1/Desktop/hqdefault.jpg");
	//cuda::GpuMat inputDevice(image);
	if (image.empty()) // Check for failure
	{
		cout << "Could not open or find the image" << endl;
		system("pause"); //wait for any key press
		return -1;
	}

	String windowName = "My HelloWorld Window"; //Name of the window

	namedWindow(windowName); // Create a window

	imshow(windowName, image); // Show our image inside the created window.

	waitKey(0); // Wait for any keystroke in the window

	destroyWindow(windowName); //destroy the created window

	/*
	char a[N] = "Hello \0\0\0\0\0\0";
	int b[N] = { 15, 10, 6, 0, -11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

	char *ad;
	int *bd;
	const int csize = N * sizeof(char);
	const int isize = N * sizeof(int);

	printf("%s", a);

	cudaMalloc((void**)&ad, csize);
	cudaMalloc((void**)&bd, isize);
	cudaMemcpy(ad, a, csize, cudaMemcpyHostToDevice);
	cudaMemcpy(bd, b, isize, cudaMemcpyHostToDevice);

	dim3 dimBlock(blocksize, 1);
	dim3 dimGrid(1, 1);
	hello << <dimGrid, dimBlock >> >(ad, bd);
	cudaMemcpy(a, ad, csize, cudaMemcpyDeviceToHost);
	cudaFree(ad);
	cudaFree(bd);

	printf("%s\n", a);
	return EXIT_SUCCESS;
	*/
}
