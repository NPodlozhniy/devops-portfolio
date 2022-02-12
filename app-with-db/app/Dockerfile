FROM python:3

# move all files into container
ADD . /myapp
WORKDIR /myapp

# install dependencies
RUN pip3 install psycopg2

# run the command
CMD ["python", "./main.py"]