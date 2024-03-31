import 'dart:math';

import 'package:flutter/material.dart';

class WordSet {
  final String categoryTitle;
  final List<String> word;
  final int difficulty;

  WordSet({
    required this.categoryTitle,
    required this.difficulty,
    required this.word,
  });

  // Get the list of words
  static List<WordSet> get4WordSets() {
    List<WordSet> finalWords = [];
    
    // find 4 random wordsets
    for (int i = 0; i < 4; i++) {
      finalWords.add(wordsets[Random().nextInt(wordsets.length)]);
    }

    return finalWords;
  }

  static int getNumberOfWordSets() {
    return wordsets.length;
  }

  static List<WordSet> getWordSets() {
    return wordsets;
  }
}

List<WordSet> wordsets = [
  WordSet(categoryTitle: "Animals", difficulty: 3, word: ["Aardvark", "Manatee", "Rhinoceros", "Wolverine"]),
  WordSet(categoryTitle: "Animals", difficulty: 4, word: ["Echidna", "Komodo Dragon", "Quokka", "Tapir"]),
  WordSet(categoryTitle: "Animals", difficulty: 3, word: ["Fennec Fox", "Hippopotamus", "Narwhal", "Walrus"]),
  WordSet(categoryTitle: "Animals", difficulty: 4, word: ["Aye-aye", "Pangolin", "Platypus", "Saiga Antelope"]),
  WordSet(categoryTitle: "Animals", difficulty: 3, word: ["Dingo", "Koala", "Manatee", "Orangutan"]),
  WordSet(categoryTitle: "Animals", difficulty: 4, word: ["Axolotl", "Capybara", "Echidna", "Marmot"]),
  WordSet(categoryTitle: "Animals", difficulty: 3, word: ["Iguana", "Jaguar", "Kangaroo", "Walrus"]),
  WordSet(categoryTitle: "Animals", difficulty: 4, word: ["Dhole", "Fennec Fox", "Quokka", "Saola"]),
  WordSet(categoryTitle: "Animals", difficulty: 3, word: ["Gazelle", "Hyena", "Komodo Dragon", "Viper"]),
  WordSet(categoryTitle: "Animals", difficulty: 4, word: ["Aardvark", "Echidna", "Manatee", "Pangolin"]),
  WordSet(categoryTitle: "Fruits", difficulty: 3, word: ["Durian", "Guava", "Pomegranate", "Rambutan"]),
  WordSet(categoryTitle: "Fruits", difficulty: 4, word: ["Cherimoya", "Feijoa", "Mangosteen", "Tamarind"]),
  WordSet(categoryTitle: "Fruits", difficulty: 3, word: ["Kumquat", "Lychee", "Passionfruit", "Persimmon"]),
  WordSet(categoryTitle: "Fruits", difficulty: 4, word: ["Breadfruit", "Durian", "Jackfruit", "Nectarine"]),
  WordSet(categoryTitle: "Fruits", difficulty: 3, word: ["Honeydew", "Papaya", "Quince", "Starfruit"]),
  WordSet(categoryTitle: "Fruits", difficulty: 4, word: ["Cherimoya", "Feijoa", "Huckleberry", "Physalis"]),
  WordSet(categoryTitle: "Colors", difficulty: 3, word: ["Crimson", "Fuchsia", "Indigo", "Turquoise"]),
  WordSet(categoryTitle: "Colors", difficulty: 4, word: ["Cerulean", "Magenta", "Mauve", "Periwinkle"]),
  WordSet(categoryTitle: "Colors", difficulty: 3, word: ["Maroon", "Navy", "Olive", "Salmon"]),
  WordSet(categoryTitle: "Colors", difficulty: 4, word: ["Chartreuse", "Fuschia", "Tangerine", "Teal"]),
  WordSet(categoryTitle: "Body Parts", difficulty: 3, word: ["Clavicle", "Esophagus", "Patella", "Tibia"]),
  WordSet(categoryTitle: "Body Parts", difficulty: 4, word: ["Mandible", "Pharynx", "Scapula", "Tarsus"]),
  WordSet(categoryTitle: "Body Parts", difficulty: 3, word: ["Epidermis", "Larynx", "Pharynx", "Trachea"]),
  WordSet(categoryTitle: "Science", difficulty: 2, word: ["Gravity", "Light", "Water", "Energy"]),
  WordSet(categoryTitle: "Science", difficulty: 3, word: ["Photosynthesis", "Cell", "Atom", "DNA"]),
  WordSet(categoryTitle: "Science", difficulty: 4, word: ["Astrophysics", "Cosmology", "Quantum Mechanics", "Relativity"]),
  WordSet(categoryTitle: "Science", difficulty: 2, word: ["Machine", "Robot", "Computer", "Electricity"]),
  WordSet(categoryTitle: "Science", difficulty: 4, word: ["Thermodynamics", "Entomology", "Paleontology", "Genetics"]),
  WordSet(categoryTitle: "Food", difficulty: 2, word: ["Pizza", "Burger", "Pasta", "Bread"]),
  WordSet(categoryTitle: "Food", difficulty: 3, word: ["Sushi", "Salad", "Soup", "Sandwich"]),
  WordSet(categoryTitle: "Food", difficulty: 4, word: ["Escargot", "Foie Gras", "Kimchi", "Natto"]),
  WordSet(categoryTitle: "Food", difficulty: 2, word: ["Breakfast", "Lunch", "Dinner", "Snack"]),
  WordSet(categoryTitle: "Food", difficulty: 4, word: ["Canapé", "Hors d'oeuvre", "Soufflé", "Vol-au-vent"]),
  WordSet(categoryTitle: "Places", difficulty: 2, word: ["Beach", "Mountain", "Forest", "River"]),
  WordSet(categoryTitle: "Places", difficulty: 3, word: ["Desert", "Island", "Jungle", "Lake"]),
  WordSet(categoryTitle: "Places", difficulty: 4, word: ["Archipelago", "Canyon", "Fjord", "Savanna"]),
  WordSet(categoryTitle: "Places", difficulty: 2, word: ["City", "Town", "Village", "Countryside"]),
  WordSet(categoryTitle: "Places", difficulty: 4, word: ["Acropolis", "Coliseum", "Taj Mahal", "Great Wall of China"]),
  WordSet(categoryTitle: "Verbs", difficulty: 2, word: ["Walk", "Run", "Talk", "Eat"]),
  WordSet(categoryTitle: "Verbs", difficulty: 3, word: ["Think", "See", "Hear", "Write"]),
  WordSet(categoryTitle: "Verbs", difficulty: 4, word: ["Conjecture", "Descry", "Expatiate", "Perambulate"]),
  WordSet(categoryTitle: "Verbs", difficulty: 2, word: ["Play", "Sleep", "Work", "Learn"]),
  WordSet(categoryTitle: "Verbs", difficulty: 4, word: ["Elicit", "Implore", "Scrutinize", "Tranquilze"]),
  WordSet(categoryTitle: "Adjectives", difficulty: 2, word: ["Big", "Small", "Hot", "Cold"]),
  WordSet(categoryTitle: "Adjectives", difficulty: 3, word: ["Happy", "Sad", "Angry", "Scared"]),
  WordSet(categoryTitle: "Adjectives", difficulty: 4, word: ["Ephemeral", "Egregious", "Impecunious", "Lachrymose"]),
  WordSet(categoryTitle: "Adjectives", difficulty: 2, word: ["New", "Old", "Long", "Short"]),
  WordSet(categoryTitle: "Adjectives", difficulty: 4, word: ["Audacious", "Boisterous", "Cerebral", "Diaphanous"]),
  WordSet(categoryTitle: "Vehicles", difficulty: 2, word: ["Car", "Bus", "Train", "Bike"]),
  WordSet(categoryTitle: "Vehicles", difficulty: 3, word: ["Ship", "Plane", "Truck", "Motorcycle"]),
  WordSet(categoryTitle: "Vehicles", difficulty: 4, word: ["Catamaran", "Helicopter", "Submarine", "Tram"]),
  WordSet(categoryTitle: "Types of Water", difficulty: 2, word: ["Ocean", "Lake", "River", "Stream"]),
  WordSet(categoryTitle: "Types of Water", difficulty: 3, word: ["Groundwater", "Glacier", "Swamp", "Pond"]),
  WordSet(categoryTitle: "Types of Water", difficulty: 4, word: ["Estuary", "Brine",  "Thermal", "Artesian"]),
  WordSet(categoryTitle: "Mountain Names in Africa", difficulty: 2, word: ["Kilimanjaro", "Atlas", "Drakensberg", "Ruwenzori"]),
  WordSet(categoryTitle: "Mountain Names in Africa", difficulty: 3, word: ["Simien", "Kenya", "Bale", "Thabana"]),
  WordSet(categoryTitle: "Fictional Creatures", difficulty: 2, word: ["Dragon", "Unicorn", "Mermaid", "Elf"]),
  WordSet(categoryTitle: "Fictional Creatures", difficulty: 3, word: ["Werewolf", "Centaur", "Goblin", "Phoenix"]),
  WordSet(categoryTitle: "Fictional Creatures", difficulty: 4, word: ["Kraken", "Gryffin", "Basilisk", "Hippogriff"]),
  WordSet(categoryTitle: "Historical Inventions", difficulty: 2, word: ["Wheel", "Printing Press", "Compass", "Gunpowder"]),
  WordSet(categoryTitle: "Historical Inventions", difficulty: 3, word: ["Telescope", "Steam Engine",  "Telephone", "Light bulb"]),
  WordSet(categoryTitle: "Historical Inventions", difficulty: 4, word: ["Vaccination",  "Airplane", "Penicillin", "Computer"]),
  WordSet(categoryTitle: "Constellations", difficulty: 2, word: ["Ursa Major", "Orion", "Leo", "Cassiopeia"]),
  WordSet(categoryTitle: "Constellations", difficulty: 3, word: ["Andromeda", "Taurus", "Gemini", "Cancer"]),
  WordSet(categoryTitle: "Constellations", difficulty: 4, word: ["Hydra", "Centaurus", "Crux", "Corona Australis"]),
];