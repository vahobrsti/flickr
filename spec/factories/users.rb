FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Crypto.md5}
    reset_password_token {Faker::Bitcoin.address}
    reset_password_sent_at {Faker::Date.between(2.days.ago, Date.today)}
    remember_created_at {Faker::Date.new}
    sign_in_count {Faker::Number.number(4)}
    current_sign_in_at {Faker::Date.between(2.days.ago, Date.today)}
    last_sign_in_at {Faker::Date.between(2.days.ago, Date.today)}
    current_sign_in_ip {Faker::Internet.ip_v4_address}
    last_sign_in_ip  {Faker::Internet.public_ip_v4_address}

  end
end