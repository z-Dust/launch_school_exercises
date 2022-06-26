# class TextAnalyzer
#   def process
#     yield(File.read('sample_text.txt'))
#   end
# end

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs"  }
analyzer.process { |text| puts "#{text.split("\n").count} lines"  }
analyzer.process { |text| puts "#{text.split.size} words"  }
