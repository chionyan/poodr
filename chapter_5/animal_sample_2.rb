# 抽象クラス（ダックタイプ）
# class Animal
#   def speak
#   end
# end

class Dog
  def speak
    self.bark
  end

  def bark
    p 'わんわん'
  end
end

class Cat
  def speak
    self.meow
  end

  def meow
    p 'にゃあ'
  end
end

class Gorilla
  def speak
    self.uho
  end

  def uho
    p 'うほ'
  end
end

# =======================

Dog.new.speak
Cat.new.speak
Gorilla.new.speak
