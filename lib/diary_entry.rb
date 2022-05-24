class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    # Returns the title as a string
    return @title
  end

  def contents
    # Returns the contents as a string
    return @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split(" ").length
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    return count_words / wpm
  end

    def reading_chunk(wpm, minutes)
    counter = 0
    chunk = [] 
      @contents.split(" ").each do |word|
        # p word
        chunk.push(word)
        counter = counter + 1
        # p chunk
        if counter == (minutes * wpm)
          return chunk.join(" ")
          exit
        end
      
      end 
  end
end