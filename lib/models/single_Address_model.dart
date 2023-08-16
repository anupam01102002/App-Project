class SingleAddress {
	int? status;
	Data? data;

	SingleAddress({this.status, this.data});

	SingleAddress.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = this.status;
		if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
		return data;
	}
}

class Data {
	Address? address;

	Data({this.address});

	Data.fromJson(Map<String, dynamic> json) {
		address = json['address'] != null ? new Address.fromJson(json['address']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
		return data;
	}
}

class Address {
	int? id;
	String? name;
	String? mobile;
	String? address;
	String? address1;
	String? city;
	String? state;
	String? pincode;
	String? landmark;
	// String? default;
	String? type;

	Address({this.id, this.name, this.mobile, this.address, this.address1, this.city, this.state, this.pincode, this.landmark, this.type,});

	Address.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		mobile = json['mobile'];
		address = json['address'];
		address1 = json['address_1'];
		city = json['city'];
		state = json['state'];
		pincode = json['pincode'];
		landmark = json['landmark'];
		// default = json['default'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['mobile'] = this.mobile;
		data['address'] = this.address;
		data['address_1'] = this.address1;
		data['city'] = this.city;
		data['state'] = this.state;
		data['pincode'] = this.pincode;
		data['landmark'] = this.landmark;
		// data['default'] = this.default;
		data['type'] = this.type;
		return data;
	}
}
