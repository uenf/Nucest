# -*- encoding : utf-8 -*-
module Rack
  module Utils
    def escape(s)
      EscapeUtils.escape_url(s)
    end
  end
end

