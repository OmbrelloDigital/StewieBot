# Allows Hubot to do mathematics.
#
# math me <expression> - Calculate the given expression.
# mennyi <expression> - Calculate the given expression.
# convert me <expression> to <units> - Convert expression to given units.
module.exports = (robot) ->
  robot.respond /(mennyi|calc|calculate|convert|math)( me)? (.*)/i, (msg) ->
    msg
      .http('http://www.google.com/ig/calculator')
      .query
        hl: 'en'
        q: msg.match[3]
      .headers
        'Accept-Language': 'en-us,en;q=0.5',
        'Accept-Charset': 'utf-8',
        'User-Agent': "Mozilla/5.0 (X11; Linux x86_64; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"
      .get() (err, res, body) ->
        # Response includes non-string keys, so we can't use JSON.parse here.
        json = eval("(#{body})")
        msg.send json.rhs || 'Could not compute.'

