class ListNode
  attr_reader :value
  attr_accessor :next

  def initialize value
    @value = value
  end
end

class LinkedList
  attr_reader :head

  def initialize(value)
    @head = ListNode.new(value)
  end

  def add value
    node = ListNode.new(value)
    n = @head

    until n.next.nil?
      n = n.next
    end

    n.next = node
  end

  def remove value
    return false if @head.nil?

    current_node = @head

    if current_node.value == value
      @head = current_node.next
      return true
    end

    while current_node.next != nil
      if current_node.next.value == value
        current_node.next = current_node.next.next
        return true
      end
    end

    return false
  end

  def nodes
    values = []
    n = @head

    until n.nil?
      values << n.value
      n = n.next
    end

    values
  end
end
