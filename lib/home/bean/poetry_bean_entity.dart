class PoetryBeanEntity {
	PoetryBeanData data;
	String ipAddress;
	dynamic warning;
	String status;
	String token;

	PoetryBeanEntity({this.data, this.ipAddress, this.warning, this.status, this.token});

	PoetryBeanEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new PoetryBeanData.fromJson(json['data']) : null;
		ipAddress = json['ipAddress'];
		warning = json['warning'];
		status = json['status'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['ipAddress'] = this.ipAddress;
		data['warning'] = this.warning;
		data['status'] = this.status;
		data['token'] = this.token;
		return data;
	}
}

class PoetryBeanData {
	int popularity;
	PoetryBeanDataOrigin origin;
	List<String> matchTags;
	String cacheAt;
	String recommendedReason;
	String id;
	String content;

	PoetryBeanData({this.popularity, this.origin, this.matchTags, this.cacheAt, this.recommendedReason, this.id, this.content});

	PoetryBeanData.fromJson(Map<String, dynamic> json) {
		popularity = json['popularity'];
		origin = json['origin'] != null ? new PoetryBeanDataOrigin.fromJson(json['origin']) : null;
		matchTags = json['matchTags']?.cast<String>();
		cacheAt = json['cacheAt'];
		recommendedReason = json['recommendedReason'];
		id = json['id'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['popularity'] = this.popularity;
		if (this.origin != null) {
      data['origin'] = this.origin.toJson();
    }
		data['matchTags'] = this.matchTags;
		data['cacheAt'] = this.cacheAt;
		data['recommendedReason'] = this.recommendedReason;
		data['id'] = this.id;
		data['content'] = this.content;
		return data;
	}
}

class PoetryBeanDataOrigin {
	String dynasty;
	String author;
	String title;
	List<String> content;
	dynamic translate;

	PoetryBeanDataOrigin({this.dynasty, this.author, this.title, this.content, this.translate});

	PoetryBeanDataOrigin.fromJson(Map<String, dynamic> json) {
		dynasty = json['dynasty'];
		author = json['author'];
		title = json['title'];
		content = json['content']?.cast<String>();
		translate = json['translate'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dynasty'] = this.dynasty;
		data['author'] = this.author;
		data['title'] = this.title;
		data['content'] = this.content;
		data['translate'] = this.translate;
		return data;
	}
}
