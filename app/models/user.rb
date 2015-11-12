class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :bookings

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def put_picture(size)
    if self.picture.present?
      self.picture(size)
    else
      "avatar.png"
    end
  end

  def self.find_for_facebook_oauth(auth)
    user = User.find_by_email(auth.info.email)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_create unless user

    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]  # Fake password for validation
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.picture = process_uri(auth.info.image)
    user.token = auth.credentials.token
    user.token_expiry = Time.at(auth.credentials.expires_at)
    user.save

    user
  end

  def self.process_uri(uri)
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.to_s
  end
end
