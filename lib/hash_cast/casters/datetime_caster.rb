class HashCast::Casters::DateTimeCaster

  def self.cast(value, attr_name, options = {})
    if value.is_a?(DateTime)
      value
    elsif value.is_a?(Time)
      value.to_datetime
    elsif value.is_a?(String)
      begin
        DateTime.parse(value)
      rescue ArgumentError => e
        raise HashCast::Errors::CastingError, "is invalid datetime"
      end
    else
      raise HashCast::Errors::CastingError, "should be a datetime"
    end
  end

end
