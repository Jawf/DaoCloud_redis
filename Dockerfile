from ruby

run mkdir /app

add . /app

expose 8080

run bundle install

cmd['ruby','/app/myapp.rb']
