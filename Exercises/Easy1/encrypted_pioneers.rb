# frozen_string_literal: true

ALPHABET = ('a'..'z').to_a

def decrypt(string, encryption_type = :rot13)
  string.each_char.reduce('') do |result, char|
    result + method(encryption_type).call(char)
  end
end

def rot13(character)
  return character unless ALPHABET.include?(character.downcase)

  index = ALPHABET.index(character.downcase)
  new_char = ALPHABET[(index + 13) % 26]
  character.upcase == character ? new_char.upcase : new_char
end

p decrypt('Nqn Ybirynpr')
p decrypt('Tenpr Ubccre')
p decrypt('Nqryr Tbyqfgvar')
p decrypt('Nyna Ghevat')
p decrypt('Puneyrf Onoontr')
p decrypt('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decrypt('Wbua Ngnanfbss')
p decrypt('Ybvf Unvog')
p decrypt('Pynhqr Funaaba')
p decrypt('Fgrir Wbof')
p decrypt('Ovyy Tngrf')
p decrypt('Gvz Orearef-Yrr')
p decrypt('Fgrir Jbmavnx')
p decrypt('Xbaenq Mhfr')
p decrypt('Fve Nagbal Ubner')
p decrypt('Zneiva Zvafxl')
p decrypt('Lhxvuveb Zngfhzbgb')
p decrypt('Unllvz Fybavzfxv')
p decrypt('Tregehqr Oynapu')
