require 'rspec'
require './lib/convert_hash_syntax'

RSpec.describe 'ConvertHashSyntax' do
  example 'convert_hash_syntax' do
    old_syntax = <<-TEXT
      {
        :name => 'Alice',
        :age=>20,
        :gender  =>  :female
      }
    TEXT
    expected = <<-TEXT
      {
        name: 'Alice',
        age: 20,
        gender: :female
      }
    TEXT
    expect(convert_hash_syntax(old_syntax)).to eq expected
  end
end
