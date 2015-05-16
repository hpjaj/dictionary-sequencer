require_relative 'dictionary_sequencer'

RSpec.describe DictionarySequencer do

  before do
    DictionarySequencer.new.sequence_dictionary('arrow.txt')
  end

  it 'outputs six correct sequences' do
    sequences = File.read('sequences.txt').split
    expect( sequences ).to eq(["rrow", "rows", "carr", "rrot", "rots", "give"])
  end

  it 'outputs six correct words' do
    words = File.read('words.txt').split
    expect( words ).to eq(["arrows", "arrows", "carrots", "carrots", "carrots", "give"])
  end

end