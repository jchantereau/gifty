class Booking < ActiveRecord::Base

  monetize :amount_cents

  belongs_to :gift
  belongs_to :user

  validates_presence_of :gift, :friend_name

  validates :friend_email,        presence: true, unless: :friend_phone_number?
  validates :friend_phone_number, presence: true, unless: :friend_email?
  validates :voucher,             uniqueness: true

  before_validation :generate_token
  before_validation :generate_voucher

  def self.code_not_unique?(attribute_name, code)
    self.where(attribute_name => code).exists?
  end

  def check_date_validity
    if self.ends_on.to_date < Time.now.to_date
      self.still_valid = false
      self.save
    end
  end

  private

  def create_token
    # We use begin end because want to try generating a token ONCE and then if it does not work
    # we re-generate it
    # The idea is that we generate a token again and again and again until is unique
    begin
      code = SecureRandom.hex(6)
    end while self.class.code_not_unique?(:token, code)

    code
  end

  def create_voucher
    # We use begin end because want to try generating a token ONCE and then if it does not work
    # we re-generate it
    # The idea is that we generate a token again and again and again until is unique
    begin
      code = SecureRandom.uuid.gsub(/\D/) { rand(9).to_s }[0..5]
    end while self.class.code_not_unique?(:voucher, code)

    code
  end

  def generate_token
    return if token.present?
    self.token = create_token
  end

  def generate_voucher
    return if voucher.present?
    self.voucher = create_voucher
  end
end
