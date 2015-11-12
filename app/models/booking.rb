class Booking < ActiveRecord::Base
  belongs_to :gift
  belongs_to :user

  validates_presence_of :gift, :user, :friend_name

  validates :friend_email,        presence: true, unless: :friend_phone_number?
  validates :friend_phone_number, presence: true, unless: :friend_email?
  validates :code,                uniqueness: true

  before_validation :generate_code

  def self.token_not_unique?(token)
    self.where(code: token).exists?
  end

  private

  def create_code
    return code if code.present?

    # We use begin end because want to try generating a token ONCE and then if it does not work
    # we re-generate it
    # The idea is that we generate a token again and again and again until is unique
    begin
      token = SecureRandom.uuid.gsub(/\D/) { rand(9).to_s }[0..5]
    end while self.class.token_not_unique?(token)

    token
  end

  def generate_code
    return if code.present?
    self.code = create_code
  end
end
