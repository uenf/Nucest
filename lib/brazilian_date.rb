# -*- encoding : utf-8 -*-

module BrazilianDate
  def use_in_brazilian_format(*fields)
    unless methods.include?(:validate_dates)
      validate :validate_dates
      define_method :validate_dates do
        (@date_errors ||= {}).each_pair do |field, message|
          errors.add("#{field}".to_sym, message)
        end
      end
    end

    fields.each do |field|
      self.class_eval do
        define_method "#{field}_br=" do |value|
          if value.blank?
            self.send "#{field}=", nil
          else
            day, month, year = value.split('/')
            begin
              self.send "#{field}=", value.to_date
            rescue ArgumentError, NoMethodError
              @date_errors ||= {}
              @date_errors["#{field}".to_sym] = "não é válida."
              self.send "#{field}=", value
            end
          end
        end

        define_method "#{field}_br" do
          self.send("#{field}").to_s_br
        end
      end
    end
  end
end

ActiveRecord::Base.extend BrazilianDate

