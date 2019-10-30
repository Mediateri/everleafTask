

require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  background do
    User.create!(name: "k", email: 'meddy@gmail.Com',  password: '123456', role: 'true')
    visit  root_path
    #click_on 'Login'
    fill_in  'Email' ,  with: 'meddy@gmail.Com'
    fill_in  'Password' ,  with: '123456'
    click_on  'Log in'
  end
    scenario "Test task list" do
        visit  root_path 
        fill_in  'Email' ,  with: 'Foo@gmail.Com' 
        fill_in  'Password' ,  with: '123456' 
        click_on  'Log in'
        expect(page ).to have_text('Tasks') 
        click_on 'New Task'
        fill_in  'Tittle' ,  with: 'grettings' 
        fill_in  'Content' ,  with: 'testtesttest'
        click_on 'Create Task'
        click_on 'Back'
        click_on 'New Task'
        fill_in  'Tittle' ,  with: 'gre' 
        fill_in  'Content' ,  with: 'sample'
        click_on 'Create Task'
        click_on 'Back'
        expect(page).to have_content 'testtesttest'
        expect(page).to have_content 'sample'
    end  
  


  scenario "Test task creation" do
    visit  root_path 
    fill_in  'Email' ,  with: 'Foo@gmail.Com' 
    fill_in  'Password' ,  with: '123456' 
    click_on  'Log in'
    expect(page ).to have_text('Tasks') 
    click_on 'New Task'
    fill_in  'Tittle' ,  with: 'grettings' 
    fill_in  'Content' ,  with: 'testtesttest'
    click_on 'Create Task'
    expect(page).to have_text('Task was successfully created.')

  end

  scenario "Test task details" do
    visit  root_path 
    fill_in  'Email' ,  with: 'Foo@gmail.Com' 
    fill_in  'Password' ,  with: '123456' 
    click_on  'Log in'
    expect(page ).to have_text('Tasks') 
    click_on 'New Task'
    fill_in  'Tittle' ,  with: 'grettings' 
    fill_in  'Content' ,  with: 'testtesttest'
    click_on 'Create Task'
    click_on 'Back'
    click_on 'Show'
    expect(page).to have_content 'testtesttest'
  end
  scenario 'task ascending buy date' do
    task=Task.all
    assert task.order('created_at DESC')
  end
  scenario 'task ascending buy priority' do
    task=Task.all
     # status is column that is holding priority High,medium and finally low
    assert task.order('status DESC')
  end
  scenario 'task must be true' do
    visit  root_path 
    fill_in  'Email' ,  with: 'Foo@gmail.Com' 
    fill_in  'Password' ,  with: '123456' 
    click_on  'Log in'
    expect(page ).to have_text('Tasks') 
    click_on 'New Task'
    fill_in  'Tittle' ,  with: '' 
    fill_in  'Content' ,  with: 'testtesttest'
    click_on 'Create Task'
    expect(page).to have_text('1 error prohibited this task from being saved:')
  end
end