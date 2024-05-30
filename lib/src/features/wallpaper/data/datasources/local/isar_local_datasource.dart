import 'package:isar/isar.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/local/local_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/models/photo_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/entities/photo.dart';

class IsarLocalDatasource implements LocalDatasource {
  late Future<Isar> db;
  IsarLocalDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [PhotoModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> toogleFavorite(PhotoModel photo) async {
    final Isar isar = await db;
    final favoriteMedia =
        await isar.photoModels.filter().idEqualTo(photo.id).findFirst();
    if (favoriteMedia != null) {
      // * Borrar de Database
      isar.writeTxnSync(() => isar.photoModels.deleteSync(favoriteMedia.id));
      return;
    }
    // * Escribir en Database
    isar.writeTxnSync(() => isar.photoModels.putSync(photo));
  }

  @override
  Future<bool> isFavorite(int photoId) async {
    final Isar isar = await db;
    final PhotoModel? isFavoriteMedia =
        await isar.photoModels.filter().idEqualTo(photoId).findFirst();

    return isFavoriteMedia != null;
  }

  @override
  Future<List<Photo>> loadFavorites() async {
    final Isar isar = await db;
    // * Buscar en Database
    return isar.photoModels.where().findAll();
  }
}
