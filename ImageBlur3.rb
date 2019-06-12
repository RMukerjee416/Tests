class Image

  def initialize (paint)
    @paint = paint
  end

  # keeping original representation
  def output_image
    @paint.each do |brush|
      puts brush.join
    end
  end

  # copying blurred method from previous exercise
  def blurred
    unos = []
    # nested loops for rows and columns
    @paint.each_with_index do |row, rownum| # iterating over elements in the main array for rows 
      row.each_with_index do |element, colnum| # iterating over elements in each subarray for columns
        if element == 1
          unos << [rownum, colnum]
        end
      end
    end

    unos.each do |rownum, colnum|         
      # assigning "1" above "1"s, except for first row
      @paint[rownum -1][colnum] = 1 unless rownum == 0
      # assigning "1" below "1"s, except for last row
      @paint[rownum +1][colnum] = 1 unless rownum >= @paint.length-1
      # assigning "1" to the left of "1"s, except for first column
      @paint[rownum][colnum -1] = 1 unless colnum == 0
      # assigning "1" to the right of "1"s, except for last column
      @paint[rownum][colnum +1] = 1 unless colnum >= @paint[rownum].length-1
    end
  end

  # multiplying the effect of blurred method
  def blur(distance)
    distance.times do
      blurred
    end
  end

end

image = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1],
])


puts "Original image: "
image.output_image

# asking for user input

puts "Please enter the degree of blur (Manhattan distance): "
manhattan_distance = gets.to_i

# applying blurred method

puts "Image blurred: "
image.blur(manhattan_distance)
image.output_image
