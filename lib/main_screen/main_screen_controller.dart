
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  final List<AppUser> users = [
    AppUser(id: 'user_1', name: 'Aarav Sharma'),
    AppUser(id: 'user_2', name: 'Rohan Patel'),
    AppUser(id: 'user_3', name: 'Aditya Mehta'),
    AppUser(id: 'user_4', name: 'Rahul Verma'),
    AppUser(id: 'user_5', name: 'Arjun Desai'),
    AppUser(id: 'user_6', name: 'Neha Joshi'),
    AppUser(id: 'user_7', name: 'Priya Shah'),
    AppUser(id: 'user_8', name: 'Ananya Kulkarni'),
    AppUser(id: 'user_9', name: 'Sneha Patil'),
    AppUser(id: 'user_10', name: 'Kunal Gupta'),
  ];
}

class AppUser {
  final String id;
  final String name;

  const AppUser({
    required this.id,
    required this.name,
  });
}

