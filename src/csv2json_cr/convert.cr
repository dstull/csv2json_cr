require "csv"
require "json"

module Csv2jsonCr
  class Converter
    getter input : String
    getter output : String

    def initialize(@input, @output)
    end

    def call
      csv_io = CSV::Parser.new(File.read(@input))
      header = csv_io.next_row
      json_output = {
        columns: header,
        lines:   csv_io.parse,
      }

      formatted_json = json_output.to_pretty_json
      File.write(output, formatted_json, perm: File::Permissions.new(0o644))
    end
  end
end
