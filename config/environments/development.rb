Rails.application.configure do
  # Reloads the application code on every request (ideal for development)
  config.cache_classes = false

  # Do not eager load code at boot in development
  config.eager_load = false

  # Show full error reports in development
  config.consider_all_requests_local = true

  # Check if caching is enabled (via caching-dev.txt)
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    # Enable caching and set cache store to memory
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store

    # Set HTTP headers for cached public files
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    # Disable caching if caching-dev.txt doesn't exist
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Local file storage for Active Storage (development use)
  config.active_storage.service = :local

  # Don't raise errors if mailer fails in development
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # Log deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Raise error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs
  config.active_record.verbose_query_logs = true

  # Use an evented file watcher for code reloading in development
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Raises error for missing translations (optional)
  # config.action_view.raise_on_missing_translations = true
end
