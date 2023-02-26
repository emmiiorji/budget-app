require 'rails_helper'

RSpec.describe 'SplashScreens', type: :request do
  before(:each) { get root_path }

  context 'GET' do
    it 'returns okay status' do
      expect(response).to have_http_status(200)
    end

    it 'renders correct' do
      expect(response).to render_template('categories/splash_screen')
    end

    it 'includes correct placeholder text' do
      expect(response.body).to include('SIGN UP')
    end
  end
end
