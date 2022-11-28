# frozen_string_literal: true

# lib/tasks/check_app.rake

namespace :check_app do
  desc 'Run rails best practices'

  task run: :environment do
    puts 'Running rails best practices!'
    puts `rails_best_practices`

    puts 'Running rubocritic!'
    puts `bundle exec rubycritic`

    puts 'Running tests and coverage!'
    puts `bundle exec rspec`

    puts 'Running Rubocop!'
    puts `bundle exec rubocop`
  end
end
