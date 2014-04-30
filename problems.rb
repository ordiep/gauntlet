module Gauntlet
  module Problems
  end
end

Dir.glob("#{File.join(File.dirname(__FILE__), "problems", "*.rb")}").each do |file|
  require file
end
