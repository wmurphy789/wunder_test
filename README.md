# BattlePets Contest

You are able to battle two pets from the given api: https://github.com/wunderteam/battle-pets-api.
There are two contests to compete in: strength or intelligence. With a tie that goes to the crowd favorite(randomly done).You can also see screenshots of a very simple frontend.

### Get Started

```
bundle install
rake db:create
rake db:migrate
rake db:seed
```

### To run locally
Run these three commands in different terminals:
```
rails s
nohup redis-server &
bundle exec sidekiq
```

### Current Tests
```
rspec
```

```
26 examples, 0 failures
```
