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
  WordSet(categoryTitle: "Food", difficulty: 4, word: ["Escargot", "Foie Gras", "Kimchi", "Natto"]),
  WordSet(categoryTitle: "Food", difficulty: 4, word: ["Canapé", "Hors d'oeuvre", "Soufflé", "Vol-au-vent"]),
  WordSet(categoryTitle: "Places", difficulty: 4, word: ["Archipelago", "Canyon", "Fjord", "Savanna"]),
  WordSet(categoryTitle: "Places", difficulty: 4, word: ["Acropolis", "Coliseum", "Taj Mahal", "Great Wall of China"]),
  WordSet(categoryTitle: "Verbs", difficulty: 4, word: ["Conjecture", "Descry", "Expatiate", "Perambulate"]),
  WordSet(categoryTitle: "Verbs", difficulty: 4, word: ["Elicit", "Implore", "Scrutinize", "Tranquilze"]),
  WordSet(categoryTitle: "Adjectives", difficulty: 4, word: ["Ephemeral", "Egregious", "Impecunious", "Lachrymose"]),
  WordSet(categoryTitle: "Adjectives", difficulty: 4, word: ["Audacious", "Boisterous", "Cerebral", "Diaphanous"]),
  WordSet(categoryTitle: "Vehicles", difficulty: 4, word: ["Catamaran", "Helicopter", "Submarine", "Tram"]),
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
  WordSet(categoryTitle:"Literature", difficulty:4, word:["Haiku", "Sonnet", "Bildungsroman", "Stream of Consciousness"]),
  WordSet(categoryTitle:"Literature", difficulty:4, word:["Allegory", "Satire", "Magical Realism", "Fabulist"]),
  WordSet(categoryTitle:"Literature", difficulty:4, word:["Iambic Pentameter", "Free Verse", "Terza Rima", "Ottava Rima"]),
  WordSet(categoryTitle:"Science", difficulty:4, word:["Astrophysics", "Cosmology", "Quantum Mechanics", "Relativity"]),
  WordSet(categoryTitle:"Science", difficulty:4, word:["Entomology", "Paleontology", "Genetics", "Astrobiology"]),
  WordSet(categoryTitle:"Science", difficulty:4, word:["Photolysis", "Photosynthesis", "Recombinant DNA", "Superconductivity"]),
  WordSet(categoryTitle:"History", difficulty:4, word:["Renaissance", "Enlightenment", "Industrial Revolution", "Cold War"]),
  WordSet(categoryTitle:"History", difficulty:4, word:["Magna Carta", "Hundred Years' War", "Great Leap Forward", "French Revolution"]),
  WordSet(categoryTitle:"History", difficulty:4, word:["Hieroglyphics", "Sumerians", "Inca Empire", "Parthenon"]),
  WordSet(categoryTitle:"Philosophy", difficulty:4, word:["Existentialism", "Utilitarianism", "Stoicism", "Deconstructionism"]),
  WordSet(categoryTitle:"Philosophy", difficulty:4, word:["Epistemology", "Metaphysics", "Aesthetics", "Ethics"]),
  WordSet(categoryTitle:"Philosophy", difficulty:4, word:["Cogito, ergo sum", "Tabula rasa", "Social Contract", "Critique of Pure Reason"]),
  WordSet(categoryTitle:"Language", difficulty:4, word:["Morphology", "Syntax", "Phonetics", "Semantics"]),
  WordSet(categoryTitle:"Language", difficulty:4, word:["Onomatopoeia", "Oxymoron", "Euphemism", "Hyperbole"]),
  WordSet(categoryTitle:"Language", difficulty:4, word:["Digraph", "Homophone", "Homonym", "Etymology"]),
  WordSet(categoryTitle:"Literary Form", difficulty:4, word:["Haiku", "Sonnet", "Bildungsroman", "Stream of Consciousness"]),
  WordSet(categoryTitle:"Literary Device", difficulty:4, word:["Allegory", "Satire", "Magical Realism", "Fabulist"]),
  WordSet(categoryTitle:"Poetic Meter", difficulty:4, word:["Iambic Pentameter", "Free Verse", "Terza Rima", "Ottava Rima"]),
  WordSet(categoryTitle:"Scientific Field", difficulty:4, word:["Astrophysics", "Cosmology", "Quantum Mechanics", "Relativity"]),
  WordSet(categoryTitle:"Biological Science", difficulty:4, word:["Entomology", "Paleontology", "Genetics", "Astrobiology"]),
  WordSet(categoryTitle:"Chemical Process", difficulty:4, word:["Photolysis", "Photosynthesis", "Recombinant DNA", "Superconductivity"]),
  WordSet(categoryTitle:"Historical Period", difficulty:4, word:["Renaissance", "Enlightenment", "Industrial Revolution", "Cold War"]),
  WordSet(categoryTitle:"Historical Event", difficulty:4, word:["Magna Carta", "Hundred Years' War", "Great Leap Forward", "French Revolution"]),
  WordSet(categoryTitle:"Ancient Civilization", difficulty:4, word:["Hieroglyphics", "Sumerians", "Inca Empire", "Parthenon"]),
  WordSet(categoryTitle:"School of Thought", difficulty:4, word:["Existentialism", "Utilitarianism", "Stoicism", "Deconstructionism"]),
  WordSet(categoryTitle:"Branch of Philosophy", difficulty:4, word:["Epistemology", "Metaphysics", "Aesthetics", "Ethics"]),
  WordSet(categoryTitle:"Philosophical Theory", difficulty:4, word:["Social Contract", "Tabula Rasa", "Critique of Pure Reason", "Cogito, ergo sum"]),
  WordSet(categoryTitle:"Linguistic Subfield", difficulty:4, word:["Morphology", "Syntax", "Phonetics", "Semantics"]),
  WordSet(categoryTitle:"Figure of Speech", difficulty:4, word:["Onomatopoeia", "Oxymoron", "Euphemism", "Hyperbole"]),
  WordSet(categoryTitle:"Word Formation", difficulty:4, word:["Digraph", "Homophone", "Homonym", "Etymology"]),
  WordSet(categoryTitle:"Art Movement", difficulty:4, word:["Chiaroscuro", "Sfumato", "Impressionism", "Surrealism"]),
  WordSet(categoryTitle:"Mythological Creature", difficulty:4, word:["Kraken", "Jörmungandr", "Minotaur", "Sleipnir"]),
  WordSet(categoryTitle:"Constellation", difficulty:4, word:["Boötes", "Centaurus", "Crux", "Lyra"]),
  WordSet(categoryTitle:"Spectrum of Light", difficulty:1, word:["Fuchsia", "Cerulean", "Vermilion", "Mauve"]),
  WordSet(categoryTitle:"Geometric Forms", difficulty:1, word:["Rhombus", "Dodecagon", "Icosahedron", "Parallelogram"]),
  WordSet(categoryTitle:"Basic Numerals", difficulty:1, word:["Eleven", "Twelve", "Thirteen", "Fourteen"]),
  WordSet(categoryTitle:"Common Fruits", difficulty:1, word:["Persimmon", "Pomegranate", "Rambutan", "Durian"]),
  WordSet(categoryTitle:"Farm Animals", difficulty:1, word:["Alpacca", "Yak", "Llama", "Ferret"]),
  WordSet(categoryTitle:"Body Parts (Head)", difficulty:1, word:["Cornea", "Iris", "Mandible", "Mandible"]),
  WordSet(categoryTitle:"Vehicles on Land", difficulty:1, word:["Locomotive", "Bulldozer", "Excavator", "Segway"]),
  WordSet(categoryTitle:"Simple Clothing", difficulty:1, word:["Poncho", "Leotard", "Cufflinks", "Camisole"]),
  WordSet(categoryTitle:"Foods We Eat", difficulty:1, word:["Quinoa", "Edamame", "Kimchi", "Falafel"]),
  WordSet(categoryTitle:"Places in a City", difficulty:1, word:["Observatory", "Conservatory", "Auditorium", "Embassy"]),
  WordSet(categoryTitle:"Endangered Species", difficulty:2, word:["Axolotl", "Pangolin", "Saola", "Komodo Dragon"]),
  WordSet(categoryTitle:"Nocturnal Creatures", difficulty:2, word:["Owl", "Bat", "Raccoon", "Tasmanian Devil"]),
  WordSet(categoryTitle:"Island Nations", difficulty:2, word:["Madagascar", "Iceland", "New Zealand", "Fiji"]),
  WordSet(categoryTitle:"Landlocked Countries", difficulty:2, word:["Bolivia", "Switzerland", "Nepal", "Chad"]),
  WordSet(categoryTitle:"Formal Attire", difficulty:2, word:["Tuxedo", "Gown", "Cufflinks", "Cravat"]),
  WordSet(categoryTitle:"Protective Gear", difficulty:2, word:["Helmet", "Goggles", "Gloves", "Boots"]),
  WordSet(categoryTitle:"Complex Emotions", difficulty:2, word:["Melancholy", "Nostalgia", "Euphoria", "Ambivalence"]),
  WordSet(categoryTitle:"Positive Emotions", difficulty:2, word:["Gratitude", "Serenity", "Contentment", "Exhilaration"]),
  WordSet(categoryTitle:"International Cuisine", difficulty:2, word:["Sushi", "Paella", "Tacos", "Hummus"]),
  WordSet(categoryTitle:"Spices and Herbs", difficulty:2, word:["Saffron", "Cumin", "Thyme", "Rosemary"]),
  WordSet(categoryTitle:"Antique Furniture", difficulty:2, word:["Armoire", "Bureau", "Commode", "Secretaire"]),
  WordSet(categoryTitle:"Modern Furniture", difficulty:2, word:["Chaise Lounge", "Ottoman", "Beanbag Chair", "Futon"]),
  WordSet(categoryTitle:"String Instruments", difficulty:2, word:["Cello", "Violin", "Guitar", "Mandolin"]),
  WordSet(categoryTitle:"Wind Instruments", difficulty:2, word:["Flute", "Clarinet", "Saxophone", "Trombone"]),
  WordSet(categoryTitle:"Earth's Diverse Landscapes", difficulty:1, word:["Fjord", "Mesa", "Stalactite", "Atolls"]),
  WordSet(categoryTitle:"Rare and Valuable Minerals", difficulty:1, word:["Palladium", "Alexandrite", "Opal", "Tanzanite"]),
  WordSet(categoryTitle:"Specialized Implements", difficulty:1, word:["Calipers", "Level", "Pliers", "Wrench (Socket)"]),
  WordSet(categoryTitle:"Comfy Household Items", difficulty:1, word:["Chaise Lounge", "Ottoman", "Beanbag Chair", "Futon"]),
  WordSet(categoryTitle:"Specialized Careers", difficulty:1, word:["Paleontologist", "Astrophysicist", "Cardiologist", "Linguist"]),
  WordSet(categoryTitle:"Complex Feelings", difficulty:1, word:["Melancholy", "Nostalgia", "Euphoria", "Ambivalence"]),
  WordSet(categoryTitle:"Fashionable Garments", difficulty:1, word:["Poncho", "Leotard", "Cufflinks", "Camisole"]),
  WordSet(categoryTitle:"Global Celebrations", difficulty:1, word:["Hanukkah", "Diwali", "Eid al-Fitr", "Cinco de Mayo"]),
  WordSet(categoryTitle:"Counting Further", difficulty:1, word:["Sixty", "Seventy", "Eighty", "Ninety"]),
  WordSet(categoryTitle:"Vivid Shades", difficulty:1, word:["Magenta", "Cerulean", "Vermilion", "Mauve"]),
];