import 'package:equatable/equatable.dart';
import 'package:soft/serviceitem.dart';

class serviceitem extends Equatable{
  final int id;
  final int salonid;
  final String name;
  final String category;
  final String description;
  final double price;
  serviceitem({
    required this.price,
    required this.name,
    required this.id,
    required this.salonid,
    required this.description,
    required this.category
  });

  @override
  List<Object?> get props =>
      [
        id,salonid,name,category,description,price,
      ];

  static List<serviceitem> Serviceitem=[
    //walaa idsalon=2
    //hair
    serviceitem(
        name: 'Cut',
        price: 10,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Hair'
    ),
    serviceitem(
        name: 'ombre',
        price: 100,
        id: 1,
        salonid: 2,
        description: '',
        category: 'Hair'
    ),
    serviceitem(
        name: 'Foil Highlights',
        price: 150,
        id: 2,
        salonid: 2,
        description: '',
        category: 'Hair'
    ),
    serviceitem(
        name: 'Protien',
        price: 400,
        id: 3,
        salonid: 2,
        description: '',
        category: 'Hair'
    ),
    //face
    serviceitem(
        name: 'Face waxing',
        price: 30,
        id: 0,
        salonid: 2,
        description: '',
        category: 'face'
    ),
    serviceitem(
        name: 'Face Threading',
        price: 25,
        id: 1,
        salonid: 2,
        description: '',
        category: 'face'
    ),
    serviceitem(
        name: 'Deep-pore Cleansing Facial',
        price: 80,
        id: 2,
        salonid: 2,
        description: '',
        category: 'face'
    ),
    serviceitem(
        name: 'Lip Threading',
        price: 5,
        id: 3,
        salonid: 2,
        description: '',
        category: 'face'
    ),
//wedding

    serviceitem(
        name: 'Makeup & Hair(Wedding)',
        price: 1800,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Parties'
    ),
    serviceitem(
        name: 'Makeup & Hair(Engajment)',
        price: 1200,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Parties'
    ),
    serviceitem(
        name: 'Makeup',
        price: 300,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Parties'
    ),
    serviceitem(
        name: 'Hair',
        price: 300,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Parties'
    ),
//skin
    serviceitem(
        name: 'Skin Tightening',
        price: 200,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Skin Care'
    ),
    serviceitem(
        name: 'Reduce Fine Line',
        price: 200,
        id:1,
        salonid: 2,
        description: '',
        category: 'Skin Care'
    ),
    serviceitem(
        name: 'Diamond Peeling',
        price: 80,
        id: 2,
        salonid: 2,
        description: '',
        category: 'Skin Care'
    ),
    serviceitem(
        name: 'Mesotherapy',
        price: 200,
        id: 3,
        salonid: 2,
        description: '',
        category: 'Skin Care'
    ),
    //nails
    serviceitem(
        name: 'Gel for hands',
        price: 70,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Nails'
    ),
    serviceitem(
        name: 'Gel for leg',
        price: 60,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Nails'
    ),
    serviceitem(
        name: ' Nail installation',
        price: 100,
        id: 0,
        salonid: 2,
        description: '',
        category: 'Nails'
    ),








  ];


}