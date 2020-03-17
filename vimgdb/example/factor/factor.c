/* ~/tmp/factor/factor.c */
int factor(int n, int *r)
{
    if (n <= 1)
        *r =  n;
    else
    {
        factor(n - 1, r);
        *r *= n;
    }

    return 0;
}
