module IssueCentre
  class Error < StandardError
  end

  class ParseError < Error
  end

  class AuthenticationError < Error
  end
end
