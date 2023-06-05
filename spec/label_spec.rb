require './book/label'

describe Label do
  context 'Test for label' do
    before :each do
      @label = Label.new('New Title', 'Red')
    end

    it 'Test for attributes' do
      expect(@label).to have_attributes(title: 'New Title', color: 'Red')
    end

    it 'Test for add item method' do
      item = double('Item')
      allow(item).to receive(:publish_date) { '2020-02-02' }
      allow(item).to receive(:label=)
      @label.add_item(item)
      expect(@label.items[0].publish_date).to eq('2020-02-02')
    end
  end
end
