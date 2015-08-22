Refile.configure do |config|
  # config.allow_uploads_to = ["cache"]
  # config.allow_downloads_from = :all
  # config.allow_origin = "*"
  # config.logger = Logger.new(STDOUT) unless ENV["RACK_ENV"] == "test"
  # config.mount_point = "attachments"
  config.automount = false
  # config.content_max_age = 60 * 60 * 24 * 365
  # config.types[:image] = Refile::Type.new(:image, content_type: %w[image/jpeg image/gif image/png])
end
