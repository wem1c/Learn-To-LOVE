Wall = Entity:extend()

function Wall:new(x, y)
    Wall.super.new(self, x, y, "images/wall.png")
    self.strength = 100
end