docker build -t arbeit3 .

Run TTY: docker run -e port=8080 -t arbeit3 -m 300M --memory-swap 300M --oom-kill-disable

Run Background: docker run -e port=8080 -d arbeit3 -m 300M --memory-swap 300M --oom-kill-disable

Stop all: docker stop $(docker ps -aq)
Kill all: docker rm $(docker ps -aq)
