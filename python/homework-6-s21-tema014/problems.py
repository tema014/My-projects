import re

def problem1(searchstring):
    """
    Match phone numbers.

    :param searchstring: string
    :return: True or False
    """
    x = re.search(r'^(\S\W?\d+\W?)\W?(\d+)\W+(\d+)',searchstring)
    if x == 0:
        return False
    else:
        return True
    pass

def problem2(searchstring):
    """
    Extract street name from address.

    :param searchstring: string
    :return: string
    """
    x = re.search('(\d+)(.*)\s(?=(Ave|St|Rd))',searchstring)
    return x.group(2)
    pass

def problem3(searchstring):
    """
    Garble Street name.

    :param searchstring: string
    :return: string
    """
    x = re.search('(\d+)(\s.*)\s(?=(Ave|St|Rd))',searchstring)
    y = x.group(2)+" "
    z = str(y[::-1])
    new = searchstring.replace(y,z)
    return new
    pass


if __name__ == '__main__' :
    print(problem1('765-494-4600')) #True
    print(problem1(' 765-494-4600 ')) #False
    print(problem1('(765) 494 4600')) #False
    print(problem1('(765) 494-4600')) #True
    print(problem1('494-4600')) #True

    print(problem2('The EE building is at 465 Northwestern Ave.')) #Northwestern
    print(problem2('Meet me at 201 South First St. at noon')) #South First

    print(problem3('The EE building is at 465 Northwestern Ave.'))
    print(problem3('Meet me at 201 South First St. at noon'))
