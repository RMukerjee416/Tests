class Image

  def initialize (paint)
    @paint = paint
  end

  def output_image
    @paint.each do |brush|
    puts brush.join
    end
  end

end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.output_image