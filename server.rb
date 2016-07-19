require 'webrick'
server = WEBrick::HTTPServer.new Port: 3300
server.mount "/", WEBrick::HTTPServlet::FileHandler, './public/'
trap('INT'){ server.stop }
server.start

