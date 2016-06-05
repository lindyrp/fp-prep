class Image

  def initialize(image_array)
    @image_array = image_array
    # => length of first subarray = number of columns
    @num_col = image_array.first.length
    # => length of outer array = number of rows
    @num_row = image_array.length
  end

  def find_ones
    ones_ary = []
      # => |row| denotes top-level array
    @image_array.each_index do |row|
      # => |col| denotes inner array
      @image_array[row].each_index do |col|
        if @image_array[row][col] == 1
          ones_ary << [row, col]
        end
      end
    end 
    return ones_ary
  end

  # => assumes the argument is a 2-D array
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

  def blur(distance)
    distance.times do
      ones_array = find_ones
      blur_pixel(ones_array)
    end
  end

end

image3 = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])

image3.blur(4)
image3.output_image