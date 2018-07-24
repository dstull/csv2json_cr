require "csv"
require "json"

module Csv2jsonCr
  class Converter
    getter input : String
    getter output : String

    def initialize(@input, @output)
    end

    def write_json_to_file
      File.write(output, parsed_json, perm: File::Permissions.new(0o644))
    end

    private def parsed_json
      csv_io = CSV::Parser.new(File.read(input))
      header = csv_io.next_row

      JSON.build(indent: 2) do |json|
        json.object do
          json.field "columns", header
          json.field "lines", csv_io.parse
        end
      end
    end
  end
end
