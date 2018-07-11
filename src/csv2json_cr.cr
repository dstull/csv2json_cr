require "commander"
require "./csv2json_cr/*"

module Csv2jsonCr
  extend self

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
        converter.call
      end
    end
  end

  def run(argv)
    Commander.run(config, argv)
  end
end
