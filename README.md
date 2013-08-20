# gfm-previw

GFM (Github Flavored Markdown) preview server.

## installation

add this line to your application's gemfile:

    gem 'gfm-preview'

and then execute:

    $ bundle

or install it yourself as:

    $ gem install gfm-preview

## usage

start preview server:

    $ gfm-preview [options] [source_dir]
    Options are:
        -a, --address [address]          Default: 127.0.0.1
        -p, --port [port]                Default: 10080
        -h, --help                       Show this help message.

```C-c``` to shutdown the preview server.
