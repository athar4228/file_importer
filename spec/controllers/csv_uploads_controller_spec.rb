require 'rails_helper'

RSpec.describe CsvUploadsController, type: :controller do

  describe "GET /csv_uploads/new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template :new
    end
  end

  describe "POST /csv_uploads" do

  let(:valid_file) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/valid_people.csv')), 'text/csv') }
  let(:invalid_file) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/files/invalid_people.txt')), 'txt') }

    it "redirects with 302 status code" do
      post :create, params: { csv_upload: {file: valid_file } }
      expect(response.status).to eq(302)
      expect(response.status).to redirect_to(new_csv_upload_path)
    end

    it "render new partial with 200 status code" do
      post :create, params: { csv_upload: {file: invalid_file } }
      expect(response.status).to render_template(:new)
    end
  end

end
