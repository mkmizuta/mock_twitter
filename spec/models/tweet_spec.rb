require 'spec_helper'

describe Tweet do

  describe "validations" do

    it "must have a body" do
      expect(Tweet.new(body: nil, author: "Mel")).to_not be_valid
    end

    it "counts its characters" do
      expect(Tweet.new(body: "a" * 41, author: "Mel").character_count).to eq 41
    end

    it "can have 140 characters in body" do
      expect(Tweet.new(body: "a" * 140, author: "Mel")).to be_valid
    end

    it "can't have 141 characters in body" do
      expect(Tweet.new(body: "a" * 141, author: "Mel")).to_not be_valid
    end

    it "must have an author" do
      expect(Tweet.new(body: "Hello, World!", author: nil)).to_not be_valid
    end
  end
end
