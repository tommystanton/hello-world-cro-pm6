use Cro::HTTP::Server;

use Routes;

my $service = Cro::HTTP::Server.new:
    application => routes(),
    port => 8080;

$service.start;

react whenever signal(SIGINT) { $service.stop; done; }
