Team.create!([
  {name: "ARGENTINE", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/642/300?LHSB44985-15-25"},
  {name: "BOLIVIE", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/653/300?LHSB44985-15-25"},
  {name: "BRESIL", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/626/300?LHSB44985-15-25"},
  {name: "CHILI", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/629/300?LHSB44985-15-25"},
  {name: "COLOMBIE", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/640/300?LHSB44985-15-25"},
  {name: "EQUATEUR", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/884/300?LHSB44985-15-25"},
  {name: "JAMAÏQUE", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/641/300?LHSB44985-15-25"},
  {name: "MEXIQUE", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/635/300?LHSB44985-15-25"},
  {name: "PARAGUAY", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/633/300?LHSB44985-15-25"},
  {name: "PEROU", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/650/300?LHSB44985-15-25"},
  {name: "URUGUAY", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/885/300?LHSB44985-15-25"},
  {name: "VENEZUELA", division_id: nil, fanion_url: nil, logo_url: "http://medias.lequipe.fr/logo-football/883/300?LHSB44985-15-25"}
])
Game.create!([
  {home_id: 5, away_id: 10, game_name: "COLOMBIE VS PEROU", competition_id: nil, start_date: "2015-06-21 19:00:00", end_date: "2015-06-21 20:45:00"},
  {home_id: 3, away_id: 12, game_name: "BRESIL VS VENEZUELA", competition_id: nil, start_date: "2015-06-21 21:30:00", end_date: "2015-06-20 23:15:00"}
])
Tipster.create!([
  {name: "ACHILLE PIECHEUR", ba_url: "http://www.betadvisor.com/tipsters/football/achille-piecheur", avg_odds: 2.51, avg_yield: 9.56, score: 11.2735, avg_bet: 50.0},
  {name: "IVAN KACIC", ba_url: "http://www.betadvisor.com/tipsters/football/ivan-kacic", avg_odds: 1.96, avg_yield: 13.25, score: 7.187818181818182, avg_bet: 30.0},
  {name: "ROBERT VOLKAN", ba_url: "http://www.betadvisor.com/tipsters/football/robert-volkan", avg_odds: 2.36, avg_yield: 9.08, score: 10.982363636363637, avg_bet: 50.0},
  {name: "PIERLUIGI RAIMONDI", ba_url: "http://www.betadvisor.com/tipsters/football/pierluigi-raimondi", avg_odds: 1.87, avg_yield: 3.74, score: 5.637681818181818, avg_bet: 20.0},
  {name: "RADEK KOVAR", ba_url: "http://www.betadvisor.com/tipsters/football/radek-kovar", avg_odds: 2.43, avg_yield: 14.37, score: 5.117318181818182, avg_bet: 20.0},
  {name: "NEIL BAXTER", ba_url: "http://www.betadvisor.com/tipsters/football/neil-baxter", avg_odds: 2.06, avg_yield: 9.21, score: 7.318272727272728, avg_bet: 30.0},
  {name: "LORENZO MARCHETI", ba_url: "http://www.betadvisor.com/tipsters/football/lorenzo-marcheti", avg_odds: 2.01, avg_yield: 6.4, score: 9.180318181818182, avg_bet: 40.0},
  {name: "ARLO APORTI", ba_url: "http://www.betadvisor.com/tipsters/football/arlo-aporti", avg_odds: 2.12, avg_yield: 11.06, score: 7.163818181818182, avg_bet: 30.0},
  {name: "SILVIO BONATTI", ba_url: "http://www.betadvisor.com/tipsters/football/silvio-bonatti", avg_odds: 2.02, avg_yield: 7.03, score: 11.324272727272728, avg_bet: 50.0},
  {name: "JEREMY PRICE", ba_url: "http://www.betadvisor.com/tipsters/football/jeremy-price", avg_odds: 2.23, avg_yield: 14.39, score: 5.292772727272728, avg_bet: 20.0},
  {name: "EDUARDO BORRERO", ba_url: "http://www.betadvisor.com/tipsters/football/eduardo-borrero", avg_odds: 2.06, avg_yield: 17.19, score: 3.172818181818182, avg_bet: 10.0},
  {name: "KEM FALLON", ba_url: "http://www.betadvisor.com/tipsters/football/kem-fallon", avg_odds: 1.96, avg_yield: 6.21, score: 7.333272727272727, avg_bet: 30.0},
  {name: "EXPERT TIPSTER", ba_url: "http://www.betadvisor.com/tipsters/football/expert-tipster", avg_odds: 2.04, avg_yield: 5.42, score: 11.466727272727272, avg_bet: 50.0},
  {name: "CHRISTOS KOSTIS", ba_url: "http://www.betadvisor.com/tipsters/football/christos-kostis", avg_odds: 1.89, avg_yield: 4.8, score: 11.925590909090909, avg_bet: 50.0},
  {name: "PETE NORDSTED", ba_url: "http://www.betadvisor.com/tipsters/football/pete-nordsted", avg_odds: 1.93, avg_yield: 11.06, score: 3.192318181818182, avg_bet: 10.0}
])

Competition.create!([
  {name: "Coupe d'Amérique", short_name: "C.A", country: "Chili"},
  {name: "Ligue 1", short_name: "L1", country: "France"},
  {name: "Coupe du Monde (F)", short_name: "W.C(F)", country: "Canada"},
  {name: "Liga", short_name: "Liga", country: "Espagne"},
])
