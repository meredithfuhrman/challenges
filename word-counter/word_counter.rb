
def get_words_from_file(file_name)
  content = File.open(file_name, 'r') { |file| file.read }
  content.downcase.split(" ").each {|word| word.gsub!(/[^a-zA-Z]/, '')}
end

def count_words(file_name)
  words = get_words_from_file(file_name)
  counts = {}

  words.each do |word|
    unless counts.has_key?(word)
      counts[word] = 0
    end
    counts[word] += 1
  end

  counts

end

def print_count(counts, num_word_to_show)
  stop_words = get_words_from_file("stop_words.txt")
  stop_words.each {|word| counts.delete(word)}
  sorted_counts = counts.sort_by {|pair| pair[1]}.reverse
  sorted_counts[0..num_word_to_show].each {|pair| puts "#{pair[0]}: #{pair[1]}"}
end


file_name = ARGV[0]
num_word_to_show = ARGV[1].to_i

counts = count_words(file_name)
print_count(counts, num_word_to_show)
