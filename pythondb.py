import psycopg2


def db_connection():
 conn = psycopg2.connect(
    host="localhost",
    port="5432",
    database="dictdb",
    user="checkpoint",
    password="mastery") 
 return conn


def read_dict():
    dbconn = db_connection()
    cur = dbconn.cursor()
    cur.execute("SELECT word, translation FROM dictionary;")
    rows = cur.fetchall()
    cur.close()
    dbconn.close()
    return rows

while True: ## REPL - Read Execute Program Loop
    cmd = input("Command: list, add, delele or quit ")
    if cmd == "quit":
        exit()

def list():
   print ("SELECT word, translation FROM dictionary;")

def add(word, translation):
   conn = get_db_connection()
   cur = conn.cursor()
   cur.execute(f"INSERT INTO dictionary VALUES ('(word)', '(translation)';")
   cur.execute ("COMMIT")
   cur.close()
   conn.close()
   return 


def deleted_word(word, translation):
   conn = get_db_connection()
   cur = conn.cursor()
   cur.execute(f"DROP FROM dictionary VALUES ('(word)';")
   cur.execute ("COMMIT")
   cur.close()
   conn.close()
   return 