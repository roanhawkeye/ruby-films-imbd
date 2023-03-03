class SyncMoviesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    MovieFetcher.call
  end
end
