# {{PROBLEM}} Class Design Recipe
## 1. Describe the Problem
> As a user
> So that I can find the best diary entry to read in the time avalible 
> I want to see the entry that is the correct length (but not over) that i can read in that time. 


## 2. Design the Class Signature


```ruby
class Diary
  def initialize
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end

```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

# 1
diary_entry = DiaryEntry.new("title_1", "contents_1")
diary_entry.content # => "contents_1"

# 2
diary_entry = DiaryEntry.new("title_1", "contents_1")
diary_entry.title # => "title_1"

# 3
diary_entry = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
diary_entry.count_words # => 7

# 4
diary_entry = DiaryEntry.new("title_1", ("content" * 100)
diary_entry.reading_time(50) # => 2

# 5
diary_entry = DiaryEntry.new("title_1", "dear diary, today i eat a big sandwich")
diary_entry.reading_chunk(2,3) # => "dear diary, today i eat a"

# 6
diary = Diary.new
diary.all # => []

# 7 
diary = Diary.new
diaryentry = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
diary.add(diaryentry)
diary.all # => [diaryentry]

# 8
diary = Diary.new
diaryentry1 = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
diaryentry2 = DiaryEntry.new("title_2", "dear diary, today i ")
diary.add(diaryentry1)
diary.add(diaryentry2)
diary.count_words #=> 11

# 9
diary = Diary.new
diaryentry1 = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
diaryentry2 = DiaryEntry.new("title_2", "dear diary, today i ")
diary.add(diaryentry1)
diary.add(diaryentry2)
diary.reading_time(6) #=> 2

# 10
diary = Diary.new
diaryentry1 = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
diaryentry2 = DiaryEntry.new("title_2", "dear diary, today i ")
diary.add(diaryentry1)
diary.add(diaryentry2)
diary.find_best_entry_for_reading_time(6, 3) #=> diaryentry1

```


_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.