class Seed
 def self.start
   new.generate
 end

 def generate
   work  = Tag.create(title: "work")
   school = Tag.create(title: "school")
   home = Tag.create(title: "home")
   chores = Tag.create(title: "chores")
   groceries = Tag.create(title: "groceries")
   pets = Tag.create(title: "pets")
   shopping = Tag.create(title: "shopping")
   urgent = Tag.create(title: "urgent")
   kids = Tag.create(title: "kids")

   list1 =  List.create(title: "List1")
   list2 = List.create(title: "List2")
   list3 = List.create(title: "List3")
   list4 = List.create(title: "List4")
   list5 = List.create(title: "List5")

  list1.tasks.create(title: "task1", notes: "task1 notes", due_date: Date.new(2015, 9, 01), start_date: Date.new(2015, 8, 12)).tags << urgent
  list1.tasks.create(title: "task2", notes: "task2 notes", due_date: Date.new(2015, 10, 01), completed: true, start_date: Date.new(2015, 8, 12)).tags << kids
  list1.tasks.create(title: "task3", notes: "task3 notes", due_date: Date.new(2015, 11, 01), completed: true, start_date: Date.new(2015, 8, 12)).tags << school
  list1.tasks.create(title: "task4", notes: "task4 notes", due_date: Date.new(2015, 12, 9), start_date: Date.new(2015, 8, 12)).tags << work
  list1.tasks.create(title: "task5", notes: "task5 notes", due_date: Date.new(2015, 9, 12), start_date: Date.new(2015, 9, 01)).tags << home


  list2.tasks.create(title: "task1", notes: "task1 notes", due_date: Date.new(2015, 9, 01), start_date: Date.new(2015, 8, 12)).tags << pets
  list2.tasks.create(title: "task2", notes: "task2 notes", due_date: Date.new(2015, 9, 02), completed: true, start_date: Date.new(2015, 8, 12)).tags << kids
  list2.tasks.create(title: "task3", notes: "task3 notes", due_date: Date.new(2015, 11, 01), completed: true, start_date: Date.new(2015, 9, 03)).tags << school
  list2.tasks.create(title: "task4", notes: "task4 notes", due_date: Date.new(2015, 9, 03), start_date: Date.new(2015, 8, 12)).tags << work
  list2.tasks.create(title: "task5", notes: "task5 notes", due_date: Date.new(2015, 9, 03), start_date: Date.new(2015, 9, 03)).tags << home

  list3.tasks.create(title: "task1", notes: "task1 notes", due_date: Date.new(2015, 12, 01), start_date: Date.new(2015, 12, 01)).tags << groceries
  list3.tasks.create(title: "task2", notes: "task2 notes", due_date: Date.new(2015, 12, 01), completed: true, start_date: Date.new(2015, 10, 19)).tags << kids
  list3.tasks.create(title: "task3", notes: "task3 notes", due_date: Date.new(2015, 9, 01), completed: true, start_date: Date.new(2015, 9, 03)).tags << school
  list3.tasks.create(title: "task4", notes: "task4 notes", due_date: Date.new(2015, 9, 03), start_date: Date.new(2015, 8, 14)).tags << work
  list3.tasks.create(title: "task5", notes: "task5 notes", due_date: Date.new(2015, 10, 19), start_date: Date.new(2015, 8, 12)).tags << home

  list4.tasks.create(title: "task1", notes: "task1 notes", due_date: Date.new(2015, 10, 19), start_date: Date.new(2015, 8, 12)).tags << urgent
  list4.tasks.create(title: "task2", notes: "task2 notes", due_date: Date.new(2015, 9, 01), completed: true, start_date: Date.new(2015, 8, 12)).tags << kids
  list4.tasks.create(title: "task3", notes: "task3 notes", due_date: Date.new(2015, 9, 03), completed: true, start_date: Date.new(2015, 8, 12)).tags << school
  list4.tasks.create(title: "task4", notes: "task4 notes", due_date: Date.new(2015, 10, 19), start_date: Date.new(2015, 9, 03)).tags << work
  list4.tasks.create(title: "task5", notes: "task5 notes", due_date: Date.new(2015, 11, 12), start_date: Date.new(2015, 9, 03)).tags << shopping

  list5.tasks.create(title: "task1", notes: "task1 notes", due_date: Date.new(2015, 9, 01), start_date: Date.new(2015, 10, 19)).tags << urgent
  list5.tasks.create(title: "task2", notes: "task2 notes", due_date: Date.new(2015, 9, 03), completed: true, start_date: Date.new(2015, 8, 12)).tags << kids
  list5.tasks.create(title: "task3", notes: "task3 notes", due_date: Date.new(2015, 10, 19), completed: true, start_date: Date.new(2015, 8, 12)).tags << school
  list5.tasks.create(title: "task4", notes: "task4 notes", due_date: Date.new(2015, 9, 01), start_date: Date.new(2015, 8, 14)).tags << pets
  list5.tasks.create(title: "task5", notes: "task5 notes", due_date: Date.new(2015, 12, 01), start_date: Date.new(2015, 8, 14)).tags << home

 end
end

Seed.start
