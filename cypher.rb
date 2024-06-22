#!/usr/local/bin/ruby

ALPHABET = ('a'..'z').to_a

def caesar_cipher (message, shift)
  encrypt(message, shift)
end

private

def encrypt(message, shift)
  message.chars.map { |char| encrypt_char(char, shift) }.join
end

def decrypt(message, shift)
  message.chars.map { |char| decrypt_char(char, shift) }.join
end

def encrypt_char(char, shift)
  return char unless ALPHABET.include?(char.downcase)

  is_upcase = char == char.upcase
  index = ALPHABET.index(char.downcase)
  shifted_index = (index + shift) % ALPHABET.size
  shifted_char = ALPHABET[shifted_index]

  is_upcase ? shifted_char.upcase : shifted_char
end

def decrypt_char(char, shift)
  return char unless ALPHABET.include?(char.downcase)

  is_upcase = char == char.upcase

  index = ALPHABET.index(char.downcase)
  shifted_index = (index - shift) % ALPHABET.size
  shifted_char = ALPHABET[shifted_index]

  is_upcase ? shifted_char.upcase : char
end

puts caesar_cipher("Hello, World!", 5)
