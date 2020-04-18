class Word {

  String word;

  List<Example> examples;

  Word({
    this.word,
    this.examples
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    List<Example> examples = json['examples'].map<Example>((i) => Example.fromJson(i)).toList();

    return Word(
      word: json['word'],
      examples: examples
    );
  }
}

class Example {

  String songName;

  String artistName;

  Example({
    this.songName,
    this.artistName
  });

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      songName: json['songName'],
      artistName: json['artistName']
    );
  }
}