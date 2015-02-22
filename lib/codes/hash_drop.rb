class Hash
  # Remove a key from the hash and return the hash
  def drop(key)
    self.tap do |hash|
      hash.delete key
    end
  end
end
