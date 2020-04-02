
import 'package:http/http.dart' as http;


//Burada apimizin adresini tanımlıyoruz.
class TodoApi{

  static Future getTodos(){
    //* Api mizi çağırdık ve çalıştırmaya hazır hale getirdik.
    return http.get("https://jsonplaceholder.typicode.com/todos");
    
  }
}