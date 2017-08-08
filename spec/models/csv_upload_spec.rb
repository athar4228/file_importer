require 'rails_helper'

RSpec.describe CsvUpload, type: :model do

  let(:valid_file) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/valid_people.csv')), 'text/csv') }
  let(:invalid_file) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/invalid_people.txt')), 'txt') }

  it 'is valid' do
    csv_upload = CsvUpload.new
    csv_upload.file = valid_file

    expect(csv_upload.valid?).to be true
  end

  it 'is invalid without incorrect file type' do
    csv_upload = CsvUpload.new
    csv_upload.file = invalid_file

    expect(csv_upload.valid?).to be false
    expect(csv_upload.errors[:file]).to include "is not a valid CSV"
  end

  it 'is invalid without file' do
    csv_upload = CsvUpload.new

    expect(csv_upload.valid?).to be false
    expect(csv_upload.errors[:file]).to include "can't be blank"
  end
end
