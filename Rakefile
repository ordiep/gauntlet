namespace :problems do
  task :run, :number do |t, args|
    full_number = args[:number].rjust(3, '0')
    sh "clear"
    sh "rspec spec/problem_#{full_number}_spec.rb --color --fail-fast"
  end
end
