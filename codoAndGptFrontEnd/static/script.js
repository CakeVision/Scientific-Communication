$(document).ready(function() {
    $.ajax({
        url: '/get_news_data',  // Endpoint to fetch data
        method: 'GET',
        success: function(response) {
            displayNews(response);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });

    function displayNews(newsData) {
        var newsContainer = $('#news-container');
        newsData.forEach(function(news) {
            console.log("HEERE");
            var newsBox = $('<div class="news-box"></div>');
            newsBox.append('<h2>' + news.title + '</h2>');
            newsBox.append('<p>' + news.summary + '</p>');
            newsBox.append('<a href="' + news.url + '">Read More</a>');
            newsContainer.append(newsBox);
        });
    }
});

