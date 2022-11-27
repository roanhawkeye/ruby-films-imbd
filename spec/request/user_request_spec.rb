require 'rails_helper'

describe '#index', :type => :request do

  context 'when users available' do
    before { get '/users' }
    it { expect(response).to have_http_status(:ok) }
  end

end

describe '#create', :type => :request do
  context 'when valid' do
    
    before {
      post '/users', :params => { :user_form => { 
        first_name: 'Daniel', 
        last_name: 'Martinez' , 
        role: 'Admin', 
        password: 'password', 
        email: 'sample@sample.com' } 
        } 
    }
    
    it { expect(response).to have_http_status(302)}

    it 'increase users count' do
      expect {
        post '/users', :params => { :user_form => { 
          first_name: 'Daniel', 
          last_name: 'Martinez' , 
          role: 'Admin', 
          password: 'password', 
          email: 'sample@sample.com' } 
        } 
      }.to change{ User.count }.by(1)
    end
  end

  context 'when not valid' do 
    
    before {
      post '/users', :params => { :user_form => { 
        first_name: 'Daniel', 
        last_name: 'Martinez' , 
        role: '', 
        password: '', 
        email: 'sample@sample.com' } 
        } 
    }
    
    it { expect(response).to have_http_status(:unprocessable_entity) }

    it 'does not increase User count' do 
      expect {
        post '/users', :params => { :user_form => { 
          first_name: 'Daniel', 
          last_name: 'Martinez' , 
          role: '', 
          password: '', 
          email: 'sample@sample.com' } 
        } 
      }.to change{ User.count }.by(0)
    end
  end
end
