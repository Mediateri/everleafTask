
require 'rails_helper'
RSpec.feature "user management function", type: :feature do
 background do
   User.create!(name: "k", email: 'meddy@gmail.Com',  password: '123456')
   visit  root_path
   #click_on 'Login'
   fill_in  'Email' ,  with: 'meddy@gmail.Com'
   fill_in  'Password' ,  with: '123456'
   click_on  'Log in'
 end
 scenario "Test number of users" do
   User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
   @user = User.all.count
   expect(@user).to eq 2
 end
 	
	 scenario "Test user list" do
   user=User.all
   assert user
    
 end
 scenario "Test user creation" do
   User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456', role: 'false')
   user=User.last
   expect(user.name).to match("paul")
 end
 scenario "Test user details" do
   @user= User.create!(name: 'k', email: 'k@gmail.com', password: '123456')
   visit admin_user_path(id: @user.id)
   expect(page).to have_content('k@gmail.com')
 end
 scenario 'Test user Deletion' do
   User.create!(name: 'mediateur', email: 'p@gmail.com', password: '123456')
   @user = User.last
   
    assert @user.destroy
 end
end


