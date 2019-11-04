

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
      User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
      user=User.first
      Task.create!(tittle: "grettings", content: 'testtesttest', user_id: user.id)
      Task.create!(tittle: 'gre', content: 'sample', user_id: user.id)
      task=Task.all
      assert task
      
    end  
  


  scenario "Test task creation" do
    User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
    user=User.first
    Task.create!(tittle: "grettings", content: 'testtesttest', user_id: user.id)
    user=Task.last
    expect(user.tittle).to match("grettings")

  end

  scenario "Test task details" do
    User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
    user=User.first
    @task=Task.create!(tittle: "grettings", content: 'testtesttest', user_id: user.id)
    expect(@task.tittle).to match("grettings")
     
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
    User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
    user=User.first
    task=Task.new(tittle: "grettings", content: 'testtesttest')
    expect(task).not_to be_valid
  end
  scenario "test task search by atached labels " do
    User.create!(name: 'paul', email: 'paul@gmail.com', password: '123456')
    user=User.first
    Label.create!(labeler: 'label1', user_id: user.id)
    Label.create!(labeler: 'label2', user_id: user.id)
    Label.create!(labeler: 'label3', user_id: user.id)
    @task = Task.new(tittle: "huh", content: 'hy', user_id: user.id)
    @label1 = Label.first
    @label2 = Label.last
    @task.labels = [@label1,@label2]
    @task.save
    @tas = Task.joins(:labels)
    .where("labels.title LIKE ?", "label1")
    assert @tas
  
  end
end