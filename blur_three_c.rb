class Image
  attr_accessor :image_array

  def initialize(image_array)
    @image_array = image_array
    @num_col = image_array.first.length
    @num_row = image_array.length
  end

  def output_image
    @image_array.each do |e|
      puts e.join
    end
  end

  def find_ones
    ones_locations = []
    # => finding index of ROW and COL for each 1 in grid and storing as row/col array pairs
    @image_array.each_index do |row|
      @image_array[row].each_index do |col|
        if @image_array[row][col] == 1
          #puts "#{row}, #{col}"
          ones_locations << [row, col]
        end
      end
    end
    return ones_locations
  end


  def blur(distance)
    # ones in image3 = [[2, 2]]
    
    step_values = []
    d = distance + 1
    d.times do |move_x|
      d.times do |move_y|
        if move_x + move_y <= distance
          step_values.push([move_x, move_y])
          step_values.push([move_x, -1 * move_y])
          step_values.push([-1 * move_x, move_y])
          step_values.push([-1 * move_x, -1 * move_y])
        end
      end
      
    end
    step_values.uniq!
    #puts "#{step_values}"
    
    target_pixels = find_ones
    target_pixels.each do |x, y|
      step_values.each do |x_offset, y_offset|
        x2 = x + x_offset
        y2 = y + y_offset
        # puts "#{x2}, #{y2}"

        # add edge cases 
        # x2 >= 0 &&
        # && y2 <= @num_row
        #if x2 <= @num_col && y2 >= 0
        unless (x + x_offset == nil) || (y + y_offset == nil)
          @image_array[x + x_offset][y + y_offset] = 1
        end
        #end
      end
    end

    # add edge cases 


  end

end

image3 = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])

image3.blur(3)
image3.output_image

