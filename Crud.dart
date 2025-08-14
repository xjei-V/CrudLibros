import 'dart:io';

void main() {
  List<String> libros = [];
  int opcion = 0;

  while (opcion != 5) {
    print('\n===== MENÚ =====');
    print('1. Agregar libro');
    print('2. Listar libros');
    print('3. Actualizar libro');
    print('4. Eliminar libro');
    print('5. Salir');
    stdout.write('Elige una opción: ');
    opcion = int.parse(stdin.readLineSync()!);
    switch (opcion) {
      case 1:
        // AGREGAR
        print('--- Agregar libro ---');
        stdout.write('Título: ');
        String? titulo = stdin.readLineSync();

        stdout.write('Autor: ');
        String? autor = stdin.readLineSync();

        stdout.write('Año: ');
        String? anio = stdin.readLineSync();

        if (titulo != null && autor != null && anio != null) {
          String libro = '$titulo - $autor ($anio)';
          libros.add(libro);
          print('Libro agregado.');
        } else {
          print('Datos inválidos.');
        }
        break;

      case 2:
        // LISTAR
        print('--- Lista de libros ---');
        if (libros.isEmpty) {
          print('No hay libros.');
        } else {
          for (int i = 0; i < libros.length; i++) {
            print('$i) ${libros[i]}');
          }
        }
        break;

      case 3:
        // ACTUALIZAR
        print('--- Actualizar libro ---');
        if (libros.isEmpty) {
          print('No hay libros.');
          break;
        }

        for (int i = 0; i < libros.length; i++) {
          print('$i) ${libros[i]}');
        }

        stdout.write('Índice del libro a actualizar: ');
        int? idx = int.tryParse(stdin.readLineSync() ?? '');

        if (idx == null || idx < 0 || idx >= libros.length) {
          print('Índice inválido.');
          break;
        }

        stdout.write('Nuevo título: ');
        String? nuevoTitulo = stdin.readLineSync();

        stdout.write('Nuevo autor: ');
        String? nuevoAutor = stdin.readLineSync();

        stdout.write('Nuevo año: ');
        String? nuevoAnio = stdin.readLineSync();

        if (nuevoTitulo != null && nuevoAutor != null && nuevoAnio != null) {
          libros[idx] = '$nuevoTitulo - $nuevoAutor ($nuevoAnio)';
          print('Libro actualizado.');
        } else {
          print('Datos inválidos.');
        }
        break;

      case 4:
        // ELIMINAR
        print('\n--- Eliminar libro ---');
        if (libros.isEmpty) {
          print('No hay libros.');
          break;
        }

        for (int i = 0; i < libros.length; i++) {
          print('$i) ${libros[i]}');
        }

        stdout.write('Índice a eliminar: ');
        int? idxEliminar = int.tryParse(stdin.readLineSync() ?? '');

        if (idxEliminar == null || idxEliminar < 0 || idxEliminar >= libros.length) {
          print('Índice inválido.');
        } else {
          libros.removeAt(idxEliminar);
          print('Libro eliminado.');
        }
        break;

      case 5:
        print('Chao');
        break;

      default:
        print('Opción inválida.');
    }
  }
}
