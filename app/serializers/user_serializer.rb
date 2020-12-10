class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id,:nickname,:email,:following,:followers,:photo
  attr_accessor :photo
  has_many :user_habits
  

  def following
    make_arr_with_photo(object.following)
  end


  def followers
    make_arr_with_photo(object.followers)
  end
  
  def photo
   url_for(object.avatar) if object.avatar.attached?
  end

  def make_arr_with_photo(arr)
    user_arr=[]
    arr.each do |cur|
      user=User.find(cur.id)
      hash={}
      hash[:id]=cur.id
      hash[:nickname]=cur.nickname
      hash[:email]=cur.email
      hash[:photo]=nil
        if user.avatar.attached?
          hash[:photo]=url_for(user.avatar)
        end
      user_arr << hash
    end
    return user_arr


  end

end