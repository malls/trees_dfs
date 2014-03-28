class Node
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def add_child(value)
    n = Node.new(value)
    @children << n
    n
  end

  def dfs(value)
    # if the given value is the same as this node - return self
    # Otherwise call dfs on each child and see if they found it
    # if the child found it, return the result
    # otherwise move on to the next child
    # If no child can find it, return nil

    @returnMe = nil

    if @value == value
      @returnMe = self
      return @returnMe
    end

    self.children.each do |x| 
      if x.value == value
        @returnMe = x
        return @returnMe
      else 
        y = x.dfs(value)
        unless y.nil?
          return y
        end
      end
    end
    
    @returnMe
  end

  def bfs(value, queue = [])

    if value == @value
      return self
    end
    # if the given value is the same as this node return self
    # Otherwise add all of this nodes children to the queue
    # of nodes needed to be searched

    returnMe = nil

    queue += @children

    if !queue.empty?
      x = queue.shift
      if x == value
        returnMe = x
      else
        returnMe = x.bfs(value, queue)
      end
    end

    returnMe
      
    # While the queue is not empty
    # grab the first element in the queue (and remove it)
    # run bfs on that node with the proper argument and get the result
    # if that node found what you're looking for, return the resulting node
    # Otherwise, move on to the next node
    #
    # If the queue is empty and you haven't found it yet, return nil
  end
end

    @house = @door = Node.new("door")
    @l_room = @house.add_child("living room")
    @kitchen = @l_room.add_child("kitchen")
    @tv = @l_room.add_child("TV")
    @couch = @l_room.add_child("Couch")
    @stairs = @l_room.add_child("Stairs")
    @refrigerator = @kitchen.add_child("refrigerator")
    @microwave = @kitchen.add_child("microwave")
    @food = @kitchen.add_child("food")
    @l_room2 = @stairs.add_child("2nd living room")
    @bedroom1 = @l_room2.add_child("bedroom1")
    @bedroom2 = @l_room2.add_child("bedroom2")
    @bedroom3 = @l_room2.add_child("bedroom3")
