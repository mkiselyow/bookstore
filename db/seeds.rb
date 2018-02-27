AdminUser.create!(email: ACTIVE_ADMIN_LOGIN, password: ACTIVE_ADMIN_PASSWORD, password_confirmation: ACTIVE_ADMIN_PASSWORD) if Rails.env.development? || Rails.env.test?
password = "foobarfoobar"
FactoryBot.create(:customer, password: password, password_confirmation: password)