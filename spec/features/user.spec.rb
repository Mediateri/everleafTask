
require 'rails_helper'
RSpec.feature "user management function", type: :feature do
 background do
   User.create!(name: "kavuna", email: 'meddy@gmail.Com',  password: '123456')
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
   User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
   visit admin_users_path
   expect(page ).to  have_content  'kavuna'
   expect(page ).to  have_content  'paul'
 end
 scenario "Test user creation" do
   User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
   visit admin_users_path
   expect(page ).to  have_content  'kavuna'
 end
 scenario "test enable user creation page" do
   visit admin_users_path
   expect(page ).to  have_content  'kavuna'
 end
 scenario "Test user details" do
   @user= User.create!(name: 'kavuna', email: 'kavuna@gmail.com', password: '123456')
   visit admin_user_path(id: @user.id)
   expect(page).to have_content('kavuna@gmail.com')
   expect(page).to have_content('admin')
 end
 scenario "Test task updating" do
   @user = User.first
   visit edit_admin_user_path(id: @user.id)
   fill_in 'Name', with: 'name update'
   click_on 'signup'
   visit admin_users_path
   expect(page).to have_content('name update')
 end
 scenario 'Test user Deletion' do
   User.create!(name: 'mediateur', email: 'p@gmail.com', password: '123456')
   @user = User.last
   @user.destroy
   # expect(page).to have_content('testtesttest')
   # click_on 'Destroy'
   visit users_path
   expect(page).not_to have_content('mediateur')
 end
end


