# frozen_string_literal: true

class Catppuccinifier
  def initialize(theme:)
    @color_provider = Themes::ColorProvider.new(theme:)
  end

  def catppuccinify(filepath:)
    content = File.read(filepath)
    colorized_lines = content.each_line.with_object([]) do |line, colorized_lines|
      colorized_lines << colorize_line(line)
    end

    colorized_lines.join
  end

  private

  attr_reader :color_provider

  def colorize_line(line)
    colorized_characters = line.chars.each_with_object([]) do |character, colorized_characters|
      colorized_characters << colorize_character(character)
    end

    colorized_characters.join
  end

  def colorize_character(character)
    hex_code = color_provider.random_color
    rgb_values = Utility::HexTranslator.hex_to_rgb_ansi_string(hex_code:)

    "\e[38;2;#{rgb_values}m#{character}\e[0m"
  end
end
