use Cro::HTTP::Router;

sub routes() is export {
    route {
        get -> 'hello' { content 'text/plain', 'Hello world!' }
        get -> 'greet', :$name! { content 'text/plain', "Hello $name!" }
    }
};
