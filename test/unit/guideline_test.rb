require 'test_helper'

class GuidelineTest < ActiveSupport::TestCase


	test "that a guideline requires content" do 
		guideline = Guideline.new
		assert !guideline.save
		assert !guideline.errors[:content].empty?
	end

	test "that a guidelines's content is at least 2 letters long" do
		guideline=Guideline.new
		guideline.content="h"
		assert !guideline.save
		assert !guideline.errors[:content].empty?
	end

	test "that a guideline has a user id" do
		guideline=Guideline.new
		guideline.content="Hello"
		assert !guideline.save
		assert !guideline.errors[:user_id].empty?

	end

	test "that a guideline requires a title" do
		guideline=Guideline.new
		assert !guideline.save
		assert !guideline.errors[:title].empty?

	end

	test "that a guidelines's title is at least 2 letters long" do
		guideline=Guideline.new
		guideline.title="h"
		assert !guideline.save
		assert !guideline.errors[:title].empty?
	end

	test "that a guideline requires a hospital" do
		guideline=Guideline.new
		assert !guideline.save
		assert !guideline.errors[:hospital].empty?

	end

	test "that a guidelines's hospital is at least 2 letters long" do
		guideline=Guideline.new
		guideline.hospital="h"
		assert !guideline.save
		assert !guideline.errors[:hospital].empty?
	end

	test "that a guideline's title and hospital combination is unique" do
		guideline=Guideline.new
		guideline.title = guidelines(:one).title
		guideline.hospital = guidelines(:one).hospital
		assert !guideline.save
		assert !guideline.errors[:title || :hospital].empty?

	end





end
