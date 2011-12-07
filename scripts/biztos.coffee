# Who's turn to do something ?
#
# biztos hogy <valami állítás> ? - Returns who does !
# tuti hogy   <valami állítás> ? - Returns who does !
#
module.exports = (robot) ->
  robot.respond /(biztos|tuti) (.+)\?/i, (msg) ->
    msg.send rand.toString()
    if rand > 0.5
      msg.send 'IGEN!'
    else
      msg.send 'Lehet hogy nem.'
