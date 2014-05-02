module Gauntlet
  module Problems
    class PostfixCalculator

      # This one's not math, I swear!

      # Your job is to create a calculator which evaluates expressions
      # in postfix notation, sometimes called reverse Polish notation.

      # For example, the expression
      # 
      #     5 1 2 + 4 * + 3 -
      #
      # is equivalent to
      #
      #     5 + ((1 + 2) * 4) - 3
      #
      # and evaluates to 14.

      # Note for simplicity's sake you can assume there are always spaces
      # between numbers and operations.
      # e.g. `1 3 +` is valid but `1 3+` is not.

      # Source: Codewars

      attr_reader :expression, :stack

      OPERATORS = %w(+ - * /)

      def self.calc(expression)
        new(expression).calculate
      end

      def initialize(expression)
        @expression, @stack = expression, []
      end

      def calculate
        tokens.each(&method(:handle))
        stack.pop || 0
      end

    private

      def tokens
        expression.split(' ')
      end

      def handle(token)
        stack << (operator?(token) ? reduce(token) : token.to_f)
      end

      def operator?(token)
        OPERATORS.member? token
      end

      def reduce(token)
        stack.pop(2).inject(token)
      end

    end
  end
end
