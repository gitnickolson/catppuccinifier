# frozen_string_literal: true

class Catppuccinifier
  def initialize(theme:)
    @color_provider = Themes::ColorProvider.new(theme:)
  end

  def catppuccinify(filepath:)
    colorized_content = ''

    content = File.read(filepath)
    content.each_line do |line|
      colorized_content += colorize_line(line)
    end

    puts colorized_content
  end

  private

  attr_reader :color_provider

  def colorize_line(line)
    colorized_line = ''
    line.chars.each do |character|
      hex_code = character == ' ' ? color_provider.base_color : color_provider.random_color
      colorized_character = colorize(character, hex_code)
      colorized_line += colorized_character
    end

    colorized_line
  end

  def colorize(character, hex_code)
    rgb_values = Utility::HexTranslator.hex_to_rgb_ansi_string(hex_code:)
    "\e[38;2;#{rgb_values}m#{character}\e[0m"
  end
end
