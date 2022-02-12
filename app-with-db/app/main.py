import os
import psycopg2

def url_parse(url):
    args = {}
    data = url.split(sep='//')[1]
    args['user'] = data.split(':')[0]
    args['password'], args['hostname'] = data.split(':')[1].split('@')
    args['port'], args['database'] = data.split(':')[2].split('/')
    return args

args = url_parse(os.environ.get("DB_URL"))

con = psycopg2.connect(
  database = args['database'],
  user = args['user'],
  password = args['password'],
  host = args['hostname'],
  port = args['port']
)

cur = con.cursor()  
cur.execute("SELECT version()")
print("Hello! You are on version", cur.fetchall()[0][0])
con.close()