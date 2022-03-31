import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'connect.dart';
main() async {
  var app = Angel();
  var http = AngelHttp(app);
  
  app.get('/', (req, res) => res.write('Hello, world!hhhhhhh'));
  app.get('/hi', (req, res) => res.write('Hello, world! How are you? My name is Mark.'));
  app.post('/greet', (req, res) async {
    await req.parseBody();
    var result = await defineSpecs();
    res.write(result);
    var name = req.bodyAsMap['name'] as String;
    if (name == null) {
      throw AngelHttpException.badRequest(message: 'Missing name.');
    } else {
      res.write('Helloss, $name!');
    }
  });

  await http.startServer('localhost', 9700);
}