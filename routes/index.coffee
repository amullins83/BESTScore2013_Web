# GET home page.

exports.index = (req, res)->
    res.render 'index', title: 'BEST Scorekeeper 2013'
