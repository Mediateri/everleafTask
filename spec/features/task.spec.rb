require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
    background  do 
        User.create!( email: 'Foo@gmail.Com',  password: '123456', name: "meddy" ) 
    end 
    scenario "Test task list" do
        visit  root_path 
        fill_in  'Email' ,  with: 'Foo@gmail.Com' 
        fill_in  'Password' ,  with: '123456' 
        click_on  'Log in'
        expect(page ).to have_text('Signed in successfully.') 
        click_on 'New Task'
        fill_in  'Tittle' ,  with: 'grettings' 
        fill_in  'Content' ,  with: 'testtesttest'
        click_on 'Create Task'
        expect(page).to have_content 'testtesttest'
    end  
  


  scenario "Test task creation" do
    visit  root_path 
    fill_in  'Email' ,  with: 'Foo@gmail.Com' 
    fill_in  'Password' ,  with: '123456' 
    click_on  'Log in'
    expect(page ).to have_text('Signed in successfully.') 
    click_on 'New Task'
    fill_in  'Tittle' ,  with: 'grettings' 
    fill_in  'Content' ,  with: 'testtesttest'
    click_on 'Create Task'
    expect(page).to have_text('Task was successfully created.')

  end

  scenario "Test task details" do

  end
end