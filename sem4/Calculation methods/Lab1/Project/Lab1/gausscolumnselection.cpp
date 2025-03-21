#include "gausscolumnselection.h"

GaussColumnSelection::GaussColumnSelection()
{

}

Matrix GaussColumnSelection::solveSystem(const Matrix &A, const Matrix &b) const
{
    if(A.getRowCount() != b.getRowCount())
    {
        throw "Cannot solve, because matrixes have different row number";
    }

    Matrix A_{A};
    Matrix b_{b};

    // Getting upper triangle matrix
    for(size_t i{0}; i < A_.getColumnCount()-1; ++i)
    {

        // Searching for max element in column
        size_t indexOfAbsoluteMax{i};
        for(size_t j{i}; j < A_.getRowCount(); ++j)
        {
            if(std::abs(A_.getMatrixElement(j, i)) > std::abs(A_.getMatrixElement(indexOfAbsoluteMax, i)))
            {
                indexOfAbsoluteMax = j;
            }
        }

        swapRows(A_, b_, i, indexOfAbsoluteMax);

        for(size_t j{i+1}; j < A_.getRowCount(); ++j)
        {

            if(std::abs(A_.getMatrixElement(j, i) - 0) < 0.000000001 )
            {
                continue;
            }

            double multiplier{(-1) * A_.getMatrixElement(j,i) / A_.getMatrixElement(i, i)};

            // Some actions on matrix A
            for(size_t p{0}; p < A.getColumnCount(); ++p)
            {
                A_.setMatrixElement(j, p, A_.getMatrixElement(j, p) + multiplier * A_.getMatrixElement(i, p));
            }

            // The same actions on matrix b
            for(size_t p{0}; p < b_.getColumnCount(); ++p)
            {
                b_.setMatrixElement(j, p, b_.getMatrixElement(j, p) + multiplier * b_.getMatrixElement(i, p));
            }
        }
    }

    // Solving the system down up(using xn to find xn-1 and etc)
    for(int i{(int)A_.getRowCount() - 1}; i >= 0; --i)
    {
        double sum{b_.getMatrixElement(i, 0)};
        for(size_t j{(size_t)i + 1}; j < A_.getColumnCount(); ++j)
        {
            sum -= A_.getMatrixElement(i, j) * b_.getMatrixElement(j, 0);
        }
        b_.setMatrixElement(i, 0, sum / A_.getMatrixElement(i, i));
    }

    return b_;
}
/*
void GaussColumnSelection::swapRows(Matrix &A, Matrix &b, const size_t rowIndex1, const size_t rowIndex2) const
{
    if(rowIndex1 == rowIndex2)
    {
        return;
    }

    if(A.getRowCount() != b.getRowCount())
    {
        throw "Cannot swap, because matrixes have different row number";
    }

    // Swapping rows in matrix A
    for(size_t i{0}; i < A.getColumnCount(); ++i)
    {
        double temp{A.getMatrixElement(rowIndex1, i)};

        A.setMatrixElement(rowIndex1, i, A.getMatrixElement(rowIndex2, i));
        A.setMatrixElement(rowIndex2, i, temp);
    }

    // Swapping rows in matrix b
    for(size_t i{0}; i < b.getColumnCount(); ++i)
    {
        double temp{b.getMatrixElement(rowIndex1, i)};

        b.setMatrixElement(rowIndex1, i, b.getMatrixElement(rowIndex2, i));
        b.setMatrixElement(rowIndex2, i, temp);
    }
}
*/
