arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p arr.map {|inner_arr| inner_arr.sort {|a,b| b <=> a}}
