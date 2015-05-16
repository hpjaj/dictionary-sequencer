class DictionarySequencer

  def initialize
    @arr_of_arr = []
  end

  def sequence_dictionary(text_file)
    dictionary = File.read(text_file).split
    dictionary.each do |word|
      word_length = word.length
      range_of_indeces = word_length - 4
      if word_length >= 4
        (0..range_of_indeces).each do |index|
          piece = word.slice(index, 4)
          build_array_of_pairs(word, piece)
        end
      end
      puts word  # this is to watch the progress in the terminal
    end

    output_sequences
    output_words
  end

  private

  def build_array_of_pairs(word, piece)
    if @arr_of_arr.any? { |pair| pair[0] == piece }
      duplicate_pairs_index = @arr_of_arr.find_index { |pair| pair[0] == piece }
      @arr_of_arr.delete_at(duplicate_pairs_index)
    else
      @arr_of_arr << [piece, word]
    end
  end

  def output_sequences
    File.open('sequences.txt', 'w') do |file|
      @arr_of_arr.each do |pair|
        file.puts pair[0]
      end
    end
  end

  def output_words
    File.open('words.txt', 'w') do |file|
      @arr_of_arr.each do |pair|
        file.puts pair[1]
      end
    end
  end

end



# DictionarySequencer.new.sequence_dictionary('arrow.txt')
# DictionarySequencer.new.sequence_dictionary('dictionary.txt')