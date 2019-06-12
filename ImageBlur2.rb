class Image

  def initialize(paint)
    @paint = paint
  end

  # keeping original representation
  def output_image
    @paint.each do |brush|
      puts brush.join
    end
  end

  def blurred
    # building array for extracting coordinates for ones
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

end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

puts "Original image: "
image.output_image

# applying blurred method

puts "Blurred image: "
image.blurred
image.output_image
