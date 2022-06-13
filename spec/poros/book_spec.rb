require 'rails_helper'

RSpec.describe Book do
  it 'exists and has readable attributes' do
    raw = File.read('spec/fixtures/handrolled/book.json')
    data = JSON.parse(raw, symbolize_names: true)

    book = Book.new(data)

    expect(book).to be_a Book
    expect(book.isbm).to be_an Array
    expect(book.isbn.first).to eq("0517215039")
    expect(book.title).to eq("Denver")

    expect(book.publisher).to be_an Array
    expect(book.publisher.first).to eq("Crescent Books")
  end
end