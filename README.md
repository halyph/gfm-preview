# gfm-preview

GFM (Github Flavored Markdown) preview server.

## Installation

Install it yourself as:

    $ gem install gfm-preview

## Usage

Start preview server:

    $ gfm-preview [options] [source_dir]
    Options are:
        -a, --address [address]          Default: 127.0.0.1
        -p, --port [port]                Default: 10080
        -h, --help                       Show this help message

```C-c``` to shutdown the preview server.

# Why it's forked
The main idea is to have JRuby + Windows supported GFM Markdown previewer.
`kramdown` gem is well supported on JRuby/Windows (i.e. it's pure Ruby imprementation).
Also, it's nice to add other features like use this _previewer_ as a **jar** file on JVM platform, but it's not implemented yet.
