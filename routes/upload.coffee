# Respond to upload of scores file
path = require "path"
ScoreCalculator = require path.join(__dirname, "..", "node_modules", "BESTScore2013", "score_calculator")

wait_until_done = (req, res, sc)->
    if sc? and (sc.done or sc.err)
        if sc.done
            good_response(req, res, sc)
        else
            err_response(req, res, "Error parsing input file")
    else
        setTimeout ->
            wait_until_done(req, res, sc)
        , 100

good_response = (req, res, sc)->
    res.render 'upload', { title: 'BEST Scorekeeper 2013', teams: sc.getTeamsSortedByHighScore() if sc?, password: req.body.password }

err_response = (req, res, message)->
    res.render "index", { title: "BEST Scorekeeper 2013", flash: message }

upload = (req, res)->
    unless req.body.password == process.env.UPLOAD_PASSWORD || "squeaky"
        err_response req, res, "Incorrect Password"
    else if req.files
        scores_file = req.files.score.path
        sc = new ScoreCalculator scores_file
        wait_until_done(req, res, sc)
    else
        good_response req, res, null

module.exports = upload
