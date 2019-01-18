require 'byebug'

def my_min(arr)
  arr.each do |el1|
    arr.each do |el2|
      next if el1 == el2
      break if el2 < el1
      return el1 if arr[-1] == el2
    end
  end
end
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def my_min2(arr)
  minimum = arr[0]
  arr[1..-1].each do |el|
    minimum = el if el < minimum
  end
  minimum
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

def largest_contiguous_subsum(list)
  # debugger
  results = [] # O(1)

  list.each_with_index do |el1, idx1| # O(n)
    list.each_with_index do |el2, idx2| # O(n) => O(n^2)
      next if idx2 < idx1 # O(1)
      results << list[idx1..idx2] # O(1)
    end
  end

  results.map! { |subsum| subsum.reduce(:+) } # O(n^2)
  results.max # O(1)
end

def lcs(list)
  # debugger
  largest = 0
  current = 0
  list.each do |el|
    if current + el > 0
      current += el
      largest = current if current > largest
    else
      current = 0
    end
  end
  largest
end

def lcs2(list)
  arr[0] > 1 ? largest = 0 : largest = arr[0]
  current = 0
  list.each do |el|
    if current + el > largest
      current += el
      largest = current if current > largest
    else
      current = 0
    end
  end
  largest
end

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
p lcs(list1)
p lcs(list2)
p lcs(list3)