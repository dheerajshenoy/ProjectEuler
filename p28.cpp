#include <iostream>
#include <armadillo>
using namespace std;
using namespace arma;

class SpiralMatrix {

    public:
    void spiral_matrix(uint n)
    {
        bool left=false, right=true, up=false, down=false, odd=false;
        uint I, J, O;
        I = J = n/2;
        if(n%2 != 0)
            odd = true;
        Mat<uint> A;
        A.zeros(n, n);
        if(odd)
        {
            A(I, J) = 1;
            A(0, n-1) = n*n;
            while(true)
            {
                if(left)
                {
                    if(J == 0)
                        left = false;
                    else
                    {
                        O = A(I, J);
                        J--;
                        A(I, J) = O + 1;
                        if(I != 0 && A(I-1, J) == 0)
                        {
                            left = false;
                            up = true;
                        }
                    }
                }
                else if(right)
                {
                    if(J == n)
                    {
                        right = false;
                    }
                    else
                    {
                        O = A(I, J);
                        J++;
                        if(A(I, J) != 0)
                        {
                            //cout << A;
                            sum_of_diag(A);
                            break;
                        }
                        A(I, J) = O + 1;
                        if(I != n && A(I+1, J) == 0)
                        {
                            right = false;
                            down = true;
                        }
                    }
                }
                else if(up)
                {
                    if(I == 0)
                        up = false;
                    else
                    {
                        O = A(I, J);
                        I--;
                        A(I, J) = O + 1;
                        if(J != n && A(I, J+1) == 0)
                        {
                            right = true;
                            up = false;
                        }
                    }
                }
                else if(down)
                {
                    if(I == n)
                        down = false;
                    else
                    {
                        O = A(I, J);
                        I++;
                        A(I, J) = O + 1;
                        if(J != 0 && A(I, J-1) == 0)
                        {
                            down = false;
                            left = true;
                        }
                    }
                }
            }
        }
        else
        {

        }
    }
    protected:
    void print_matrix()
    {
    }

    void sum_of_diag(Mat<uint> M)
    {
        uint s1, s2;
        s1 = s2 = 0;
        for(int i=0, j=M.n_rows-1; i<M.n_rows, j>=0; i++, j--)
        {
            s1 = s1 + M.at(i, i);
            s2 = s2 + M.at(i, j);
        }
        cout << s1+s2 << endl;
    }
};

int main(int argc, char *argv[])
{
    if(argv[1])
    {
        SpiralMatrix s;
        s.spiral_matrix(stoi(argv[1]));
    }
    return 0;
}


