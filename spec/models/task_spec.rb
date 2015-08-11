require 'rails_helper'

RSpec.describe Task, type: :model do
  it {should validate_presence_of :title}
  it {should validate_presence_of :start_date}
  it {should belong_to :list}

  it 'does not allow the user to create a task with a start_date before the current date' do
    task = Task.create(title: 'Groceries', notes: 'bananas', start_date: Date.new(2015, 01, 31))
    task1 = Task.create(title: 'School', notes: 'homework', start_date: Date.new(2015, 9, 30))

    expect(task).not_to be_valid
    expect(task.errors.messages[:start_date][0]).to eq("can't be in the past")

    expect(task1).to be_valid
  end

  it 'does not allow the user to create a task with a due_date before the current date' do
    task = Task.create(title: 'Shopping', notes: 'clothes', due_date: Date.new(2015, 01, 31), start_date: Date.new(2015, 9, 30))
    task1 = Task.create(title: 'Yardwork', notes: 'Mow lawn', due_date: Date.new(2015, 9, 30), start_date: Date.new(2015, 9, 30))

    expect(task).not_to be_valid
    expect(task.errors.messages[:due_date][0]).to eq("can't be in the past")

    expect(task1).to be_valid
  end

end
