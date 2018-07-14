require "../spec_helper"
require "file_utils"

describe Csv2jsonCr::Converter do
  describe ".write_json_to_file" do
    it "converts the file" do
      input_file = "spec/fixtures/files/test.csv"
      output_file = "spec/fixtures/files/test.json"
      test_output = "spec/tmp/test.json"
      FileUtils.rm_rf(test_output)

      Csv2jsonCr::Converter.new(input_file,test_output).write_json_to_file

      FileUtils.cmp(output_file,test_output).should be_true
    end
  end
end
