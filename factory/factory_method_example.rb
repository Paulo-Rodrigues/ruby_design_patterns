require 'json'

# naive implementation
class ReportGenerator
  def self.generate(data, type)
    return "" if (data.empty? || !['csv', 'json'].include?(type))

    if type == 'csv'
      result = data.keys.join(',') + '\n'
      result += data.values.join(',') + '\n'
    elsif type == 'json'
      result = data.to_json
    end

    result
  end
end

report_data = { foo: 'foo', bar: 'bar' }

json = ReportGenerator.generate(report_data, 'json')
csv = ReportGenerator.generate(report_data, 'csv')

# moving formating logic
#
class CsvFormatter
  def format(data)
    return "" if data.empty?

    result = data.keys.join(',') + '\n'
    result += data.values.join(',') + '\n'
  end
end

class JsonFormatter
  def format(data)
    return "" if data.empty?

    data.to_json
  end
end


# not so good
# class ReportGenerator
#   def self.generate(data, type)
#     return "" if (data.empty? || !['csv', 'json'].include?(type))
#
#     if type == 'csv'
#       result = CsvFormatter.new.format(data)
#     elsif type == 'json'
#       result = JsonFormatter.new.format(data)
#     end
#
#     result
#   end
# end
#

class Formatter
  def self.for(type)
    case type
    when 'csv'
      CsvFormatter.new
    when 'json'
      JsonFormatter.new
    else
      raise 'Call the ambulance...but not for me'
    end
  end
end

class ReportGeneratorWithFactory
  def self.generate(data, type)
    Formatter.for(type).format(data)
  end
end

report_data = { foo: 'foo', bar: 'bar' }

json = ReportGeneratorWithFactory.generate(report_data, 'json')
csv = ReportGeneratorWithFactory.generate(report_data, 'csv')

