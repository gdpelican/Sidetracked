class Admin
  @@hex = SecureRandom.hex 6
  
  def self.hex
    @@hex
  end  
end