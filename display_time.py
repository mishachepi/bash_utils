from flask import Flask, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/time', methods=['GET'])
def get_server_time():
    """
    Endpoint to get the current server time.
    Returns:
        JSON object with the server time in ISO 8601 format.
    """
    server_time = datetime.utcnow().isoformat() + 'Z'  # UTC time with 'Z' notation
    return jsonify({"server_time": server_time})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)