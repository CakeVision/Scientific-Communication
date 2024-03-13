from flask import Flask, render_template

app = Flask(__name__)

import json
from flask import jsonify, request

# Assuming you have a function to fetch news data from your backend
def fetch_news_data():
    # Your logic to fetch news data from your backend
    # For demonstration, let's assume you have a list of dictionaries
    # Each dictionary represents a news article with 'title', 'summary', and 'source_link'
    thing = {"title": "Article 1 Title", "summary": "Summary of Article 1", "url": "http://example.com/article1"}
    news_data = [
        {"title": "Article 1 Title", "summary": "Summary of Article 1", "url": "http://example.com/article1"},
        {"title": "Article 2 Title", "summary": "Summary of Article 2", "url": "http://example.com/article2"}
    ]
    return thing

@app.route('/get_news_data')
def get_news_data():
    
    #news_data = fetch_news_data()
    news_data = request.json
    dic_news_data = json.loads(news_data)
    rez = []
    rez.append(dic_news_data)
    return jsonify(rez)



@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, port=5000)

