import numpy as np
import matplotlib.pyplot as plt



def norm_histogram(hist):
    """
    takes a histogram of counts and creates a histogram of probabilities

    :param hist: list
    :return: list
    """
    total_sum = sum(hist)
    hist_prob = []

    for i in hist:
        prob = i / total_sum
        hist_prob.append(prob)

    return(hist_prob)
    pass

def compute_j(histo, width):
    """
    takes histogram of counts, uses norm_histogram to convert to probabilties, it then calculates compute_j for one bin width

    :param histo: list
    :param width: float
    :return: float
    """
    hist_p = norm_histogram(histo)
    m = sum(i for i in histo)
    hist_j = [i**2 for i in hist_p]
    sum_p = sum(hist_j)
    j = (2 / ((m - 1) * width)) - ((m + 1) / ((m - 1) * width)) * sum_p

    return(j)
    pass


def sweep_n(data, minimum, maximum, min_bins, max_bins):
    """
    find the optimal bin
    calculate compute_j for a full sweep [min_bins to max_bins]
    please make sure max_bins is included in your sweep

    :param data: list
    :param minimum: int
    :param maximum: int
    :param min_bins: int
    :param max_bins: int
    :return: list
    """
    optimal_list = []
    while min_bins <= max_bins:
        j_val = compute_j(plt.hist(data, min_bins, (minimum,maximum))[0], (maximum - minimum) / min_bins)
        optimal_list.append(j_val)
        min_bins += 1

    return(optimal_list)
    pass


def find_min(l):
    """
    generic function that takes a list of numbers and returns smallest number in that list its index.
    return optimal value and the index of the optimal value as a tuple.

    :param l: list
    :return: tuple
    """

    return(min(l),l.index(min(l)))
    pass


if __name__ == '__main__':
    data = np.loadtxt('input.txt')  # reads data from input.txt
    lo = min(data)
    hi = max(data)
    bin_l = 1
    bin_h = 100
    js = sweep_n(data, lo, hi, bin_l, bin_h)
    """
    the values bin_l and bin_h represent the lower and higher bound of the range of bins.
    They will change when we test your code and you should be mindful of that.
    """
    print(find_min(js))
