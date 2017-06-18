use v6;
unit class HTTP::Server::Static;

use HTTP::Server::Tiny; # parse-http-request

 my $port = 8080;

 # Only listen for connections from the local host
 # if you want this to be accessible from another
 # host then change this to '0.0.0.0'
 my $host = '0.0.0.0'; 
 my $dir = ".";
 
 HTTP::Server::Tiny.new(:$host , :$port)
     .run(sub ($env) {
		 say $env;
		 my $uri = $env<REQUEST_URI>;
		 my $content = "$dir/$uri".IO.open;
		 return 200, ['Content-Type' => 'text/plain'], $content;
    });
