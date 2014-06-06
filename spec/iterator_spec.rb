require './iterator'

describe Iterator do 
  let(:iterator){Iterator.new([1,2])}
  context "#next" do 
    it 'returns the item and moves next' do
      expect(iterator.next).to eq 1
      expect(iterator.next).to eq 2
      expect(iterator.next).to eq nil
    end
  end

  context "#has_next?" do 
    it 'returns true when there is a next item' do
      expect(iterator.has_next?).to eq true
    end
    it 'returns false when there is not a next item' do 
      iterator.next
      iterator.next
      expect(iterator.has_next?).to eq false
    end
  end
end
