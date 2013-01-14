require 'webrick'
require 'erb'
require 'github/markup'

module GfmPreview

  class Server

    def start(path, address, port)
      @server = WEBrick::HTTPServer.new({:BindAddress => address, :Port => port})
      @server.mount_proc('/') do|req, res|
        if req.path == '/'
          WEBrick::HTTPServlet::FileHandler.new(@server, path, {:FancyIndexing => true}).service(req, res)
        elsif req.path =~ /\.(css|ico)$/
          WEBrick::HTTPServlet::FileHandler.new(@server, File.join(File.dirname(__FILE__), '..', 'public')).service(req, res)
        else
          file_path = path + req.path
          file_name = File.basename(file_path)
          content = GitHub::Markup.render(file_path)
          open(File.join(File.dirname(__FILE__), '..', 'templates', 'base.html.erb')) { |file|
            erb = ERB.new(file.read)
            res.body = erb.result(binding)
            res.content_type = 'text/html; charset=uft-8'
          }
        end
      end
      @server.start
    end

    def shutdown
      @server.shutdown
    end

  end

end
