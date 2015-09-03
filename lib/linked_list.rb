class Node
  attr_accessor :value, :next

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

class List
  attr_accessor :count
  attr_reader :value, :next

  def initialize(value)
    @head = Node.new(value, nil)
  end

  def find_head
    @head = current
  end

  def find_tail
    current = @head
    until current.next.nil?
      current = current.next
    end
    current
  end

  def append(value)
    find_tail.next = Node.new(value, nil)
  end

  def prepend(value)
    next_node = Node.new(value, next_node)
    next_node.next = @head
    @head = next_node
  end

  def count_nodes
    current = @head
    counter = 1
    until current.next.nil?
      current = current.next
      counter += 1
    end
    counter
  end

  def insert(value, index)
    node = Node.new(value)
    current = @head
    counter = 0
    while counter < index
      counter += 1
      find_node(counter, node, current, index)
    end
    current.next = node
  end

  def find_node(counter, node, current, index)
    if counter == (index - 1)
      node.next = current.next
      current.next = node
    else
      current.next
    end
  end

  def includes?(search)
    current = @head
    while current.value != search
      current = current.next
      return false if current.nil?
    end
    true
  end

  def pop
    current = @head
    counter = count_nodes - 1
    pop_count = 1
    while pop_count < counter
      current = current.next
      pop_count += 1
    end
    current.next = nil
  end

  def find_by_index(index)
    current = @head
    counter = 1
    while counter < index
      current = current.next
      counter += 1
      return 'Not a valid index' if current.nil?
    end
    current.value if index == counter
  end

  def remove_by_index(index)
    current = @head
    counter = 0
    until counter == (index - 1)
      current = current.next
      counter += 1
      return 'Not a valid index' if current.nil?
    end
    current.next = current.next.next
  end

  def find_by_value(value)
    current = @head
    @count = 0
    while current.value != value
      @count += 1
      current = current.next
      return 'Not a valid value' if current.next.nil?
    end
    current
  end

  def remove_by_value(value)
    current = @head
    counter = 0
    while current.next.value != value
      current = current.next
      counter += 1
      return 'Not a valid value' if current.next.nil?
    end
    current.next = current.next.next
  end

  def distance(start_value, final_value)
    find_by_value(start_value)
    start_index = count
    find_by_value(final_value)
    final_index = count
    start_index - final_index
  end
end
