from ruby

run mkdir /app

add . /app

workdir /app

expose 8080

cmd ['ruby','/app/myapp.rb']

run bundle install
