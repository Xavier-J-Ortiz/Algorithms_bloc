def heap_sort(array)
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
    right_child_greater_than_parent,
    right_child_greater_than_left_child,
    at_least_one_child_greater_than_parent,
    both_children_greater_than_parent = compare_children(array, current_location)

  while at_least_one_child_greater_than_parent
    if both_children_greater_than_parent
      swap_right_or_left_child_with_parent(right_child_greater_than_left_child, array, current_location, child_location_right, child_location_left)
    else
      swap_right_or_left_child_with_parent(right_child_greater_than_parent, array, current_location, child_location_right, child_location_left)
    end
    child_location_left,
      child_location_right,
      right_child_greater_than_parent,
      right_child_greater_than_left_child,
      at_least_one_child_greater_than_parent,
      both_children_greater_than_parent = compare_children(array, current_location)
  end
  return array
end

def swap_right_or_left_child_with_parent(go_right, array, current_location, child_location_right, child_location_left)
  if go_right
    swap_and_update_current_location(array, current_location, child_location_right)
  else
    swap_and_update_current_location(array, current_location, child_location_left)
  end
end

def swap_and_update_current_location(array, current_location, child_location)
  swap_nodes(array, current_location, child_location)
  current_location = child_location
end

def compare_children(array, current_location)
  child_location_left = current_location * 2 + 1
  child_location_right = child_location_left + 1
  left_child = array[child_location_left]
  right_child = array[child_location_right]
  current_node = array[current_location]

  left_child_greater_than_parent = (left_child and left_child > current_node)
  right_child_greater_than_parent = (right_child and right_child > current_node)
  at_least_one_child_greater_than_parent = (left_child_greater_than_parent or right_child_greater_than_parent)
  both_children_greater_than_parent = (left_child_greater_than_parent and right_child_greater_than_parent)
  right_child_greater_than_left_child = (left_child && right_child && left_child <= right_child)

  return [child_location_left,
          child_location_right,
          right_child_greater_than_parent,
          right_child_greater_than_left_child,
          at_least_one_child_greater_than_parent,
          both_children_greater_than_parent]
end

def swap_nodes(array, current_location, next_location)
  temp = array[next_location]
  array[next_location] = array[current_location]
  array[current_location] = temp
end
