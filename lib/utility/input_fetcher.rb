# frozen_string_literal: true

module Utility
  class InputFetcher
    THEME_OPTIONS = %w[Latte Frappe Macchiato Mocha].freeze

    class << self
      def fetch_filepath
        puts 'Please enter the path to the file you want to catppuccinify.'

        loop do
          print '> '

          filepath = File.expand_path(gets.chomp)
          return filepath if File.exist?(filepath) && !File.directory?(filepath)

          puts "This is not a valid text file. Please try again.\n"
        end
      end

      def fetch_theme
        print_theme_options

        loop do
          print '> '

          choice = gets.chomp.downcase
          return choice if THEME_OPTIONS.include?(choice.capitalize)
          return THEME_OPTIONS[choice.to_i - 1].downcase if choice.to_i.between?(1, 4)

          puts "Please refrain from choosing anything but the four listed themes.\n"
        end
      end

      private

      def print_theme_options
        puts 'Please choose a catppuccin theme:'
        THEME_OPTIONS.each_with_index { |theme, index| puts "#{index + 1}. #{theme}" }
      end
    end
  end
end
