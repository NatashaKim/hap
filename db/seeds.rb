
def seed
  reset_db
  create_users
  create_events
  create_votes
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users
  i = 0

  10.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    if i == 0
      user_data[:email] = "admin@email.com"
      user_data[:admin] = true
    end

    user = User.create!(user_data)
    puts "User created with id #{user.id}"
    i += 1
  end
end

def create_events
  10.times do
    user = User.all.sample
    event = user.events.create!(name: 'Some name', is_official: false)
    puts "event created with id #{event.id} by user with id #{event.user.id}"
  end
end

def create_votes
  events = Event.all

  events.each do |event|
    10.times do
      user = User.all.sample
      vote = event.votes.create!(user_id: user.id, is_slot: true, date: '2022-11-03', slot_start: '2022-11-03 15:30:00', slot_end: '2022-11-03 16:30:00')
      puts "Vote for event #{vote.event.id} created with id #{vote.id} by user with id #{vote.user.id}"
    end
  end
end

seed

#  users = [
#    {
#      email: "user1@gmail.com",
#      username: "user1",
#      admin: true,
#      password: "111111",
#    },
#    {
#      email: "user2@gmail.com",
#      username: "user2",
#      admin: false,
#      password: "222222",
#    },
#    {
#      email: "user3@gmail.com",
#      username: "user3",
#      admin: false,
#      password: "333333",
#    },
#    {
#      email: "user4@gmail.com",
#      username: "user4",
#      admin: false,
#      password: "444444",
#    },
#    {
#      email: "user5@gmail.com",
#      username: "user5",
#      admin: false,
#      password: "555555",
#    },
#  ]
# users.each do |us|
#    u = User.create(us)
#    puts "Some magic just craete a #{ u.username } with id #{ u.id }!"
# end
#
# events = [
#   {
#     user_id: "1",
#     name: "Марафон Гарри Поттера",
#     is_official: false,
#   },
#   {
#     user_id: "2",
#     name: "Поездка в Питер",
#     is_official: false,
#   },
#   {
#     user_id: "3",
#     name: "Созвон по проекту",
#     is_official: true,
#   },
#  ]
# events.each do |event|
#  e = Event.create(event)
#  puts "Some magic just create a #{ e.name } with id #{ e.id }!"
# end
#
# votes = [
#   {
#     user_id: "1",
#     event_id: "1",
#     is_slot: false,
#     date: "2022-11-01",
#   },
#   {
#     user_id: "1",
#     event_id: "1",
#     is_slot: false,
#     date: "2022-11-02",
#   },
#   {
#     user_id: "1",
#     event_id: "1",
#     is_slot: true,
#     date: "2022-11-03",
#     slot_start: "2022-11-03 15:30:00",
#     slot_end: "2022-11-03 16:30:00",
#   },
#   {
#     user_id: "2",
#     event_id: "2",
#     is_slot: false,
#     date: "2022-11-04",
#   },
#   {
#     user_id: "2",
#     event_id: "2",
#     is_slot: false,
#     date: "2022-11-05",
#   },
#   {
#     user_id: "2",
#     event_id: "2",
#     is_slot: true,
#     date: "2022-11-06",
#     slot_start: "2022-11-06 17:30:00",
#     slot_start: "2022-11-06 18:30:00",
#   },
#   {
#     user_id: "3",
#     event_id: "3",
#     is_slot: false,
#     date: "2022-11-07",
#   },
#   {
#     user_id: "3",
#     event_id: "3",
#     is_slot: false,
#     date: "2022-11-08",
#   },
#   {
#     user_id: "3",
#     event_id: "3",
#     is_slot: true,
#     date: "2022-11-09",
#     slot_start: "2022-11-09 19:30:00",
#     slot_start: "2022-11-09 20:30:00",
#   },
#  ]
# votes.each do |vote|
#  v = Vote.create(vote)
#  puts "Some magic just create a #{ v.date } with id #{ v.id }!"
# end
