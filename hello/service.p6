use Cro::HTTP::Router;
use Cro::HTTP::Server;

my $application = route {
    get -> 'hello' { content 'text/plain', 'Hello world!' }
    get -> 'greet', :$name! { content 'text/plain', "Hello $name!" }
};

my $service = Cro::HTTP::Server.new(:$application, :port<8080>);

$service.start;

react whenever signal(SIGINT) { $service.stop; done; }
