# 具象的なコード

class Dog
  def bark
    p 'わんわん'
  end
end

class Cat
  def meow
    p 'にゃあ'
  end
end

class Gorilla
  def uho
    p 'うほ'
  end
end

# =======================

Dog.new.bark
Cat.new.meow
Gorilla.new.uho
