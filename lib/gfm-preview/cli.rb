require 'optparse'
require 'gfm-preview/server'

module GfmPreview
  class CLI
    def self.execute(stdout, arguments=[])

      options = {
        :source_dir   => '.',
        :address      => '127.0.0.1',
        :port         => '10080',
        :open_browser => true
      }
      mandatory_options = %w(  )

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          GitHub Flavored Markdown Preview server

          Usage: #{File.basename($0)} [options] [source_dir]
          Options are:
        BANNER
        opts.on("-a [address]", "--address", "Default: 127.0.0.1") { |v| options[:address] = v }
        opts.on("-p [port]",    "--port",    "Default: 10080") { |v| options[:port] = v }
        opts.on("-h",           "--help",    "Show this help message") { stdout.puts opts; exit }
        opts.parse!(ARGV)
        options[:source_dir] = ARGV[0] if ARGV[0]

        if mandatory_options && mandatory_options.find { |option| options[option.to_sym].nil? }
          stdout.puts opts; exit
        end
      end

      server = Server.new
      trap(:INT){server.shutdown}
      server.start(options[:source_dir], options[:address], options[:port])

    end
  end
end
