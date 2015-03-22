class User < ActiveRecord::Base
  has_many :members
  has_many :meetups, through: :members

  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_by(provider: provider, uid: uid) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create(
      provider: auth.provider, #presence; inclusion?
      uid: auth.uid, #presence; format?
      email: auth.info.email, #presence; formatting
      username: auth.info.nickname, #presence
      avatar_url: auth.info.image
    )
  end
end
