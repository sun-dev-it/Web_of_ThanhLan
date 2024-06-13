class User < ApplicationRecord
    has_one_attached :avatar
    # avatar có thể trống
    before_save :set_default_avatar
    has_many :snapshots, dependent: :destroy



    has_many :active_relationships, class_name:     "Relationship", 
                                    foreign_key:    "follower_id", 
                                    dependent:      :destroy

    has_many :passive_relationships, class_name:    "Relationship", 
                                     foreign_key:   "followed_id",
                                     dependent:      :destroy
    has_many :following, through:  :active_relationships, source: :followed
    has_many :followers, through:  :passive_relationships, source: :follower



    before_save {self.email = email.downcase}
    validates :name, presence: true, length: {maximum: 60}
    validates :email, presence: true, length: {maximum: 255},
                      uniqueness: true
    has_secure_password
    validates :password, presence: true, length: {maximum: 10}, allow_nil:true

    def User.digest(string)
        const = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.const
        BCrypt::Password.create(string, cost: cost)
    end

    def feed
        Snapshot.where("user_id IN (?) OR user_id =?", following_ids, id)
    end

    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        following.delete(other_user)
    end

    def following?(other_user)
        following.include?(other_user)
    end

    def set_default_avatar
        unless avatar.attached?
          image_path = Rails.root.join("app", "assets", "images", "avatar_default", "avt.png")
          image = File.open(image_path)
          avatar.attach(io: image, filename: "default_avatar.png", content_type: 'image/png')
        end
    end
end
