# Respond to upload of scores file
path = require "path"
ScoreCalculator = require path.join(__dirname, "..", "node_modules", "BESTScore2013", "score_calculator")

wait_until_done = (req, res, sc)->
    if sc? and (sc.done or sc.err)
        if sc.done
            good_response(req, res, sc)
        else
            err_response(req, res, sc)
    else
        setTimeout ->
            wait_until_done(req, res, sc)
        , 100

good_response = (req, res, sc)->
    res.render 'index', { title: 'BEST Scorekeeper 2013', teams: sc.teams }

err_response = (req, res, sc)->
    res.json sc.err

upload = (req, res)->
    scores_file = req.files.score.path
    sc = new ScoreCalculator scores_file
    
    wait_until_done(req, res, sc)

module.exports = upload
