require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_pop
    todo1 = @todos.pop
    todo2 = @list.pop

    assert_equal(todo1, todo2)
    assert_equal(@todos, @list.to_a)
  end  

  def test_shift
    todo1 = @todos.shift
    todo2 = @list.shift

    assert_equal(todo1, todo2)
    assert_equal(@todos, @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shovel
    todo = Todo.new('Walk the dog')

    @todos << todo
    @list << todo
    
    assert_equal(@todos, @list.to_a)
  end
    
  def test_add
    todo = Todo.new('Walk the dog')

    @todos << todo
    @list.add(todo)
    
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @list.first.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_undone_at(0)
    assert_equal(false, @list.first.done?)
  end

  def test_done!
    @list.each(&:undone!)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @todos.delete_at(0)
    @list.remove_at(0)
    assert_equal(@todos, @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    container = []
    @list.each { |todo| container << todo }
    assert_equal(container, @list.to_a)
  end

  def test_each_returns_original_object
    assert_equal(@list, @list.each { nil })
  end

  def test_select
    @list.mark_done_at(0)
    assert_equal([@todo2, @todo3], @list.select { |t| !t.done? }.to_a)
  end

  def test_all_done
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    new_list = TodoList.new("Today's Todos")
    @todo1.done!
    @todo2.done!
    new_list.add(@todo1)
    new_list.add(@todo2)
    assert_equal(new_list, @list.all_done)
  end

  def test_all_not_done
    @list.mark_done_at(2)
    new_list = TodoList.new("Today's Todos")
    new_list.add(@todo1)
    new_list.add(@todo2)
    assert_equal(new_list, @list.all_not_done)
  end

  def test_mark_all_undone
    @list.mark_done_at(0)
    @list.mark_all_undone
    assert_equal(@todos, @list.to_a)
  end
end
