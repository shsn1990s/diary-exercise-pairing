require 'diary_entry'

class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    @entries.push(entry)
  end

  def all
    # Returns a list of instances of DiaryEntry
    return @entries
  end

  def count_words
    count_of_words = 0
    @entries.each do |entry|
      count_of_words = count_of_words + entry.count_words
    end
    return count_of_words
  end

  def reading_time(wpm) 
    total_reading_time = 0
    @entries.each do |entry|
      total_reading_time = total_reading_time + entry.reading_time(wpm)
    end
    return total_reading_time

  end

  def find_best_entry_for_reading_time(wpm, minutes)
    time_available = wpm * minutes
    best_choice = 0
    selected_entry = nil
    @entries.each do |entry|
      #binding.irb
      if entry.count_words > best_choice
        best_choice = entry.count_words
        selected_entry = entry
      end
    end
    return selected_entry
  end
end