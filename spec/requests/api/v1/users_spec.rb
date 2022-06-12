require 'rails_helper'

RSpec.describe 'Users Endpoint' do
  it 'Posts a new user to the database' do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    payload = {
      "email": 'mydogskeeter@skeeter.dog',
      "password": "skeeter",
      "password_confirmation": "skeeter"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(payload)

    result = JSON.parse(response.body, symbolize_names: true)



  end
end