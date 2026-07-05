# frozen_string_literal: true

module Themes
  class ColorProvider
    include ThemeColors

    THEMES_MAPPING = {
      'latte' => LATTE_THEME,
      'frappe' => FRAPPE_THEME,
      'macchiato' => MACCHIATO_THEME,
      'mocha' => MOCHA_THEME
    }.freeze

    def initialize(theme:)
      selected_colors = THEMES_MAPPING[theme]
      @base_color = selected_colors[:base]
      @main_colors = selected_colors[:main]
    end

    attr_reader :base_color

    def random_color
      main_colors.sample
    end

    private

    attr_reader :main_colors
  end
end
