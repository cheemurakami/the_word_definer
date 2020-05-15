require "rspec"
require "pry"
require "word"

describe("#Word") do
  
  before(:each) do
    Word.clear()
  end

  describe("initialize") do
    it("creates a new word with a name") do
      word1 = Word.new({:name => "define", :id => nil})
      expect(word1.name).to eq("define")
    end
  end

  describe(".all") do
    it("shows shows an empty array when there are no words") do
      expect(Word.all).to eq([])
    end
    it("shows all of the words") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      expect(Word.all).to eq([word1])
    end
  end

  describe("#save") do
    it("saves a word in a hash") do
      word2 = Word.new({:name => "meet", :id => nil})
      word2.save
      expect(Word.all).to eq([word2])
    end
    it("saves words in a hash") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      word2 = Word.new({:name => "meet", :id => nil})
      word2.save
      expect(Word.all).to eq([word1, word2])
    end
  end

  describe(".clear") do
    it("clears words in a hash") do
      Word.clear
      expect(Word.all).to eq([])
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another album") do
      word1 = Word.new({:name => "define", :id => nil})
      word2 = Word.new({:name => "define", :id => nil})
      expect(word1).to(eq(word2))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      expect(Word.find(word1.id)).to eq(word1)
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      word1.update("defined")
      expect(word1.name).to eq("defined")
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      word2 = Word.new({:name => "meet", :id => nil})
      word2.save
      word1.delete
      expect(Word.all).to eq([word2])
    end
  end

end