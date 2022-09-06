class Rectangle:

  def __init__(self,width,heigth):
    self.w = width
    self.h = heigth

  def set_height(self,new_heigth):
    self.h = new_heigth

  def set_width(self,new_width):
    self.w = new_width

  def get_area(self):
    return self.w * self.h

  def get_diagonal(self):
    return ((self.w)**2+(self.h)**2)**(1/2)

  def get_perimeter(self):
    return 2*(self.w + self.h)

  def get_picture(self):
    draw = "*"
    wd = draw*self.w
    lista =[]
    for i in range(self.h):  
      var = wd+'\n'
      lista.append(var)

    return "".join(lista)

  def get_amount_inside(self,forma):
    
    return self.get_area()//Square.get_area(forma)

  def __str__(self):
    return f"Rectangle(width={self.w}, height={self.h})"

class Square(Rectangle):
  def __init__(self,side):

    self.w = side
    self.h = side

  def set_side(self,a):
    self.w = a
    self.h = a


  def set_width(self,c):
    self.w = c

  def get_diagonal(self):
    return ((self.h)**2+(self.w)**2)**(1/2)

  def get_perimeter(self):
    return 2*(self.w+self.h)

  def get_picture(self):
    draw = "*"
    wd = draw*self.w
    lista = []
    for i in range(self.h):
      var = wd +'\n'
      lista.append(var)

    return "".join(lista)
      
  def get_area(self):
    return (self.w)*(self.h)

  def __str__(self):
    return f"Square(side={self.w})"


if __name__ == '__main__':
  rect = Rectangle(3, 6)
  sq =  Square(5)
  print(rect)
  print(sq)
  print(rect.get_area())
  print(sq.get_area())

  print(rect.get_perimeter())
  print(sq.get_perimeter())

  print(rect.get_diagonal())
  print(sq.get_diagonal())

  rect.set_width(7)
  rect.set_height(8)
  sq.set_side(2)

  sq.set_width(4)

  print(sq.get_picture())