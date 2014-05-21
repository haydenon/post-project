#Taken and adapted from: http://cs.lmu.edu/~ray/notes/pqueues/

# A priority queue class

class PriorityQueue
  def initialize
    @heap = []
  end

  def empty?
    return @heap.length==0
  end

  # Add an element to the queue
  def add(x)
    @heap << x
    sift_up(@heap.length - 1)
  end

  # Return the smallest element in the queue
  def peek
    @heap[0]
  end

  # Remove the smallest element from the queue
  def remove()
    raise RuntimeError, "Empty Queue" if @heap.length == 0
    ret = nil
    if @heap.length == 1
      ret = @heap[0]
      @heap = []
    else
      ret = @heap[0]
      @heap[0] = @heap.pop
      sift_down(0)
    end
    return ret
  end

  private

  # Sift up the element at index i
  def sift_up(i)
    parent = (i - 1) / 2
    if parent >= 0 and @heap[parent] > @heap[i]
      @heap[parent], @heap[i] = @heap[i], @heap[parent]
      sift_up(parent)
    end
  end

  # Sift down the element at index i
  def sift_down(i)
    child = (i * 2) + 1
    return if child >= @heap.length
    child += 1 if child + 1 < @heap.length and @heap[child] > @heap[child+1]
    if @heap[i] > @heap[child]
      @heap[child], @heap[i] = @heap[i], @heap[child]
      sift_down(child)
    end
  end
end