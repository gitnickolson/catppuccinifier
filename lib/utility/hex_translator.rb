# frozen_string_literal: true

module Utility
  class HexTranslator
    class << self
      def hex_to_rgb_string(hex_code:)
        red = hex_to_decimal(hex_code[0..1])
        green = hex_to_decimal(hex_code[2..3])
        blue = hex_to_decimal(hex_code[4..5])

        "#{red};#{green};#{blue}"
      end

      private

      def hex_to_decimal(hex_number)
        hex_number.to_i(16)
      end
    end
  end
end
