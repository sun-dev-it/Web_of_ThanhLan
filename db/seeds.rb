#=begin
Snapshot.delete_all
User.delete_all

# Tạo admin
user = User.create!(name: "Thanh Lan", email: "admin@gmail.com", password: "090502", password_confirmation: "090502", admin: true)
avatar_path = Rails.root.join("app", "assets", "images", "avatar_user", "avt.png")
avatar_file = File.open(avatar_path)
user.avatar.attach(io: avatar_file, filename: "avt.png", content_type: 'image/png')