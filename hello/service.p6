use Cro::HTTP::Router;
use Cro::HTTP::Server;

my $application = route {
    get -> { content 'text/plain', 'Hello world!' }
};

my $service = Cro::HTTP::Server.new(:$application, :port<8080>);

$service.start;

react whenever signal(SIGINT) { $service.stop; done; }
