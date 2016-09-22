require 'pathname'

module RSpec
  module WithDirectory
    private

    def with_directory(directory)
      current = Dir.pwd
      target  = Pathname.new(Dir.pwd).join(directory)

      Dir.chdir(target)
      yield
    ensure
      Dir.chdir(current)
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::WithDirectory
end
