/* ~/tmp/sample.c */
#include <stdio.h>
extern int factor(int n, int *rt);

int main(int argc, char **argv)
{
    int i;
    int result = 1;

    for (i = 1; i < 6; i++)
    {
        factor(i, &result);
        printf("%d! = %d\n", i, result);
    }

    return 0;
}
