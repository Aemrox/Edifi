class Availability
  def self.set_array(user_availability, new_slot)
    #takes a user, a new availability string, and returns a new array
    self.ordered_hash(user_availability.push(new_slot)).values
  end

  def self.to_hash(availability_array)
    #returns a hash with each day as an element
    availability_array.inject({}) {|hsh, elem| hsh[elem.match(/\w+y/)[0]] = elem; hsh}
  end

  def self.ordered_hash(availability_array)
    u_hash = self.to_hash(availability_array)
    new_hash ={}
    new_hash["Monday"] = u_hash["Monday"] if u_hash["Monday"]
    new_hash["Tuesday"] = u_hash["Tuesday"] if u_hash["Tuesday"]
    new_hash["Wednesday"] = u_hash["Wednesday"] if u_hash["Wednesday"]
    new_hash["Thursday"] = u_hash["Thursday"] if u_hash["Thursday"]
    new_hash["Friday"] = u_hash["Friday"] if u_hash["Friday"]
    new_hash["Saturday"] = u_hash["Saturday"] if u_hash["Saturday"]
    new_hash["Sunday"] = u_hash["Sunday"] if u_hash["Sunday"]
    new_hash
  end
end
