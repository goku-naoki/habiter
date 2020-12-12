class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_one_attached :avatar
  attr_accessor :image

  has_many :user_habits
  has_many :habits, through: :habit_users
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
                                  # followerがfollowするヒと
  
  has_many :passive_relationships, class_name:  "Relationship",
  foreign_key: "followed_id",
  dependent:   :destroy
                                   # followedがfollowされた人
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  


    def follow(other_user)  #current_user.foo
      active_relationships.create(followed_id: other_user.id)
    end

    # ユーザーをアンフォローする
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
      following.include?(other_user)
    end

    def update_with_password(params, *options)
      params.delete(:current_password)

      if params[:password].blank?
          params.delete(:password)
          params.delete(:password_confirmation) if params[:password_confirmation].blank?
      end

      result = update(params, *options)

      clean_up_passwords
      result
    end


    def parse_base64(image)
      if image.present? || rex_image(image) == ''
        content_type = create_extension(image)
        contents = image.sub %r/data:((image|application)\/.{3,}),/, ''
        decoded_data = Base64.decode64(contents)
        filename = Time.zone.now.to_s + '.' + content_type
        File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
          f.write(decoded_data)
        end
      end
      attach_image(filename)
    end

  private

    def create_extension(image)
      content_type = rex_image(image)
      content_type[%r/\b(?!.*\/).*/]
    end

    def rex_image(image)
      image[%r/(image\/[a-z]{3,4})|(application\/[a-z]{3,4})/]
    end

    def attach_image(filename)
      avatar.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
      FileUtils.rm("#{Rails.root}/tmp/#{filename}")
    end
  
end
