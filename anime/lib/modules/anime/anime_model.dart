class AnimeModel {
  String _requestHash;
  bool _requestCached;
  int _requestCacheExpiry;
  List<Results> _results;
  int _lastPage;

  AnimeModel(
      {String requestHash,
      bool requestCached,
      int requestCacheExpiry,
      List<Results> results,
      int lastPage}) {
    this._requestHash = requestHash;
    this._requestCached = requestCached;
    this._requestCacheExpiry = requestCacheExpiry;
    this._results = results;
    this._lastPage = lastPage;
  }

  String get requestHash => _requestHash;
  set requestHash(String requestHash) => _requestHash = requestHash;
  bool get requestCached => _requestCached;
  set requestCached(bool requestCached) => _requestCached = requestCached;
  int get requestCacheExpiry => _requestCacheExpiry;
  set requestCacheExpiry(int requestCacheExpiry) =>
      _requestCacheExpiry = requestCacheExpiry;
  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;
  int get lastPage => _lastPage;
  set lastPage(int lastPage) => _lastPage = lastPage;

  AnimeModel.fromJson(Map<String, dynamic> json) {
    _requestHash = json['request_hash'];
    _requestCached = json['request_cached'];
    _requestCacheExpiry = json['request_cache_expiry'];
    if (json['results'] != null) {
      _results = new List<Results>();
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
    _lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this._requestHash;
    data['request_cached'] = this._requestCached;
    data['request_cache_expiry'] = this._requestCacheExpiry;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    data['last_page'] = this._lastPage;
    return data;
  }
}

class Results {
  int _malId;
  String _url;
  String _imageUrl;
  String _title;
  bool _airing;
  String _synopsis;
  String _type;
  int _episodes;
  double _score;
  String _startDate;
  String _endDate;
  int _members;
  String _rated;

  Results(
      {int malId,
      String url,
      String imageUrl,
      String title,
      bool airing,
      String synopsis,
      String type,
      int episodes,
      double score,
      String startDate,
      String endDate,
      int members,
      String rated}) {
    this._malId = malId;
    this._url = url;
    this._imageUrl = imageUrl;
    this._title = title;
    this._airing = airing;
    this._synopsis = synopsis;
    this._type = type;
    this._episodes = episodes;
    this._score = score;
    this._startDate = startDate;
    this._endDate = endDate;
    this._members = members;
    this._rated = rated;
  }

  int get malId => _malId;
  set malId(int malId) => _malId = malId;
  String get url => _url;
  set url(String url) => _url = url;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;
  String get title => _title;
  set title(String title) => _title = title;
  bool get airing => _airing;
  set airing(bool airing) => _airing = airing;
  String get synopsis => _synopsis;
  set synopsis(String synopsis) => _synopsis = synopsis;
  String get type => _type;
  set type(String type) => _type = type;
  int get episodes => _episodes;
  set episodes(int episodes) => _episodes = episodes;
  double get score => _score;
  set score(double score) => _score = score;
  String get startDate => _startDate;
  set startDate(String startDate) => _startDate = startDate;
  String get endDate => _endDate;
  set endDate(String endDate) => _endDate = endDate;
  int get members => _members;
  set members(int members) => _members = members;
  String get rated => _rated;
  set rated(String rated) => _rated = rated;

  Results.fromJson(Map<String, dynamic> json) {
    _malId = json['mal_id'];
    _url = json['url'];
    _imageUrl = json['image_url'];
    _title = json['title'];
    _airing = json['airing'];
    _synopsis = json['synopsis'];
    _type = json['type'];
    _episodes = json['episodes'];
    _score = json['score'].toDouble();
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _members = json['members'];
    _rated = json['rated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this._malId;
    data['url'] = this._url;
    data['image_url'] = this._imageUrl;
    data['title'] = this._title;
    data['airing'] = this._airing;
    data['synopsis'] = this._synopsis;
    data['type'] = this._type;
    data['episodes'] = this._episodes;
    data['score'] = this._score;
    data['start_date'] = this._startDate;
    data['end_date'] = this._endDate;
    data['members'] = this._members;
    data['rated'] = this._rated;
    return data;
  }
}
