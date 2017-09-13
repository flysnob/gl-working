require 'rasem'
# Drwaing helpers using the rasem gem
module DrawingHelpers
  def drawing_test
    img = Rasem::SVGImage.new(:width=>100, :height=>100) do
      circle 20, 20, 5
      circle 50, 50, 5
      line 20, 20, 50, 50
    end

    File.open('~/test/test.svg', 'w') do |f|
      img.write(f)
    end
  end
end
