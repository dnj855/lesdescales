# frozen_string_literal: true

task kill_postgres_connections: :environment do
  sh = <<~EOF
    ps xa \
      | grep postgres: \
      | grep "lesdescales_development" \
      | grep -v grep \
      | awk '{print $1}' \
      | sudo xargs kill
  EOF
  puts `#{sh}`
end

task 'db:drop' => :kill_postgres_connections
