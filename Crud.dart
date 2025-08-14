import 'dart:io';

void main() {
  List Listarlibros = [];

  do {
    print('Seleccione una opción:\n'
        '1. Agregar libro \n'
        '2. Listar libros\n'
        '3. Actualizar libro\n'
        '4. Eliminar libro\n'
        '5. Salir\n');

    String? entradaMenu = stdin.readLineSync();
    int? opcion = int.tryParse(entradaMenu ?? '');

    if (opcion == null) {
      print('Opción inválida. Intenta de nuevo.\n');
      continue;
    }

    switch (opcion) {
      case 1:
        // AGREGAR: repetir hasta que el campo no esté vacío
        print('--- Agregar libro ---');

        String nombre;
        do {
          stdout.write('Ingrese el nombre del libro: ');
          nombre = (stdin.readLineSync() ?? '').trim();
          if (nombre.isEmpty) print('El nombre no puede estar vacío.');
        } while (nombre.isEmpty);

        String autor;
        do {
          stdout.write('Ingrese el autor del libro: ');
          autor = (stdin.readLineSync() ?? '').trim();
          if (autor.isEmpty) print('El autor no puede estar vacío.');
        } while (autor.isEmpty);

        int? anio;
        do {
          stdout.write('Ingrese el año de publicación del libro: ');
          String entradaAnio = stdin.readLineSync() ?? '';
          anio = int.tryParse(entradaAnio.trim());
          if (anio == null) print('Año inválido. Debe ser un número.');
        } while (anio == null);

        Listarlibros.add({
          'nombre': nombre,
          'autor': autor,
          'anio': anio,
        });
        print('Libro agregado correctamente.\n');
        break;

      case 2:
        print('\n--- Lista de Libros ---');
        if (Listarlibros.isEmpty) {
          print('No hay libros registrados.\n');
        } else {
          for (int i = 0; i < Listarlibros.length; i++) {
            var libro = Listarlibros[i];
            print('$i: ${libro['nombre']} - ${libro['autor']} (${libro['anio']})');
          }
          print('');
        }
        break;

      case 3:
        print('\n--- Actualizar Libro ---');
        if (Listarlibros.isEmpty) {
          print('No hay libros para actualizar.\n');
          break;
        }

        for (int i = 0; i < Listarlibros.length; i++) {
          var libro = Listarlibros[i];
          print('$i: ${libro['nombre']} - ${libro['autor']} (${libro['anio']})');
        }

        stdout.write('Ingrese el índice del libro a actualizar: ');
        int? indice = int.tryParse(stdin.readLineSync() ?? '');
        if (indice == null || indice < 0 || indice >= Listarlibros.length) {
          print('Índice inválido.\n');
          break;
        }

        var actual = Listarlibros[indice];

        // Nuevo título (obligatorio)
        String nuevoTitulo;
        do {
          stdout.write('Nuevo título: ');
          nuevoTitulo = (stdin.readLineSync() ?? '').trim();
          if (nuevoTitulo.isEmpty) print('El título no puede estar vacío.');
        } while (nuevoTitulo.isEmpty);

        // Nuevo autor (obligatorio)
        String nuevoAutor;
        do {
          stdout.write('Nuevo autor: ');
          nuevoAutor = (stdin.readLineSync() ?? '').trim();
          if (nuevoAutor.isEmpty) print('El autor no puede estar vacío.');
        } while (nuevoAutor.isEmpty);

        // Nuevo año (obligatorio y numérico)
        int? nuevoAnio;
        do {
          stdout.write('Nuevo año: ');
          String entradaAno = stdin.readLineSync() ?? '';
          nuevoAnio = int.tryParse(entradaAno.trim());
          if (nuevoAnio == null) print('Año inválido.');
        } while (nuevoAnio == null);

        Listarlibros[indice] = {
          'nombre': nuevoTitulo,
          'autor': nuevoAutor,
          'anio': nuevoAnio,
        };
        print('Libro actualizado con éxito.\n');
        break;

      case 4:
        print('\n--- Eliminar Libro ---');
        if (Listarlibros.isEmpty) {
          print('No hay libros para eliminar.\n');
          break;
        }

        for (int i = 0; i < Listarlibros.length; i++) {
          var libro = Listarlibros[i];
          print('$i: ${libro['nombre']} - ${libro['autor']} (${libro['anio']})');
        }

        stdout.write('Ingrese el índice del libro a eliminar: ');
        int? indiceEliminar = int.tryParse(stdin.readLineSync() ?? '');
        if (indiceEliminar != null &&
            indiceEliminar >= 0 &&
            indiceEliminar < Listarlibros.length) {
          var eliminado = Listarlibros.removeAt(indiceEliminar);
          print('Libro "${eliminado['nombre']}" eliminado con éxito.\n');
        } else {
          print('Índice inválido.\n');
        }
        break;

      case 5:
        print('¡Hasta pronto!\n');
        return;

      default:
        print('Opción inválida. Elija un número entre 1 y 5.\n');
    }
  } while (true);
}
