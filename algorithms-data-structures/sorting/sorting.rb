class Sorting
  class << self
    def bubble_sort list
      return list if list.length <= 1

      loop do
        swapped = false

        0.upto(list.length - 2).each do |i|
          if list[i] > list[i+1]
            list[i+1], list[i] = list[i], list[i+1]
            swapped = true
          end
        end

        break unless swapped
      end

      list
    end

    def selection_sort list
      len = list.length

      0.upto(len - 1).each do |i|
        min_i = i

        (i+1).upto(len - 1).each do |j|
          if list[j] < list[min_i]
            min_i = j
          end
        end

        if min_i != i
          list[i], list[min_i] = list[min_i], list[i]
        end
      end

      list
    end

    def quick_sort list, left=nil, right=nil
      return list if list.length <= 1

      left ||= 0
      right ||= list.length - 1

      idx = partition(list, left, right)

      if left < idx - 1
        quick_sort(list, left, idx - 1)
      end

      if right > idx
        quick_sort(list, idx, right)
      end

      list
    end

    def partition list, left, right
      pivot = list[(left + right) / 2]

      while left <= right

        while list[left] < pivot
          left += 1
        end

        while list[right] > pivot
          right -= 1
        end

        if left <= right
          list[left], list[right] = list[right], list[left]
          left += 1
          right -= 1
        end
      end

      left
    end

    def merge_sort list
      return list if list.length <= 1

      mid   = (list.length / 2).floor
      left  = merge_sort(list.slice(0, mid))
      right = merge_sort(list.slice(mid, list.length))

      merge(left, right)
    end

    def merge left, right
      if left.empty?
        right
      elsif right.empty?
        left
      elsif left.first < right.first
        [left.first] + merge(left.slice(1, left.length), right)
      else
        [right.first] + merge(left, right.slice(1, right.length))
      end
    end

    def insertion_sort list
      return list if list.length <= 1

      1.upto(list.length - 1) do |i|
        j = i

        while j > 0 && list[j-1] > list[j]
          list[j], list[j-1] = list[j-1], list[j]
          j -= 1
        end
      end

      list
    end
  end
end
