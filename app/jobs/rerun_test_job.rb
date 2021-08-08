class RerunTestJob < ApplicationJob
  queue_as :default
  Rails.app_class.load_tasks
  def perform
    Rake::Task['rerun_test:run_test'].invoke
  end
end
