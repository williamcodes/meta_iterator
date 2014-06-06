require './iterator'
require './meta_iterator'

describe MetaIterator do 
  let(:iter1){Iterator.new([1,2])}
  let(:iter2){Iterator.new(['a','b','c'])}
  let(:iter3){Iterator.new(['a1','b2','c3','d4'])}
  let(:meta_iterator){MetaIterator.new([iter1,iter2,iter3])}

  context "#next" do 
    it 'returns the item and moves next' do
      expect(meta_iterator.next).to eq 1
      expect(meta_iterator.next).to eq 'a'
      expect(meta_iterator.next).to eq 'a1'
      expect(meta_iterator.next).to eq 2
      expect(meta_iterator.next).to eq 'b'
      expect(meta_iterator.next).to eq 'b2'
      expect(meta_iterator.next).to eq 'c'
      expect(meta_iterator.next).to eq 'c3'
      expect(meta_iterator.next).to eq 'd4'
      expect(meta_iterator.next).to eq nil
    end
  end

  context "#has_next?" do 
    it 'returns true when there is a next item' do
      expect(meta_iterator.has_next?).to eq true
    end
    it 'returns false when there is not a next item' do 
      9.times do
        meta_iterator.next
      end

      expect(meta_iterator.has_next?).to eq false
    end
  end
end
