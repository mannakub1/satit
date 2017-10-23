# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  gpa             :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  iden_number     :string
#  code_number     :string
#  room_state      :boolean
#  blood           :string
#  birthdate       :datetime
#  address         :string
#  call            :string
#  zip_code        :string
#  ability         :string
#  nationality     :string
#  ethnicity       :string
#  district        :string
#  parish          :string
#  city            :string
#  prefix          :string
#  delete_status   :string
#  username        :string
#  password_digest :string
#  image           :string

FactoryGirl.define do
  factory :student do

    iden_number { Faker::Number.number(7) }
    code_number { Faker::Number.number(7) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { "#{code_number}" }
    password { "#{code_number}" }
    

    # trait :with_point do
    #   point { Faker::Number.between(1000, 5000) }
    # end

    # trait :with_addresses do
    #   transient do
    #     address_count { Faker::Number.between(2, 3) }
    #   end

      # after(:create) do |buyer, evaluator|
      #   # address_action = Buyer::AddressAction.new(buyer)
      #   # address_params_list = FactoryGirl.attributes_for_list(:address, evaluator.address_count)
      #   # address_params_list.map do |address_params|
      #   #   address_action.create(address_params)
      #   # end
      # end
  end
end