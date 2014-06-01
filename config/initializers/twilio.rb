path = File.join(Rails.root, "config/twilio.yml")
TWILIO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid' => ENV['TWILIO_ACCOUNT_SID'], 'from' => '+16096442390', 'token' => ENV['TWILIO_AUTH_TOKEN']}
