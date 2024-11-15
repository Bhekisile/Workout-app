# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Listing Members' do
  before do
    @john = User.create!(first_name: 'John',
                         last_name: 'Doe',
                         email: 'john@example.com',
                         password: 'password')

    @sarah = User.create!(first_name: 'Sarah',
                          last_name: 'Jones',
                          email: 'sarah@example.com',
                          password: 'password')
  end

  scenario 'shows a lot of registered members' do
    visit '/'

    expect(page).to have_content('List of Members')
    expect(page).to have_content(@john.first_name)
    expect(page).to have_content(@sarah.first_name)
  end
end
