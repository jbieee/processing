background(0);
fill(255);

String[] words = {"forest", "tree", "flower", "sky", "grass", "mountain"};
String[] adjectives = {"happy", "rotating", "elastic", "smily", "unbelievable", "infinite"};

text(words[int(random(words.length))], 30, 30);
text(adjectives[int(random(adjectives.length))], 30, 20);
