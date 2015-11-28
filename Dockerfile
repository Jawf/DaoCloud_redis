from ruby

run mkdir /app

add . /app

workdir /app

run chmod a+x start.sh

expose 8080

run bundle install

cmd ["./start.sh"]
