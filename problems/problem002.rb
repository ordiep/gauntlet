module Gauntlet
  module Problems
    class Vigenere

      # THIS IS A PAIR PROGRAMMING CHALLENGE
      # You will have until 3:45 to complete it.

      # Your task this week is to implement two methods on this class:
      # `#encode` and `#decode`. These methods are responsible for encoding
      # and decoding (respectively) a Vigenère cipher.

      # From Wikipedia:
      #
      # > The Vigenère cipher is a method of encrypting alphabetic text by
      # > using a series of different Caesar ciphers based on the letters
      # > of a keyword. It is a simple form of polyalphabetic substitution.
      #
      # (snip)
      #
      # > In a Caesar cipher, each letter of the alphabet is shifted along
      # > some number of places; for example, in a Caesar cipher of shift 3,
      # > A would become D, B would become E, Y would become B, and so on.
      # > The Vigenère cipher consists of several Caesar ciphers in sequence
      # > with different shift values.

      # Assume the key is repeated for the length of the text, character by
      # character. Note that some implementations repeat the key over
      # characters only if they are part of the alphabet; that is *not* the
      # case here.

      # The shift is derived by applying a Caesar shift to a character with
      # the corresponding index of the key in the alphabet.
      #
      # Example:
      #
      # message: my secret code i want to secure
      # key:     passwordpasswordpasswordpasswor
      #
      # Therefore, for my first cleartext letter: 'c', my shift will be
      # the distance of p to a (15), and 'c' shifted 15 is 'r'.
      #
      # For simplicity's sake, you can assume no keyphrase will have
      # non-alphabetic characters.

      attr_reader :keyphrase, :alphabet

      def initialize(keyphrase, alphabet=nil)
        # Don't mess with this method!
        @keyphrase = keyphrase
        @alphabet = alphabet || ("a".."z").to_a
      end

      def encode(text)
          calc_cipher
          text.split('').each do |letter|
            x = 0 if x > @cipher.length
            y = @alphabet.index letter
            z = y + @cipher
          end
        end
      end

      def decode(text)
      end
      #lel
      def calc_cipher
        @cipher = []
        @keyphrase.split('').each do |letter|
          @cipher << @alphabet.index letter
        end
      end
    end
  end
end
