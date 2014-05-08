require "test_helper"

class Problem002Test < Test::Unit::TestCase
  attr_reader :cipher

  context "Gauntlet::Problems::Vigenere" do
    should "encode a word" do
      @cipher = Gauntlet::Problems::Vigenere.new("password")
      assert_encoded("godzilla", "vovrezcd")
    end

    should "decode a word" do
      @cipher = Gauntlet::Problems::Vigenere.new("password")
      assert_decoded("bolzno", "mothra")
    end

    should "encode a series of words separated by spaces" do
      @cipher = Gauntlet::Problems::Vigenere.new("password")
      assert_encoded("godzilla is king of the monsters", "vovrezcd ik gwej ox pvv bofkpsiv")
    end

    should "decode a series of words separated by spaces" do
      @cipher = Gauntlet::Problems::Vigenere.new("password")
      assert_decoded("pnv odrftggvvwcop ak bf balud wrg zai", "and spacegodzilla is no match for him")
    end

    should "ignore non-alphabetic characters" do
      @cipher = Gauntlet::Problems::Vigenere.new("password")
      assert_encoded("some say 'the terror of mechagodzilla' is the best film", "hoew grb 'lza khgrgj cw beuzwufgoiddw' lh lza shht xezd")
      assert_decoded("seklkffbph'k cilvif ohfun ak pzcprjw!", "destoroyah's origin story is bizarre!")
    end

    should "handle uppercase characters by making them lowercase" do
      @cipher = Gauntlet::Problems::Vigenere.new("password")
      assert_encoded("There goes Godzilla, destroying the country AGAIN", "ihwja xrts ykrqlals, rvvirgqebx ihw yclqirq wurlc")
      assert_decoded("nek! ufgoiddw rwt eq vfptwgjg!", "yes! godzilla ate my homework!")
    end

    should "be able to handle non-'password' keyphrases" do
      @cipher = Gauntlet::Problems::Vigenere.new("in")
      assert_encoded("godzilla", "oblmqytn")
      @cipher = Gauntlet::Problems::Vigenere.new("theaters")
      assert_decoded("zvhzbpcs", "godzilla")
      @cipher = Gauntlet::Problems::Vigenere.new("may")
      assert_encoded("godzilla", "soblijxa")
      @cipher = Gauntlet::Problems::Vigenere.new("sixteenth")
      assert_decoded("ywasmpyt", "godzilla")
    end
  end

private

  def assert_encoded(cleartext, ciphertext)
    encoded = cipher.encode(cleartext)
    assert_equal ciphertext, encoded, "Expected \"#{cleartext}\" to be encoded as \"#{ciphertext}\" with the keyphrase \"#{cipher.keyphrase}\", but was \"#{encoded}\""
  end

  def assert_decoded(ciphertext, cleartext)
    decoded = cipher.decode(ciphertext)
    assert_equal cleartext, decoded, "Expected \"#{ciphertext}\" to be decoded as \"#{cleartext}\" with the keyphrase \"#{cipher.keyphrase}\", but was \"#{decoded}\""
  end

end
