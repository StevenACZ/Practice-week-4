module Catalog
  CHARACTER_TYPES = {
    "warrior" => {
      type: "warrior",
      base_exp: 64,
      base_stats: { hp: 90, attack: 49, defense: 49, special_attack: 64, speed: 45 },
      moves: %w[sword\ attack]
    },
    "magician" => {
      type: "magician",
      base_exp: 50,
      base_stats: { hp: 70, attack: 49, defense: 49, special_attack: 40, speed: 45 },
      moves: %w[sword\ attack]
    }
  }.freeze

  MOVES = {
    "sword attack" => {
      name: "sword attack",
      power: 40,
      accuracy: 100,
      priority: 0
    },
    "magic wind" => {
      name: "magic wind",
      power: 45,
      accuracy: 100,
      priority: 0 
    }
  }.freeze
end