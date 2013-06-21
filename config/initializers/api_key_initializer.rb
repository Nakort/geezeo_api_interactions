AppConfig ||= {}
AppConfig[:api_key] = ENV["GEEZEO_API_KEY"]
raise Exception.new("You must set the GEEZEO_API_KEY in your environment.") if AppConfig[:api_key].nil?
