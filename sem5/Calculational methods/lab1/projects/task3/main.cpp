/*#include <fstream>
#include <iomanip>
#include "functions.h"
using namespace std;

void main ()
{
    ofstream out ("out.txt");
    const int n = 5, m = 10;
    double	*xn = new double [n+1],
            *xm = new double [m+1],
            *fxn = new double [n+1],
            *fxm = new double [m+1],
            h,
            xf = 1,
            xl = 3,
            a1,
            a2,
            a3,
            pa1,
            pa2,
            pa3,
            **rrn = new double* [n+2],
            **rrm = new double* [m+2];
    for (int i = 0; i <= n+1; ++i)
        rrn[i] = new double [n+2];
    for (int i = 0; i <= m+1; ++i)
        rrm[i] = new double [m+2];

    createNodes (n, xn, fxn, xf, xl, h);
    createMatrix (n, rrn, xn, fxn);
    out << "RR matrix:\n\n";
    printRRmatrix (rrn, n, out, 10);
    out << "\n" << n+1 << " nodes:\n\n";
    for (int i = 0; i <= n; ++i)
        out << setw (10) << xn[i];
    out << "\n";
    for (int i = 0; i <= n; ++i)
        out << setw (10) << fxn[i];
    a1 = xf + h / 3;
    a2 = xn[n/2] + h / 3;
    a3 = xl - h / 3;
    pa1 = P(a1, n, xn, rrn);
    pa2 = P(a2, n, xn, rrn);
    pa3 = P(a3, n, xn, rrn);
    out << "\n\nP(x0+h/3) = P(" << a1 << ") = " << pa1 << ".\n";
    out << "Real residual : " << findRealResidual (a1, pa1) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (a1, n, xn, xf, xl) << ".\n\n";
    out << "P(x[n/2]+h/3) = P(" << a2 << ") = " << pa2 << ".\n";
    out << "Real residual : " << findRealResidual (a2, pa2) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (a2, n, xn, xf, xl) << ".\n\n";
    out << "P(xn-h/3) = P(" << a3 << ") = " << pa3 << ".\n";
    out << "Real residual : " << findRealResidual (a3, pa3) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (a3, n, xn, xf, xl) << ".\n\n";

    createNodes (m, xm, fxm, xf, xl, h);
    createMatrix (m, rrm, xm, fxm);
    out << "RR matrix:\n\n";
    printRRmatrix (rrm, m, out, 15);
    out << "\n" << m+1 << " nodes:\n\n";
    for (int i = 0; i <= m; ++i)
        out << setw (10) << xm[i];
    out << "\n";
    for (int i = 0; i <= m; ++i)
        out << setw (10) << fxm[i];
    a1 = xf + h / 3;
    a2 = xm[n/2] + h / 3;
    a3 = xl - h / 3;
    pa1 = P(a1, m, xm, rrm);
    pa2 = P(a2, m, xm, rrm);
    pa3 = P(a3, m, xm, rrm);
    out << "\n\nP(x0+h/3) = P(" << a1 << ") = " << pa1 << ".\n";
    out << "Real residual : " << findRealResidual (a1, pa1) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (a1, m, xm, xf, xl) << ".\n\n";
    out << "P(x[n/2]+h/3) = P(" << a2 << ") = " << pa2 << ".\n";
    out << "Real residual : " << findRealResidual (a2, pa2) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (a2, m, xm, xf, xl) << ".\n\n";
    out << "P(xn-h/3) = P(" << a3 << ") = " << pa3 << ".\n";
    out << "Real residual : " << findRealResidual (a3, pa3) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (a3, m, xm, xf, xl) << ".\n\n";

    delete [] xn;
    delete [] xm;
    delete [] fxn;
    delete [] fxm;
    for (int i = 0; i <= n+1; ++i)
        delete [] rrn[i];
    for (int i = 0; i <= m+1; ++i)
        delete [] rrm[i];
    delete [] rrn;
    delete [] rrm;
}*/

#include <iostream>
#include <fstream>
#include <iomanip>
#include "functions.h"
using namespace std;

int main ()
{
    ofstream out ("out.txt");
    const int n = 5, m = 10;
    double	*xn = new double [n+1],
            *xm = new double [m+1],
            *fxn = new double [n+1],
            *fxm = new double [m+1],
            xf = 0.3,
            xl = 1.3,
            a1,
            a2,
            a3,
            pa1,
            pa2,
            pa3;

    createNodes (n, xn, fxn, xf, xl);
    out << n+1 << " nodes:\n\n";
    for (int i = 0; i <= n; ++i)
        out << setw (10) << xn[i];
    out << "\n";
    for (int i = 0; i <= n; ++i)
        out << setw (10) << fxn[i];
    a1 = xf + 2.0 / 3 / m;
    a2 = xn[m/2] + (xl - xf) / 2 / m;
    a3 = xl - 1.0 / 3 / n;
    pa1 = P(a1, n, xn, fxn);
    pa2 = P(a2, n, xn, fxn);
    pa3 = P(a3, n, xn, fxn);
    out << "\n\nP(" << a1 << ") = " << pa1 << ".\n";
    out << "Real residual : " << findRealResidual (a1, pa1) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (n, xf, xl) << ".\n\n";
    out << "P(" << a2 << ") = " << pa2 << ".\n";
    out << "Real residual : " << findRealResidual (a2, pa2) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (n, xf, xl) << ".\n\n";
    out << "P(" << a3 << ") = " << pa3 << ".\n";
    out << "Real residual : " << findRealResidual (a3, pa3) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (n, xf, xl) << ".\n\n";

    createNodes (m, xm, fxm, xf, xl);
    out << m+1 << " nodes:\n\n";
    for (int i = 0; i <= m; ++i)
        out << setw (10) << xm[i];
    out << "\n";
    for (int i = 0; i <= m; ++i)
        out << setw (10) << fxm[i];
    a1 = xf + (xl - xf) / 3 / m * 2;
    a2 = xm[m/2] + (xl - xf) / 2 / m;
    a3 = xl - (xl - xf) / 3 / m;
    pa1 = P(a1, m, xm, fxm);
    pa2 = P(a2, m, xm, fxm);
    pa3 = P(a3, m, xm, fxm);
    out << "\n\nP(" << a1 << ") = " << pa1 << ".\n";
    out << "Real residual : " << findRealResidual (a1, pa1) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (m, xf, xl) << ".\n\n";
    out << "P(" << a2 << ") = " << pa2 << ".\n";
    out << "Real residual : " << findRealResidual (a2, pa2) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (m, xf, xl) << ".\n\n";
    out << "P(" << a3 << ") = " << pa3 << ".\n";
    out << "Real residual : " << findRealResidual (a3, pa3) << ".\n";
    out << "Theoretical residual : " << findTheoreticalResidual (m, xf, xl) << ".\n\n";

    delete [] xn;
    delete [] xm;
    delete [] fxn;
    delete [] fxm;
}
