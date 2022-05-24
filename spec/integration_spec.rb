require 'diary'
require 'diary_entry'

RSpec.describe "Integration" do
  context "when we add an entry to our diary" do
    it "returns the instance" do
      diary = Diary.new
      diaryentry = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
      diary.add(diaryentry)
      expect(diary.all).to eq([diaryentry])
    end  
  end

  context "when we add multiple entries to our diary" do
    it "returns all instances" do
      diary = Diary.new
      diaryentry = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
      diaryentry2 = DiaryEntry.new("title_2", "dear diary, today i cooked some steak")
      diary.add(diaryentry)
      diary.add(diaryentry2)
      expect(diary.all).to eq([diaryentry, diaryentry2])
    end  

    it "returns all instances" do
      diary = Diary.new
      diaryentry = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
      diaryentry2 = DiaryEntry.new("title_2", "dear diary, today i cooked some steak")
      diary.add(diaryentry)
      diary.add(diaryentry2)
      expect(diary.count_words).to eq(14)
    end
    
    it "returns the reading time for all entries" do
      diary = Diary.new
      diaryentry = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
      diaryentry2 = DiaryEntry.new("title_2", "dear diary, today i cooked some steak")
      diary.add(diaryentry)
      diary.add(diaryentry2)
      expect(diary.reading_time(6)).to eq(2)
    end

    it "finds the best entry for available reading time" do
      diary = Diary.new
      diaryentry = DiaryEntry.new("title_1", "dear diary, today i eat a sandwich")
      diaryentry2 = DiaryEntry.new("title_2", "dear diary, today i cooked some steak")
      diary.add(diaryentry)
      diary.add(diaryentry2)
      expect(diary.find_best_entry_for_reading_time(6, 3)).to eq(diaryentry)
    end
  end
end