import numpy as np
import matplotlib.pyplot as plt

# Return fitted model parameters to the dataset at datapath for each choice in degrees.
# Input: datapath as a string specifying a .txt file, degrees as a list of positive integers.
# Output: paramFits, a list with the same length as degrees, where paramFits[i] is the list of
# coefficients when fitting a polynomial of d = degrees[i].
def main(datapath, degrees):
    paramFits = []
    # fill in
    # read the input file, assuming it has two columns, where each row is of the form [x y] as
    # in poly.txt.
    # iterate through each n in degrees, calling the feature_matrix and least_squares functions to solve
    # for the model parameters in each case. Append the result to paramFits each time.
    file = open(datapath, "r")

    x_values = []
    y_values = []

    y = []
    y1 = []
    y2 = []
    y3 = []
    y4 = []

    fileData = file.readlines()
    for k in fileData:
        k = k.split(" ")
        x_values.append(float(k[0]))
        y_values.append(float(k[1]))
    for j in degrees:
        paramFits.append(least_squares(feature_matrix(x_values, j), y_values))
    x_sort = sorted(x_values)
    for w in x_sort:
        y.append(paramFits[0][0] * w + paramFits[0][1])
        y1.append(paramFits[1][0] * (w ** 2) + paramFits[1][1] * w + paramFits[1][2])
        y2.append(paramFits[2][0] * (w ** 3) + paramFits[2][1] * (w ** 2) + paramFits[2][2] * w + paramFits[2][3])
        y3.append(paramFits[3][0] * (w ** 4) + paramFits[3][1] * (w ** 3) + paramFits[3][2] * (w ** 2)
                  + paramFits[3][3] * w + paramFits[3][4])
        y4.append(paramFits[4][0] * (w ** 5) + paramFits[4][1] * (w ** 4) + paramFits[4][2] * (w ** 3)
                  + paramFits[4][3] * (w ** 2) + paramFits[4][4] * w + paramFits[4][5])
    file.close()

    plt.scatter(x_values, y_values, color='r', marker='*')
    plt.plot(x_sort, y, color='m', linestyle='-')
    plt.plot(x_sort, y1, color='g', linestyle='-')
    plt.plot(x_sort, y2, color='r', linestyle='-')
    plt.plot(x_sort, y3, color='y', linestyle='-')
    plt.plot(x_sort, y4, color='b', linestyle='-')
    plt.legend(["d = 1", "d = 2", "d = 3", "d = 4", "d = 5", "Data"], loc='upper left')
    plt.xlabel("x")
    plt.ylabel("y")
    plt.show()

    return paramFits

# Return the feature matrix for fitting a polynomial of degree d based on the explanatory variable
# samples in x.
# Input: x as a list of the independent variable samples, and d as an integer.
# Output: X, a list of features for each sample, where X[i][j] corresponds to the jth coefficient
# for the ith sample. Viewed as a matrix, X should have dimension #samples by d+1.
def feature_matrix(x, d):
    # fill in
    # There are several ways to write this function. The most efficient would be a nested list comprehension
    # which for each sample in x calculates x^d, x^(d-1), ..., x^0.
    X = []

    ind = 0

    for j in x:
        ind_d = d
        X.append([])
        while ind_d >= 0:
            X[ind].append(j**ind_d)
            ind_d -= 1
        ind += 1
        
    return X

# Return the least squares solution based on the feature matrix X and corresponding target variable samples in y.
# Input: X as a list of features for each sample, and y as a list of target variable samples.
# Output: B, a list of the fitted model parameters based on the least squares solution.
def least_squares(X, y):
    X = np.array(X)
    y = np.array(y)

    # fill in0
    # Use the matrix algebra functions in numpy to solve the least squares equations. This can be done in just one line.
    C = (np.linalg.inv(X.T @ X)) @ (X.T @ y)
    B = C

    return B

if __name__ == '__main__':
    datapath = 'poly.txt'
    degrees = [1, 2, 3, 4, 5]
    paramFits = main(datapath, degrees)
    print(paramFits)
