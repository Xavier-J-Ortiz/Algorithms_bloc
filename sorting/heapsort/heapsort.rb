def sort_heap(array)
  create_max_heap(array)

  last_element = array.length - 1
  (last_element).downto(0) do |current_location|
    swap_nodes(array, current_location, 0)
    array = create_max_heap(array[0...current_location]) + array[current_location..-1]
  end

  return array
end

def create_max_heap(array)
  last_element = array.length - 1
  (last_element).downto(0) do |current_location|
    parent_location = (current_location - 1) / 2
    if (current_location != 0 and array[current_location] > array[parent_location])
      swap_nodes(array, current_location, parent_location)
    end
    filter_down(array, current_location)
  end
  return array
end

def filter_down(array, current_location)
  child_location_left,
    child_location_right, 
    left_child_greater_than_parent, 
    right_child_greater_than_parent, 
    at_least_one_child_greater_than_parent, 
    both_children_greater_than_parent = compare_children(array, current_location)

  while at_least_one_child_greater_than_parent
    if both_children_greater_than_parent
      if array[child_location_left] <= array[child_location_right]
        swap_and_update_current_location(array, current_location, child_location_right)
      else
        swap_and_update_current_location(array, current_location, child_location_left)
      end
    else
      if right_child_greater_than_parent
        swap_and_update_current_location(array, current_location, child_location_right)
      elsif left_child_greater_than_parent
        swap_and_update_current_location(array, current_location, child_location_left)
      end
    end
    child_location_left,
      child_location_right, 
      left_child_greater_than_parent, 
      right_child_greater_than_parent, 
      at_least_one_child_greater_than_parent, 
      both_children_greater_than_parent = compare_children(array, current_location)
  end
  return array
end

def swap_and_update_current_location(array, current_location, child_location)
  swap_nodes(array, current_location, child_location)
  current_location = child_location
end

def compare_children(array, current_location)
  child_location_left = current_location * 2 + 1
  child_location_right = child_location_left + 1
  left_child_greater_than_parent = (!array[child_location_left].nil? and array[child_location_left] > array[current_location])
  right_child_greater_than_parent = (!array[child_location_right].nil? and array[child_location_right] > array[current_location])
  at_least_one_child_greater_than_parent = (left_child_greater_than_parent or right_child_greater_than_parent)
  both_children_greater_than_parent = (left_child_greater_than_parent and right_child_greater_than_parent)

  return [child_location_left,
          child_location_right,
          left_child_greater_than_parent,
          right_child_greater_than_parent,
          at_least_one_child_greater_than_parent,
          both_children_greater_than_parent]
end

def swap_nodes(array, current_location, next_location)
  temp = array[next_location] 
  array[next_location] = array[current_location]
  array[current_location] = temp 
end

=begin
puts sort_heap([1, 2, 3, 4, 5]).to_s
puts sort_heap([-5, 5, 23, 42, 9, 4, 3, 200, 2, 1, -11]).to_s
puts sort_heap([12, 11, 13, 5, 6, 7]).to_s
=end
