# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



u1 = User.new(name: "Joe", email: "joe@example.com", password: "password", role: "premium")
u1.skip_confirmation!
u1.save!

u2 = User.new(name: "Kelly", email: "kelly@example.com", password: "password", role: "premium")
u2.skip_confirmation!
u2.save!

u3 = User.new(name: "Mike", email: "mike@example.com", password: "password")
u3.skip_confirmation!
u3.save!

u4 = User.new(name: "Terry", email: "terry@example.com", password: "password")
u4.skip_confirmation!
u4.save!

all_users = [u1, u2, u3, u4]
premium_users = [u1, u2]

# public wikis
1.upto(20) do |n|
  u = all_users.sample
  w = Wiki.new(
  title: "Wiki title: #{n} -- by #{u.name} -- #{Faker::Book.title}", 
  body: "Wiki body: #{n} -- by #{u.name} -- #{Faker::Hipster.paragraph}",
  user_id: u.id
    )
  w.save!
end

# private wikis
1.upto(10) do |n|
  u = premium_users.sample
  w = Wiki.new(
  title: "Wiki title: #{n} -- by #{u.name} -- #{Faker::Book.title}", 
  body: "Wiki body: #{n} -- by #{u.name} -- #{Faker::Hipster.paragraph}",
  user_id: u.id,
  private: true
    )
  w.save!
end

u1 = User.new(name: "Admin", email: "admin@example.com", password: "password", role: "admin")
u1.skip_confirmation!
u1.save!


puts "*".center(40,"*")
puts 
puts "#{Wiki.count} all wikis created".center(40," ")
puts "#{Wiki.where(private: false).count} public wikis created".center(40," ")
puts "#{Wiki.where(private: true).count} private wikis created".center(40," ")
puts "#{User.standard.count} standard users created".center(40," ")
puts "#{User.premium.count} premium users created".center(40," ")
puts "#{User.admin.count} admin users created".center(40," ")
puts " Done seeding ".center(40," ")
puts 
puts "*".center(40,"*")




  # create_table "users", force: :cascade do |t|
  #   t.string   "name"
  #   t.string   "email",                  default: "", null: false
  #   t.string   "encrypted_password",     default: "", null: false
  #   t.string   "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.integer  "sign_in_count",          default: 0,  null: false
  #   t.datetime "current_sign_in_at"
  #   t.datetime "last_sign_in_at"
  #   t.inet     "current_sign_in_ip"
  #   t.inet     "last_sign_in_ip"
  #   t.string   "confirmation_token"
  #   t.datetime "confirmed_at"
  #   t.datetime "confirmation_sent_at"
  #   t.string   "unconfirmed_email"
  #   t.datetime "created_at",                          null: false
  #   t.datetime "updated_at",                          null: false
  #   t.integer  "role"
  #   t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  #   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  # end

  # create_table "wikis", force: :cascade do |t|
  #   t.string   "title"
  #   t.text     "body"
  #   t.boolean  "private"
  #   t.integer  "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["user_id"], name: "index_wikis_on_user_id", using: :btree
  # end

  # add_foreign_key "wikis", "users"
