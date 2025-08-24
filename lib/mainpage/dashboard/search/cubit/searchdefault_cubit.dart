import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'searchdefault_state.dart';

class SearchdefaultCubit extends Cubit<SearchdefaultState> {
  SearchdefaultCubit() : super(SearchdefaultInitial());
  bool securtytextformchange = true;

  final List<String> images = [
    "https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg",
    "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg",
    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
    "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg",
    "https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg",
    "https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg",
    "https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg",
    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
  ];
  List<String> names = [
    "Aarav",
    "Vivaan",
    "Aditya",
    "Sai",
    "Krishna",
    "Ananya",
    "Ishita",
    "Diya",
    "Riya",
    "Shamil",
    "Rahul",
    "Priya",
    "Arjun",
    "Sneha",
    "Kiran",
    "Neha",
    "Sanjay",
    "Manisha",
    "Amit",
    "Lakshmi",
  ];
  List<String> filteredNames = [];

  // 🔍 Search in names only
  void search(String query) {
    if (query.isEmpty) {
      filteredNames = [];
    } else {
      filteredNames = names
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(Searchdefaultloaded());
  }
}



