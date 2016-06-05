
# USE INDEX POSITION TO CHANGE VALUES IN ROWS AND COLUMNS WITHIN
# N DISTANCE FROM 1 (INCLUSIVE)
  # all items where n <= x + y

class Image
  attr_accessor :image_array
  
  # Set up the initial grid
  def initialize(image_array)
    @image_array = image_array
      @num_col = image_array.first.length
      # => finding total # of columns, used later as grid boundary
      @num_row = image_array.length
      # => finding total # of rows, used later as grid boundary
  end

  # Find x/y coordinates of the 1s in the given image
  def find_ones
    ones_locations = []
    # => finding index of ROW and COL for each 1 in grid and storing as row/col array pairs
    @image_array.each_index do |row|
      @image_array[row].each_index do |col|
        if @image_array[row][col] == 1
          puts "#{row}, #{col}"  # <---this is just to display that it's working, can be removed
          ones_locations << [row, col]
        end
      end
    end
    return ones_locations
  end

  def blur(distance)
    # step_values are all the **relative** pixel coordinates that need to change based on distance.
    # these are positive only, so only in top right quadrant from the 1
    step_values = []
    d = distance + 1
    find_ones.each do |row, col|
      d.times do |x|
        d.times do |y|
          
          step_values.push([x, y]) unless x + y > distance
          puts "#{step_values}"
        end
      end


    end
      
    # steps_all_quads = []

    # step_values.each do |coord|
    #   x, y = coord
    #   if x + y <= n
    #     steps_all_quads.push([x, y])
    #     steps_all_quads.push([-x, y])
    #     steps_all_quads.push([x, -y])
    #     steps_all_quads.push([-x, -y])
    #   end
    # end

    # return steps_all_quads
  end




    #find the x/y values of the cells surrounding the 1s where x.abs + y.abs <= distance
    #here is where I need to utilize the moves_to_make method??? or do i need to make
    # the steps_all_quads variable accessible here?
    #surrounding_values = []

    #change the content of those x/y values to 1 

  # how i did it in IB#2

  #   # => assumes the argument being given is a 2-D array
  # def blur_pixel(ones_array)
  #   ones_array.each do |point_array|
  #     # => breaks the point_array inner arrays into its two parts --
  #     # => wouldn't work if there was stuff in the middle
  #     row = point_array.first
  #     col = point_array.last
  #     # => this is where the transformation happens
  #     @image_array[row - 1][col] = 1
  #     @image_array[row][col - 1] = 1 unless col == 0
  #     @image_array[row + 1][col] = 1 unless row >= @num_row - 1
  #     @image_array[row][col + 1] = 1 unless col >= @num_col - 1 

  #   end
  # end

  
  def output_image
    @image_array.each do |e|
      puts e.join
    end
  end

end


image3 = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
])


image3.blur(2)
