import re

def modificar_etiquetas(texto):
    # Patrón para identificar el texto dentro de las etiquetas
    patron = r'<\?=\s*__\("([^"]+)"\)\s*\?>'
    
    # Función para verificar si el texto ya está presente y no modificarlo
    def reemplazo(match):
        texto_original = match.group(1)
        # Aquí puedes agregar la lógica para verificar si el texto ya está presente
        # y retornar el texto original sin modificar
        return '<?= __("{}") ?>'.format(texto_original)
    
    # Reemplazar el texto en el documento utilizando la función de reemplazo
    texto_modificado = re.sub(patron, reemplazo, texto)
    return texto_modificado

# Ejemplo de uso de la función
texto_original = 'Aquí tienes un ejemplo <?= __("prueba") ?> para verificar.'
texto_modificado = modificar_etiquetas(texto_original)
print(texto_modificado)
