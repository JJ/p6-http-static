use v6;
#unit class HTTP::Server::Static;

use HTTP::Server::Tiny; # parse-http-request

sub MAIN( $port = 8080, $host = '0.0.0.0', $dir = "." ) {
 
    HTTP::Server::Tiny.new(:$host , :$port)
        .run(sub ($env) {
		say $env;
		my $uri = $env<REQUEST_URI>;
		my $content = "$dir/$uri".IO.open;
		return 200, ['Content-Type' => 'text/plain'], $content;
	    });
}
