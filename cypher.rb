#!/usr/local/bin/ruby

class CaesarCipher

  ALPHABET = ('a'..'z').to_a

  def initialize(shift)
    @shift = shift
  end

  def encrypt(message)
    message.chars.map { |char| encrypt_char(char) }.join
  end

  def decrypt(message)
    message.chars.map { |char| decrypt_char(char) }.join
  end

  private

  def encrypt_char(char)
    return char unless ALPHABET.include?(char.downcase)

    is_upcase = char == char.upcase
    index = ALPHABET.index(char.downcase)
    shifted_index = (index + @shift) % ALPHABET.size
    shifted_char = ALPHABET[shifted_index]

    is_upcase ? shifted_char.upcase : shifted_char
  end

  def decrypt_char(char)
    return char unless ALPHABET.include?(char.downcase)

    is_upcase = char == char.upcase

    index = ALPHABET.index(char.downcase)
    shifted_index = (index - @shift) % ALPHABET.size
    shifted_char = ALPHABET[shifted_index]

    is_upcase ? shifted_char.upcase : char
  end
end

def encrypt
  cipher = CaesarCipher.new(5)
  puts 'saisir la phrase a coder'
  cipher_text = gets.chomp
  puts cipher.encrypt(cipher_text)
end

def decrypt
  cipher = CaesarCipher.new(5)
  puts 'saisir la phrase a decoder'
  cipher_text = gets.chomp
  puts cipher.decrypt(cipher_text)
end

puts 'Souhaitez vous encrypter(e) ou decrypter(d) un message'

mode = gets.chomp

if mode == 'e'
  encrypt
elsif mode == 'd'
  decrypt
end
