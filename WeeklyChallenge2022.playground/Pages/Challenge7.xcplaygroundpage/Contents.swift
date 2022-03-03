import Foundation

/*
 * Reto #7
 * CONTANDO PALABRAS
 * Fecha publicación enunciado: 14/02/22
 * Fecha publicación resolución: 21/02/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que cuente cuantas veces se repite cada palabra y que muestre el recuento final de todas ellas.
 * - Los signos de puntuación no forman parte de la palabra.
 * - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func countWords(text: String) {

    let mutableString = NSMutableString(string: text.lowercased())
    
    let regex = try! NSRegularExpression(pattern: "[^a-z0-9]", options: [])
    regex.replaceMatches(in: mutableString, options: [], range: NSMakeRange(0, mutableString.length), withTemplate: " ")
    
    var words: [String:Int] = [:]
    
    String(mutableString).split(separator: " ").forEach { word in
        let key = String(word)
        if words[key] != nil {
            words[key]! += 1
        } else {
            words[key] = 1
        }
    }
    
    words.forEach { key, value in
        print("\(key) se ha repetido \(value) \(value == 1 ? "vez" : "veces")")
    }
}

countWords(text: "Hola, mi nombre es brais. Mi nombre completo es Brais Moure (MoureDev).")
// PHP
//
// Como siempre, la prueba se puede ver en:
// https://poio.com.ar/retos_moure/6/
// donde se puede poner cualquier frase para correr el programa

<?php
function contarPalabras($string){
  $resultado = ''; // Iniciar la variable
  $signos = array('.', ',', ':', '!', '?', '+', '-'); // Array de signos a eliminar del string
  $string = strtolower($string); // Pasamos todo a minuscula
  $string = str_replace($signos, '', $string); // Limpiamos de signos la frase

  // Manos a la obra
  // Contar
  $separar = explode(' ', $string); // Crea un array con todas las palabras
  foreach($separar as $palabra){
    ${$palabra} = ${$palabra} + 1; // Crea una variable con cada palabra, si no existe va a ser uno y si ya existia va a sumar 
  }

  //Devolver resultado
  $string_sin_duplicados = array_unique($separar); // Eliminiar palabras duplicadas del array que ya se limpio
  foreach($string_sin_duplicados as $sin_dupli){
    $resultado.= '<pre>'.$sin_dupli.': '.${$sin_dupli}.'</pre>'; // Por cada palabra, imprime su resultado
  }

  return $resultado;
}

echo contarPalabras('Hola Mundo! ortra vez, en un reto de Moure. Los desafio y los reto a que se suscriban al canal de Moure!');
?>
