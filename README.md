BEST Score 2013 Web
===================

A Web front-end for the BEST 2013 Tournament Scoring System

#Install
    git clone https://github.com/amullins83/BESTScore2013_Web
    cd BESTScore2013_Web
    npm install
    export UPLOAD_PASSWORD=mypass
    npm start

#Usage
Open a browser (only tested in [Chrome](http://chrome.google.com) but should work in others). Navigate to http://localhost:3000. Enter your password (value of UPLOAD_PASSWORD environment variable, defaults to `squeaky`. Click `browse` to select the Tournament Software `.sco` file to upload and scan. When parsing succeeds, a table showing the uploaded scores should appear. Clicking on a team will reveal more data, including inventory and scores by match.
