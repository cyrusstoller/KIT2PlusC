if Rails.env.test?
  ENV["ADMIN_USER"] = "admin"
  ENV["ADMIN_PASS"] = "pass"
end