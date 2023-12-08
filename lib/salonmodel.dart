import 'dart:core';
import 'dart:core';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:soft/serviceitem.dart';
class salonmodel extends Equatable {
  final int id;
  final String Name;
  final String ImageUrl;
  final List<String> tags;
  final List<serviceitem> Serviceitem;
  final String delivaryTime;
  final String delivaryfee;
  final String destance;

  const salonmodel({
    required this.id,
    required this.Name,
    required this.ImageUrl,
    required this.tags,
    required this.delivaryTime,
    required this.delivaryfee,
    required this.Serviceitem,
    required this.destance});


  @override
  List<Object> get props {
    return [
      id, Name, ImageUrl, delivaryfee, delivaryTime, destance

    ];
  }

  static List<salonmodel> salons = [
    salonmodel(
      id: 1,
      Name: 'Hanan Salon',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 1).toList(),

    ),
    salonmodel(
      id: 2,
      Name: 'Walaa Florita Salon',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair','face','Parties','Skin Care','Nails'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 2).toList(),
    ),
    salonmodel(
      id: 3,
      Name: 'La Bella Beauty Center',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 3).toList(),
    ),
    salonmodel(
      id: 4,
      Name: 'Capillo Beauty Center',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 4).toList(),
    ),
    salonmodel(
      id: 5,
      Name: 'Asmaa Beauty Center',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 5).toList(),
    ),
    salonmodel(
      id: 6,
      Name: 'Lamour Beauty Center',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 6).toList(),
    ),

    salonmodel(
      id: 7,
      Name: 'Niveen Salon',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 7).toList(),
    ),
    salonmodel(
      id: 8,
      Name: 'Wajh Alqamar Salon',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 8).toList(),
    ),
    salonmodel(
      id: 9,
      Name: 'Sineen Saloon',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 9).toList(),
    ),
    salonmodel(
      id: 10,
      Name: 'Ghazal Beauty Salon',
      ImageUrl: '',
      delivaryTime: '',
      delivaryfee: '',
      destance: '',
      tags: ['Hair', 'face', 'Wedding', 'Engajmet', 'laser'],
      Serviceitem: serviceitem.Serviceitem.
      where((Serviceitem) => Serviceitem.salonid == 10).toList(),
    ),
  ];

}









