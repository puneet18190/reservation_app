Restaurant.destroy_all
restaurant1 = Restaurant.create!(name: 'Zomato', email: 'Zomato@gmail.com', phone: '9876543210')
restaurant1.shifts.create!(name: 'morning', start_at: 32400, end_at: 46800)
restaurant1.shifts.create!(name: 'evening', start_at: 64800, end_at: 82800)
restaurant1.tables.create!(name: 'table_1', min_capacity: 1, max_capacity: 4)
restaurant1.tables.create!(name: 'table_2', min_capacity: 4, max_capacity: 8)

restaurant2 = Restaurant.create!(name: 'Swiggy', email: 'swiggy@gmail.com', phone: '997543210')
restaurant2.shifts.create!(name: 'morning', start_at: 32400, end_at: 46800)
restaurant2.shifts.create!(name: 'evening', start_at: 64800, end_at: 82800)
restaurant2.tables.create!(name: 'table_1', min_capacity: 1, max_capacity: 4)
restaurant2.tables.create!(name: 'table_2', min_capacity: 5, max_capacity: 10)

Guest.destroy_all
guest1 = Guest.create!(name: 'Puneet Gupta', email: 'puneet@gmail.com')
guest2 = Guest.create!(name: 'Sumeet Gupta', email: 'sumeet@gmail.com')