#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N (1024 * 1024 * 1024)

const float A = 1.0f;
const float B = 20.0f;
const float C = 25.6f;
const float D = 24.0f;

int nums[N];

float loopDivision()
{
    float sum = 0;

    for (int i = 0; i < N; i ++) nums[i] = random();

    for (int i = 0; i < N; i ++)
    {
        const float x = nums[i] % 3 == 0 ?
            (nums[i] % 5 == 0 ? A : B) :
            (nums[i] % 4 == 0 ? C : D);
        const float rx = 1.0f / x;
        sum = x + rx;
    }

    sum = sqrt(sum);

    return sum;
}

int main()
{
    printf("%f\n", loopDivision());

    return 0;
}