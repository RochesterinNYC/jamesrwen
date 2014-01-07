require 'machinist/active_record'

User.blueprint do
  name { "Jon Snow" }
  username { "Lord Snow" }
  email { "tester@wall.com" }
  password { "passwordtesting1234" }
  password_confirmation { "passwordtesting1234" }
end

Project.blueprint do
  category { "PERSONAL" }
  title { "Test Project" }
  description { "Project object for testing" }
end
