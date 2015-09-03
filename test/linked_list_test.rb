require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListsTest < Minitest::Test
  def test_head_node_value
    node = Node.new('test', nil)
    assert_equal 'test', node.value
  end

  def test_next_node_is_nil
    node = Node.new(1234, nil)
    assert_equal nil, node.next
  end

  def test_node_next_not_nil
    node = Node.new('test', 'next node')
    assert_equal 'next node', node.next
  end

  def test_add_one_node
    node = List.new('test').append('test2')
    assert_equal 'test2', node.value
  end

  def test_add_node_to_front
    node = List.new('test')
    node2 = node.prepend('testfront')
    assert_equal 'testfront', node2.value
  end

  def test_show_tail
    node = List.new('test')
    node2 = node.prepend('test2')
    assert_equal node.find_tail, node2.next
  end

  def test_count_two_nodes
    node = List.new('test')
    node.prepend('test2')
    assert_equal 2, node.count_nodes
  end

  def test_count_four_nodes
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    node.append('test4')
    assert_equal 4, node.count_nodes
  end

  def test_find_tail_node
    node = List.new('test')
    node.prepend('test2')
    node.prepend('test3')
    tail = node.find_tail
    assert_equal 'test', tail.value
  end

  def test_in_index
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    node.append('test4')
    assert node.includes?('test2')
  end

  def test_find_other_index_in_front
    node = List.new('test')
    node.prepend('test2')
    node.prepend('test3')
    assert_equal 'test3', node.find_by_index(1)
  end

  def test_pops_off
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    node.pop
    assert_equal 'test2', node.find_tail.value
  end

  def test_insert_arbitrary
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    node.insert('test4', 2)
    assert_equal 'test4', node.find_by_index(2)
  end

  def test_find_by_index
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    assert_equal 'test2', node.find_by_index(2)
    assert_equal 'Not a valid index', node.find_by_index(7)
  end

  def test_find_by_value
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    assert_equal 'test2', node.find_by_value('test2').value
    assert_equal 'Not a valid value', node.find_by_value('test7')
  end

  def test_remove_by_index
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    node.remove_by_index(1)
    assert_equal 'test3', node.find_by_index(2)
    assert_equal 'Not a valid index', node.find_by_index(5)
  end

  def test_remove_by_value
    node = List.new('test')
    node.append('test2')
    node.append('test3')
    node.remove_by_value('test2')
    assert_equal 'test3', node.find_by_index(2)
    assert_equal 'Not a valid value', node.remove_by_value('test7')
  end

  def test_node_distance
    node = List.new('test')
    node.prepend('test2')
    node.prepend('test3')
    node.prepend('test4')
    node.prepend('test5')
    assert_equal 2, node.distance('test2', 'test4')
    assert_equal 3, node.distance('test2', 'test5')
  end
end
