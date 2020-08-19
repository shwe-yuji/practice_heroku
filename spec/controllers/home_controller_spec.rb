require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "index" do

    it 'render root_path' do
      get :index
      expect(response).to render_template root_path
    end

    it "has a 200 status code" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    let(:books) {Book.all}
    it "assigns books" do
      get :index
      expect(assigns(:books)).to eq books
    end
    
    let(:book) {Book.new}
    it "assigns book" do
      get :index
      expect(assigns(:book).attributes).to eq book.attributes
    end

  end
end