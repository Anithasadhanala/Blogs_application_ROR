# Seed users
users = [
  { username: 'joh_doe', password_digest: '12fgfgdfs3', email: 'joh@example.com' },
  { username: 'jan_doe', password_digest: 'password123', email: 'jae@example.com' },
  { username: 'ale_smith', password_digest: 'password123',email: 'alx@example.com' },
]

users.each do |user|
  User.create!(user)
end
