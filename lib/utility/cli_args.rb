# frozen_string_literal: true

module Utility
  class CliArgs
    class << self
      def filepath
        initial_filepath = ARGV[0]

        return nil if initial_filepath.nil?

        File.expand_path(initial_filepath)
      end

      def theme
        ARGV[1]
      end
    end
  end
end
