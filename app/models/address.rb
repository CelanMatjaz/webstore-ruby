class CountryValidator < ActiveModel::Validator
  def validate(record)
    if record.country == ''
      record.errors.add :base, 'Country must be selected'
      return
    end

    return if ISO3166::Country[record.country]

    record.errors.add :base, 'Provided country does not exist'
  end
end

class Address < ApplicationRecord
  validates :city, presence: true, length: { minimum: 1, maximum: 64 }
  validates :zip_code, presence: true, length: { minimum: 1, maximum: 10 }
  validates :street, presence: true, length: { minimum: 1, maximum: 128 }
  validates :house_number, presence: true, length: { minimum: 1, maximum: 10 }

  validates_with CountryValidator

  belongs_to :user
end
