require 'diary_entry'

RSpec.describe DiaryEntry do
  it "Contents Method" do
    diary_entry = DiaryEntry.new("Title 1", "Contents")
    expect(diary_entry.title).to eq "Title 1"
    expect(diary_entry.contents).to eq "Contents"
  end
  it "Returns the word count of contents" do
    diary_entry = DiaryEntry.new("title_1", "dear diary today i eat a sandwich")
    expect(diary_entry.count_words).to eq 7
  end
  it "Returns the reading time based on contents and wpm" do
    diary_entry = DiaryEntry.new("title_1", "words " * 20)
    expect(diary_entry.reading_time(10)).to eq 2
  end
  it "Returns a segment of the entry based on time availible" do
    diary_entry = DiaryEntry.new("title_1", "dear diary today i eat a sandwich")
    expect(diary_entry.reading_chunk(2,2)).to eq "dear diary today i"
  end  

end