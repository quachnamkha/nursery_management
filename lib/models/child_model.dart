class Child {
  String id;
  String hoDem;
  String ten;
  DateTime ngaySinh;
  String gioiTinh;
  String diaChi;
  String nguoiGiamHo;
  String soDT;
  String lop;

  Child({
    required this.id,
    required this.hoDem,
    required this.ten,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.diaChi,
    required this.nguoiGiamHo,
    required this.soDT,
    required this.lop,
  });

  Map<String, dynamic> toMap() {
    return {
      'hoDem': hoDem,
      'ten': ten,
      'ngaySinh': ngaySinh.toIso8601String(),
      'gioiTinh': gioiTinh,
      'diaChi': diaChi,
      'nguoiGiamHo': nguoiGiamHo,
      'soDT': soDT,
      'lop': lop,
    };
  }

  factory Child.fromMap(Map<String, dynamic> map, String id) {
    return Child(
      id: id,
      hoDem: map['hoDem'],
      ten: map['ten'],
      ngaySinh: DateTime.parse(map['ngaySinh']),
      gioiTinh: map['gioiTinh'],
      diaChi: map['diaChi'],
      nguoiGiamHo: map['nguoiGiamHo'],
      soDT: map['soDT'],
      lop: map['lop'],
    );
  }
}
