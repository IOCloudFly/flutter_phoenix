class OpenEyeBeanEntity {
	int nextPublishTime;
	dynamic dialog;
	String newestIssueType;
	String nextPageUrl;
	List<EyeBeanEntityIssuelist> issueList;

	OpenEyeBeanEntity({this.nextPublishTime, this.dialog, this.newestIssueType, this.nextPageUrl, this.issueList});

	OpenEyeBeanEntity.fromJson(Map<String, dynamic> json) {
		nextPublishTime = json['nextPublishTime'];
		dialog = json['dialog'];
		newestIssueType = json['newestIssueType'];
		nextPageUrl = json['nextPageUrl'];
		if (json['issueList'] != null) {
			issueList = new List<EyeBeanEntityIssuelist>();(json['issueList'] as List).forEach((v) { issueList.add(new EyeBeanEntityIssuelist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nextPublishTime'] = this.nextPublishTime;
		data['dialog'] = this.dialog;
		data['newestIssueType'] = this.newestIssueType;
		data['nextPageUrl'] = this.nextPageUrl;
		if (this.issueList != null) {
      data['issueList'] =  this.issueList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class EyeBeanEntityIssuelist {
	int date;
	int publishTime;
	int releaseTime;
	int count;
	List<EyeBeanEntityIssuelistItemlist> itemList;
	String type;

	EyeBeanEntityIssuelist({this.date, this.publishTime, this.releaseTime, this.count, this.itemList, this.type});

	EyeBeanEntityIssuelist.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		publishTime = json['publishTime'];
		releaseTime = json['releaseTime'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<EyeBeanEntityIssuelistItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new EyeBeanEntityIssuelistItemlist.fromJson(v)); });
		}
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['publishTime'] = this.publishTime;
		data['releaseTime'] = this.releaseTime;
		data['count'] = this.count;
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		data['type'] = this.type;
		return data;
	}
}

class EyeBeanEntityIssuelistItemlist {
	EyeBeanEntityIssuelistItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	EyeBeanEntityIssuelistItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	EyeBeanEntityIssuelistItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new EyeBeanEntityIssuelistItemlistData.fromJson(json['data']) : null;
		adIndex = json['adIndex'];
		tag = json['tag'];
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['adIndex'] = this.adIndex;
		data['tag'] = this.tag;
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}

class EyeBeanEntityIssuelistItemlistData {
	String image;
	dynamic labelList;
	String dataType;
	String actionUrl;
	bool shade;
	String description;
	dynamic header;
	int id;
	dynamic label;
	String title;
	bool autoPlay;
	dynamic adTrack;

	EyeBeanEntityIssuelistItemlistData({this.image, this.labelList, this.dataType, this.actionUrl, this.shade, this.description, this.header, this.id, this.label, this.title, this.autoPlay, this.adTrack});

	EyeBeanEntityIssuelistItemlistData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		labelList = json['labelList'];
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		header = json['header'];
		id = json['id'];
		label = json['label'];
		title = json['title'];
		autoPlay = json['autoPlay'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['labelList'] = this.labelList;
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['shade'] = this.shade;
		data['description'] = this.description;
		data['header'] = this.header;
		data['id'] = this.id;
		data['label'] = this.label;
		data['title'] = this.title;
		data['autoPlay'] = this.autoPlay;
		data['adTrack'] = this.adTrack;
		return data;
	}
}
