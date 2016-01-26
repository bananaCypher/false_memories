require 'test_helper'
require 'generators/false_memories/false_memories_generator'

class FalseMemoriesGeneratorTest < Rails::Generators::TestCase
  tests FalseMemoriesGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
