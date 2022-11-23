import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  Future<Database> openConnection() async {
    //Future<void> openConnection() async {
    final databasePath = await getDatabasesPath();
    // print('Path: $databasePath');
    final databaseFinalPath = join(databasePath, 'SQL_TRADMASTER');
    //print('Path: $databaseFinalPath');
    return await openDatabase(
      databaseFinalPath,
      version: 1,
      onConfigure: (db) async {
        print('onConfigure Chamado');
        await db.execute('PRAGMA foreing_keys = ON');
      },
      //chamado somente no momento da criacao do banco
      //primeira vez em que instala o app
      onCreate: (Database db, int version) {
        // print('onCreate Chamado');
        final batch = db.batch();
        batch.execute('''
        create table posts(
          id Integer primary key autoincrement,
          selfText varchar,
          authorFullName varchar,
          created Integer,
          ups Integer,
          downs Integer,
          favorito varchar,
          id_api varchar
        )
      ''');
        batch.commit();
      },
      //sera chamado sempre que existir uma nova atualizaçao pra cima (1 -> 2)
      onUpgrade: (Database db, int oldVersion, int version) {
        // print('onCreate Chamado');
        final batch = db.batch();

        batch.commit();
      },

      //sera chamado sempre que existir uma alteraçao para baixo no banco (2 -> 1)
      onDowngrade: (Database db, int oldVersion, int version) {
        //  print('onCreate Chamado');
        final batch = db.batch();

        batch.commit();
      },
    );
  }
}