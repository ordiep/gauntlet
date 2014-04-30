namespace :problems do
  task :run, :number do |t, args|
    full_number = args[:number].rjust(3, '0')
    sh "ruby -Ilib:test test/problem_#{full_number}_test.rb"
  end
end
