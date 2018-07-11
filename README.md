# csv2json_cr

[![Docs](https://img.shields.io/badge/docs-available-brightgreen.svg)](https://dstull.github.io/csv2json_cr/)
[![Release](https://img.shields.io/github/release/dstull/csv2json_cr/all.svg?style=flat-square)](https://github.com/dstull/csv2json_cr/releases/latest)
[![Build Status](https://travis-ci.org/dstull/csv2json_cr.svg?branch=master)](https://travis-ci.org/dstull/csv2json_cr)


Converter using headers to minimize file size

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  csv2json_cr:
    github: dstull/csv2json_cr
```

## Usage

### In Program

```crystal
require "csv2json_cr"
```

### From Command line

```shell
./csv2json -h
  csv2json - converts csv to a particular format in json.

  Usage:
    csv2json [flags] [arguments]

  Commands:
    help [command]  # Help about any command.

  Flags:
    -h, --help    # Help for this command. default: 'false'.
    -i, --input   # The csv file to convert. default: 'test.csv'.
    -o, --output  # The json file to be created. default: 'test.json'.

$ cat test.csv
first,second,third,fourth
a,b,c,d
e,f,g,h

$ /csv2json --input test.csv --output test.json
$ cat test.json
{
  "columns": [
    "first",
    "second",
    "third",
    "fourth"
  ],
  "lines": [
    [
      "a",
      "b",
      "c",
      "d"
    ],
    [
      "e",
      "f",
      "g",
      "h"
    ]
  ]
}
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/dstull/csv2json_cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [your-github-user](https://github.com/dstull) Doug Stull - creator, maintainer
