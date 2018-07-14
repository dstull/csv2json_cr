require "commander"

module Csv2jsonCr::CLI
  extend self

  def run(argv)
    Commander.run(config, argv)
  end

  def config
    Commander::Command.new do |cmd|
      cmd.use = "csv2json"
      cmd.long = "converts csv to a particular format in json."

      cmd.flags.add do |flag|
        flag.name = "input"
        flag.short = "-i"
        flag.long = "--input"
        flag.default = "test.csv"
        flag.description = "The csv file to convert."
      end

      cmd.flags.add do |flag|
        flag.name = "output"
        flag.short = "-o"
        flag.long = "--output"
        flag.default = "test.json"
        flag.description = "The json file to be created."
      end

      cmd.run do |options, arguments|
        arguments # => Array(String)
        converter = Csv2jsonCr::Converter.new(options.string["input"], options.string["output"])
        converter.write_json_to_file
      end
    end
  end
end
