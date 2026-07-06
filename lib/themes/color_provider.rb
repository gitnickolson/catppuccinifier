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
      @selected_colors = THEMES_MAPPING[theme]
    end

    def random_color
      selected_colors.sample
    end

    private

    attr_reader :selected_colors
  end
end
