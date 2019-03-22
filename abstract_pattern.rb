# The abstract factory pattern is a factory of factories really.
# In most cases the factories involved are related by a theme

class Button
  def paint
    raise NotImplementedError
  end
end

class MacButton < Button
  def paint
    'rendered a mac button'
  end
end

class WinButton < Button
  def paint
    'rendered a win button'
  end
end

class GUIFactory
  def create_button
    raise NotImplementedError
  end
end

class MacFactory < GUIFactory
  def create_button
    MacButton.new
  end
end

class WinFactory < GUIFactory
  def create_button
    WinButton.new
  end
end

appearance = 'win'

case appearance
when 'mac'
  factory = MacFactory.new
when 'win'
  factory = WinFactory.new
end

if factory
  button = factory.create_button
  puts button.paint
end
