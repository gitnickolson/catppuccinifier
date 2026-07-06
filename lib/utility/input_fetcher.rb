# frozen_string_literal: true

module Utility
  class InputFetcher
    THEME_OPTIONS = %w[latte frappe macchiato mocha].freeze

    class << self
      def fetch_filepath
        initial_filepath = CliArgs.filepath

        return initial_filepath if valid_file?(initial_filepath)

        prompt_for_filepath
      end

      def fetch_theme
        initial_choice = CliArgs.theme
        theme = theme_from_choice(initial_choice)

        return theme unless theme.nil?

        prompt_for_theme
      end

      private

      def prompt_for_filepath
        puts 'Please enter the path to the file you want to catppuccinify.'

        loop do
          print '> '

          filepath = File.expand_path($stdin.gets.chomp)
          return filepath if valid_file?(filepath)

          puts "This is not a valid text file. Please try again.\n"
        end
      end

      def prompt_for_theme
        print_theme_options

        loop do
          print '> '

          choice = $stdin.gets.chomp
          theme = theme_from_choice(choice)

          return theme unless theme.nil?

          puts "Please refrain from choosing anything but the four listed themes.\n"
        end
      end

      def theme_from_choice(choice)
        return nil if choice.nil?

        THEME_OPTIONS.find { it == choice.downcase } || theme_from_numeric_choice(choice)
      end

      def theme_from_numeric_choice(choice)
        numeric = choice.to_i
        THEME_OPTIONS[numeric - 1] if numeric.between?(1, 4)
      end

      def valid_file?(filepath)
        return false if filepath.nil?

        File.exist?(filepath) && !File.directory?(filepath)
      end

      def print_theme_options
        puts 'Please choose a Catppuccin theme:'
        THEME_OPTIONS.each_with_index { |theme, index| puts "#{index + 1}. #{theme.capitalize}" }
      end
    end
  end
end
