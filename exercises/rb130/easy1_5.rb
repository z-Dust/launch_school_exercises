ALPHABET = ('a'..'z').to_a

names = ['Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu']

def decrypt(arr)
  arr.each do |name|
    letters = name.downcase.split('')
    decrypt = letters.map do |x|
      if x =~ /[^a-z]/
        x
      else
        idx = ALPHABET.index(x)
        idx < 13 ? idx += 13 : idx -= 13
        ALPHABET[idx]
      end
    end
    puts decrypt.join.split(' ').map {|name| name.capitalize}.join(' ')
  end
end

decrypt(names)
