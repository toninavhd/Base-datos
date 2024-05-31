#############################################################################
##  Script Gestión de Servicios 2                      
##  Hecho por: Lili Guo Zeng - Antonio Navarro Hernandez  
##                                                                                                        
##  Función: Mostrar estado del servicio indicando su nombre y si está activo,
##  habilitado o enmascarado.                                                            
##                                                                                              
## Version: 1.0.0                                                                                      
#############################################################################

# Comprobación de argumentos
if [ $# -eq 0 ]
then
    echo "Por favor, introduce el nombre del servicio:"
    read servicio
else
    servicio=$1
fi


# Comprobación de si el servicio existe
systemctl --quiet is-active $servicio
if [ $? -ne 0 ]
then
    echo "Error: El servicio $servicio no existe."
    exit 10
fi


# Mostrar el estado del servicio
echo "Nombre del servicio: $servicio"
isActive=$(systemctl is-active $servicio)
isEnabled=$(systemctl is-enabled $servicio)
isMasked=$(systemctl is-enabled $servicio)
echo "Activo: $isActive"
echo "Habilitado: $isEnabled"
echo "Enmascarado: $isMasked"


# Mostrar el menú de opciones
PS3='Por favor, selecciona una opción: '
options=("Activar/Desactivar servicio" "Habilitar/Deshabilitar servicio"
 "Enmascarar/Desenmascarar servicio"
 "Mostrar configuración del servicio"
 "Reiniciar servicio (activo)"
 "Reiniciar servicio (último estado)"
 "Aplicar cambios (activo)"
 "Aplicar cambios (último estado)"
"Asignar configuración del desarrollador"
 "Mostrar tiempo de carga del sistema"
 "Mostrar tiempo de carga del servicio"
 "Mostrar nivel de ejecución"
 "Apagar el equipo" "Reiniciar el equipo" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Activar/Desactivar servicio")
            if [ $isActive = "active" ]
            then
                sudo systemctl stop $servicio
            else
                sudo systemctl start $servicio
            fi
            ;;
        "Habilitar/Deshabilitar servicio")
            if [ $isEnabled = "enabled" ]
            then
                sudo systemctl disable $servicio
            else
                sudo systemctl enable $servicio
            fi
            ;;
        "Enmascarar/Desenmascarar servicio")
            if [ $isMasked = "masked" ]
            then
                sudo systemctl unmask $servicio
            else
                sudo systemctl mask $servicio
            fi
            ;;
        "Mostrar configuración del servicio")
            systemctl show $servicio
            ;;
        "Reiniciar servicio (activo)")
            sudo systemctl restart $servicio
            ;;
        "Reiniciar servicio (último estado)")
            sudo systemctl try-restart $servicio
            ;;
        "Aplicar cambios (activo)")
            sudo systemctl reload-or-restart $servicio
            ;;
        "Aplicar cambios (último estado)")
            sudo systemctl reload-or-try-restart $servicio
            ;;
        "Asignar configuración del desarrollador")
            sudo systemctl revert $servicio
            ;;
        "Mostrar tiempo de carga del sistema")
            systemd-analyze
            ;;
        "Mostrar tiempo de carga del servicio")
            systemd-analyze blame | grep $servicio
            ;;
        "Mostrar nivel de ejecución")
            runlevel
            ;;
        "Apagar el equipo")
            sudo systemctl poweroff
            ;;
        "Reiniciar el equipo")
            sudo systemctl reboot
            ;;
        "Salir")
            break
            ;;
        *) echo "Opción inválida $REPLY";;
    esac
done