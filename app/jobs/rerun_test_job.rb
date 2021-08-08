class RerunTestJob < ApplicationJob
  queue_as :default
  Rails.app_class.load_tasks
  def perform
    rake_rask = Rake::Task['rerun_test:run_test'].invoke
    Rails.logger.info "RAKE TASK #{rake_rask}"
  end
end
