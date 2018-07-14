require "csv"
require "json"

module Csv2jsonCr
  class Converter
    getter input : String
    getter output : String

    def initialize(@input, @output)
    end

    def write_json_to_file
      formatted_json = parsed_json.to_pretty_json
      File.write(output, formatted_json, perm: File::Permissions.new(0o644))
    end

    private def parsed_json
      csv_io = CSV::Parser.new(File.read(input))
      header = csv_io.next_row
      {
        columns: header,
        lines:   csv_io.parse,
      }
    end
  end
end
