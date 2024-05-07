class AccountSettings < ApplicationRecord
  validates :display_name, presence: true, length: { minimum: 5, maximum: 20 }
  validates :display_name,
            format: { with: /\A[a-zA-Z0-9]+\Z/,
                      message: ' is not a valid and must contain alpha-numeric characters' }
  validates :currency, inclusion: { in: %w[EUR USD GBP], message: '%<value>s is not a valid currency' }

  belongs_to :user
end
