from flask import Flask
import os
app = Flask(__name__)

@app.get("/")
def hello():
    return {"message": "Hello from Python demo!", "pod": os.getenv("HOSTNAME", "?")}

@app.get("/healthz")
def health():
    return "ok", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)