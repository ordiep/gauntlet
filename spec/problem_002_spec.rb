require "spec_helper"

describe Gauntlet::Problems::Vigenere do
  it "should encode words" do
    cipher = described_class.new("password")
    expect(cipher.encode("godzilla")).to eq("vovrezcd"), "Expected 'godzilla' to be encoded as 'vovrezcd' with keyphrase 'password'"
  end

  it "should decode words" do
    cipher = Gauntlet::Problems::Vigenere.new("password")
    expect(cipher.decode("bolzno")).to eq("mothra"), "Expected 'bolzno' to be decoded as 'mothra' with keyphrase 'password'"
  end

  it "should encode a series of words separated by spaces" do
    cipher = Gauntlet::Problems::Vigenere.new("password")
    expect(cipher.encode("godzilla is king of the monsters")).to eq("vovrezcd ik gwej ox pvv bofkpsiv"), "Expected 'godzilla is king of the monsters' to be encoded as 'vovrezcd ik gwej ox pvv bofkpsiv' with keyphrase 'password'"
  end

  it "should decode a series of words separated by spaces" do
    cipher = Gauntlet::Problems::Vigenere.new("password")
    expect(cipher.decode("pnv odrftggvvwcop ak bf balud wrg zai")).to eq("and spacegodzilla is no match for him"), "Expected 'pnv odrftggvvwcop ak bf balud wrg zai' to be decoded as 'and spacegodzilla is no match for him' with keyphrase 'password'"
  end

  it "should ignore non-alphabetic characters when encoding" do
    cipher = Gauntlet::Problems::Vigenere.new("password")
    expect(cipher.encode("some say 'the terror of mechagodzilla' is the best film")).to eq("hoew grb 'lza khgrgj cw beuzwufgoiddw' lh lza shht xezd"), 'Expected "some say \'the terror of mechagodzilla\' is the best film" to be encoded as "hoew grb \'lza khgrgj cw beuzwefgoiddw\' lh lza shht xezd" with keyphrase "password"'
  end

  it "should ignore non-alphabetic characters when decoding" do
    cipher = Gauntlet::Problems::Vigenere.new("password")
    expect(cipher.decode("seklkffbph'k cilvif ohfun ak pzcprjw!")).to eq("destoroyah's origin story is bizarre!"), 'Expected "seklkffbph\'k cilvif ohfun ak pzcprjw!" to be decoded as "destoroyah\'s origin story is bizarre!" with keyphrase "password"'
  end

  it "should handle uppercase characters by making them lowercase" do
    cipher = Gauntlet::Problems::Vigenere.new("password")
    expect(cipher.encode("There goes Godzilla, destroying the country AGAIN")).to eq("ihwja xrts ykrqlals, rvvirgqebx ihw yclqirq wurlc"), "Expected 'There goes Godzilla, destroying the country AGAIN' to be encoded as 'ihwja xrts ykrqlals, rvvirgqebx ihw yclqirq wurlc' with keyphrase 'password'"
    expect(cipher.decode("NEK! ufgoiddw rwt eq vfptwgjg!")).to eq("yes! godzilla ate my homework!"), "Expected 'NEK! ufgoiddw rwt eq vfptwgjg!' to be decoded as 'yes! godzilla ate my homework!' with keyphrase 'password'"
  end

  it "should be able to handle non-'password' keyphrases" do
    cipher = Gauntlet::Problems::Vigenere.new("in")
    expect(cipher.encode("godzilla")).to eq("oblmqytn"), "Expected 'godzilla' to be encoded as 'oblmqytn' with keyphrase 'in'"

    cipher = Gauntlet::Problems::Vigenere.new("theaters")
    expect(cipher.decode("zvhzbpcs")).to eq("godzilla"), "Expected 'zvhzbpcs' to be decoded as 'godzilla' with keyphrase 'theaters'"

    cipher = Gauntlet::Problems::Vigenere.new("may")
    expect(cipher.encode("godzilla")).to eq("soblijxa"), "Expected 'godzilla' to be encoded as 'soblijxa' with keyphrase 'may'"

    cipher = Gauntlet::Problems::Vigenere.new("sixteenth")
    expect(cipher.decode("ywasmpyt")).to eq("godzilla"), "Expected 'ywasmpyt' to be decoded as 'godzilla' with keyphrase 'sixteenth'"
  end
end
