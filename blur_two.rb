class Image

  # Set up the initial grid
  def initialize(image_array)
    @image_array = image_array
    
    # => find the length of the first subarray to find the total
    # => number of columns
    @num_col = image_array.first.length
    # => find the length of the outer array to find the total
    # => number of rows
    @num_row = image_array.length
  end

  # Find the ones within the grid
  def find_ones
    # => Establish an empty array to hold the index positions of all the 1s
    ones_ary = []
    # => Finding the index of ROW and COL for each 1 in the grid and storing
    # => them as row/col array pairs

    # => |row| denotes the top-level array (could be named anything)
    @image_array.each_index do |row|
      # => |col| is the chosen variable name for the inner array
      @image_array[row].each_index do |col|
        if @image_array[row][col] == 1
          puts "#{row}, #{col}"
          ones_ary << [row, col]
        end
      end
    end 
    return ones_ary
  end

  # => assumes the argument being given is a 2-D array
  def blur_pixel(ones_array)
    ones_array.each do |point_array|
      # => breaks the point_array inner arrays into its two parts --
      # => wouldn't work if there was stuff in the middle
      row = point_array.first
      col = point_array.last
      # => this is where the transformation happens
      @image_array[row - 1][col] = 1
      @image_array[row][col - 1] = 1 unless col == 0
      @image_array[row + 1][col] = 1 unless row >= @num_row - 1
      @image_array[row][col + 1] = 1 unless col >= @num_col - 1 

    end
  end

  def output_image
    @image_array.each do |e|
      puts e.join
    end
  end

end


image2 = Image.new([
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 1],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0]
])

# Print out the image as is
image2.output_image
# Run find_ones method and store the result in a variable called "one_pixels"
one_pixels = image2.find_ones
# Just print out the variable to make sure we got the right result
puts "#{one_pixels}"
# Run the blur_pixels method using the established one_pixels variable as the argument
image2.blur_pixel(one_pixels)
# Print out the result of running the blur-pixels method
image2.output_image