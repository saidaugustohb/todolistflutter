import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create('mongodb://localhost:27017/todolist');
  await db.open();
  final coll = db.collection('tasks');
  print(await coll.find().toList());
  const port = 8081;
  final serv = Sevr();

  serv.get('/', [
    (ServRequest req, ServResponse res) async {
      final tasks = await coll.find().toList();
      return res.status(200).json({'tasks': tasks});
    }
  ]);

  serv.post('/', [
    (ServRequest req, ServResponse res) async {
      await coll.save(req.body);
      return res.json(await coll.findOne(where.eq('name', req.body['name'])));
    }
  ]);

  serv.delete('/:id', [
    (ServRequest req, ServResponse res) async {
      await coll
          .remove(where.eq('_id', ObjectId.fromHexString(req.params['id'])));
      return res.status(200);
    }
  ]);

  serv.listen(port, callback: () {
    print("Servicio corriendo en el puerto $port ");
  });
}
