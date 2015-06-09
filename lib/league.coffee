class League

  constructor: (@teams) ->
    @rounds = @schedule(@teams)
    @size = @rounds.length * @rounds[0].length

  schedule: (teams) ->
    count = teams.length - 1 + teams.length % 2
    rounds = [0...count].map -> []
    flag = [0...teams.length].map -> []
    home = true
    [0...teams.length].forEach (i) ->
      r = (2 * i) % count
      [(i + 1)...teams.length].forEach (j) ->
        r = (r + 1) % count while r in flag[i]
        rounds[r].push
          home: teams[if home then i else j]
          away: teams[if home then j else i]
        flag[j].push(r)
        flag[i].push(r)
        home = !home
    rounds.forEach (r) -> rounds.push(r.map (e) -> home: e.away, away: e.home)
    rounds

module.exports = League
