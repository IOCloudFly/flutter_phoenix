class HomeBeanEntity {
	List<HomeBeanImage> images;
	HomeBeanTooltips tooltips;

	HomeBeanEntity({this.images, this.tooltips});

	HomeBeanEntity.fromJson(Map<String, dynamic> json) {
		if (json['images'] != null) {
			images = new List<HomeBeanImage>();(json['images'] as List).forEach((v) { images.add(new HomeBeanImage.fromJson(v)); });
		}
		tooltips = json['tooltips'] != null ? new HomeBeanTooltips.fromJson(json['tooltips']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.images != null) {
      data['images'] =  this.images.map((v) => v.toJson()).toList();
    }
		if (this.tooltips != null) {
      data['tooltips'] = this.tooltips.toJson();
    }
		return data;
	}
}

class HomeBeanImage {
	String quiz;
	String urlbase;
	String copyright;
	int bot;
	List<Null> hs;
	String startdate;
	String title;
	String url;
	String enddate;
	int top;
	String fullstartdate;
	bool wp;
	String copyrightlink;
	String hsh;
	int drk;

	HomeBeanImage({this.quiz, this.urlbase, this.copyright, this.bot, this.hs, this.startdate, this.title, this.url, this.enddate, this.top, this.fullstartdate, this.wp, this.copyrightlink, this.hsh, this.drk});

	HomeBeanImage.fromJson(Map<String, dynamic> json) {
		quiz = json['quiz'];
		urlbase = json['urlbase'];
		copyright = json['copyright'];
		bot = json['bot'];
		if (json['hs'] != null) {
			hs = new List<Null>();
		}
		startdate = json['startdate'];
		title = json['title'];
		url = json['url'];
		enddate = json['enddate'];
		top = json['top'];
		fullstartdate = json['fullstartdate'];
		wp = json['wp'];
		copyrightlink = json['copyrightlink'];
		hsh = json['hsh'];
		drk = json['drk'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['quiz'] = this.quiz;
		data['urlbase'] = this.urlbase;
		data['copyright'] = this.copyright;
		data['bot'] = this.bot;
		if (this.hs != null) {
      data['hs'] =  [];
    }
		data['startdate'] = this.startdate;
		data['title'] = this.title;
		data['url'] = this.url;
		data['enddate'] = this.enddate;
		data['top'] = this.top;
		data['fullstartdate'] = this.fullstartdate;
		data['wp'] = this.wp;
		data['copyrightlink'] = this.copyrightlink;
		data['hsh'] = this.hsh;
		data['drk'] = this.drk;
		return data;
	}
}

class HomeBeanTooltips {
	String next;
	String walle;
	String walls;
	String previous;
	String loading;

	HomeBeanTooltips({this.next, this.walle, this.walls, this.previous, this.loading});

	HomeBeanTooltips.fromJson(Map<String, dynamic> json) {
		next = json['next'];
		walle = json['walle'];
		walls = json['walls'];
		previous = json['previous'];
		loading = json['loading'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['next'] = this.next;
		data['walle'] = this.walle;
		data['walls'] = this.walls;
		data['previous'] = this.previous;
		data['loading'] = this.loading;
		return data;
	}
}
