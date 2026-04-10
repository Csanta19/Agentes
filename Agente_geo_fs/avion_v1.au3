;~ ;Agente para volar aviones en GeoFS
Global $T_aceleracion, $T_AleronUp, $T_estabilizar, $T_AleronDown, $T_vuelo
Global $T_AleronUp_aterrizaje, $T_AleronDown_aterrizaje, $T_frenado, $T_motorOff

Run("C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe")
Sleep(2000)
Send("https://www.geo-fs.com/geofs.php?aircraft=1" & @CRLF)
Sleep(1000)


;checar winwait
if WinActivate("GeoFS - Fly in Your Web Browser - Brave", "") Then

	ConsoleWrite("ventana detectada" & @CRLF)

	ToolTip("Agente corriendo, presiona la tecla F1, F2 o F3 para empezar a volar | ESC para detener ",@DesktopWidth/2,@DesktopHeight/2)

	HotKeySet("{F1}", "Avion1")
	HotKeySet("{F2}", "Avion2")
	HotKeySet("{F3}", "Avion3")

EndIf


While 1
	Sleep(100)
	HotKeySet("{ESC}", "DetenerAgente")
WEnd

Func Avion1()
	;Configuracion para avion_1
	Send("{F6}")
	Sleep(5000)
	Send("https://www.geo-fs.com/geofs.php?aircraft=1" & @CRLF)
	Sleep(1000)
	ToolTip("Iniciando configuracion para el Avion 1",@DesktopWidth/2, @DesktopHeight/2)
	$T_aceleracion = IniRead(".\config.ini", "Avion_1", "T_aceleracion", Default)
	$T_AleronUp = IniRead(".\config.ini", "Avion_1", "T_AleronUp", Default)
	$T_estabilizar = IniRead(".\config.ini", "Avion_1", "T_estabilizar", Default)
	$T_AleronDown = IniRead(".\config.ini", "Avion_1", "T_AleronDown", Default)
	$T_vuelo = IniRead(".\config.ini", "Avion_1", "T_vuelo", Default)
	$T_AleronUp_aterrizaje = IniRead(".\config.ini", "Avion_1", "T_AleronUp_aterrizaje", Default)
	$T_AleronDown_aterrizaje = IniRead(".\config.ini", "Avion_1", "T_AleronDown_aterrizaje", Default)
	$T_frenado = IniRead(".\config.ini", "Avion_1", "T_frenado", Default)
	$T_motorOff = IniRead(".\config.ini", "Avion_1", "T_motorOff", Default)
	Sleep(1000)
	volarAvion()
EndFunc


Func Avion2()
	;Configuracion para avion_2
	Send("{F6}")
	Sleep(5000)
	Send("https://www.geo-fs.com/geofs.php?aircraft=2" & @CRLF)
	Sleep(1000)
	ToolTip("Iniciando configuracion para el Avion 2", @DesktopWidth/2,@DesktopHeight/2)
	$T_aceleracion = IniRead(".\config.ini", "Avion_2", "T_aceleracion", Default)
	$T_AleronUp = IniRead(".\config.ini", "Avion_2", "T_AleronUp", Default)
	$T_estabilizar = IniRead(".\config.ini", "Avion_2", "T_estabilizar", Default)
	$T_AleronDown = IniRead(".\config.ini", "Avion_2", "T_AleronDown", Default)
	$T_vuelo = IniRead(".\config.ini", "Avion_2", "T_vuelo", Default)
	$T_AleronUp_aterrizaje = IniRead(".\config.ini", "Avion_2", "T_AleronUp_aterrizaje", Default)
	$T_AleronDown_aterrizaje = IniRead(".\config.ini", "Avion_2", "T_AleronDown_aterrizaje", Default)
	$T_frenado = IniRead(".\config.ini", "Avion_2", "T_frenado", Default)
	$T_motorOff = IniRead(".\config.ini", "Avion_2", "T_motorOff", Default)
	Sleep(1000)
	volarAvion()
EndFunc


Func Avion3()
	;Configuracion para avion_3
	Send("{F6}")
	Sleep(5000)
	Send("https://www.geo-fs.com/geofs.php?aircraft=10" & @CRLF)
	Sleep(1000)
	ToolTip("Iniciando configuracion para el Avion 3",@DesktopWidth/2,@DesktopHeight/2)
	$T_aceleracion = IniRead(".\config.ini", "Avion_3", "T_aceleracion", Default)
	$T_AleronUp = IniRead(".\config.ini", "Avion_3", "T_AleronUp", Default)
	$T_estabilizar = IniRead(".\config.ini", "Avion_3", "T_estabilizar", Default)
	$T_AleronDown = IniRead(".\config.ini", "Avion_3", "T_AleronDown", Default)
	$T_vuelo = IniRead(".\config.ini", "Avion_3", "T_vuelo", Default)
	$T_AleronUp_aterrizaje = IniRead(".\config.ini", "Avion_3", "T_AleronUp_aterrizaje", Default)
	$T_AleronDown_aterrizaje = IniRead(".\config.ini", "Avion_3", "T_AleronDown_aterrizaje", Default)
	$T_frenado = IniRead(".\config.ini", "Avion_3", "T_frenado", Default)
	$T_motorOff = IniRead(".\config.ini", "Avion_3", "T_motorOff", Default)
	Sleep(1000)
	volarAvion()
EndFunc

Func volarAvion ()

	Sleep(2000) ; Espera inicial
	ToolTip("Iniciando despegue","")
	;Send("{E}")
	Sleep(2000) ; Espera
	Send("{SPACE}")
	Send("{NUMPADADD down}")

	Sleep($T_aceleracion) ; Tiempo de aceleración desde el INI
	Send("{Down down}")

	Sleep($T_AleronUp) ; Alerón para arriba desde el INI
	Send("{Down up}")

	Sleep($T_estabilizar) ; Tiempo para estabilizar desde el INI
	Send("{Up down}")

	Sleep($T_AleronDown) ; Alerón hacia abajo desde el INI
	Send("{Up up}")

	Sleep($T_vuelo) ; Tiempo de vuelo principal desde el INI
	ToolTip("Iniciando aterrizaje","")
	Send("{Up down}")

	Sleep($T_AleronUp_aterrizaje) ; Alerón hacia arriba aterrizaje
	Send("{Up up}")

	Sleep($T_AleronDown_aterrizaje) ; Alerón hacia abajo aterrizaje
	Send("{SPACE down}")
	Send("{NUMPADSUB down}")
	Send("{Up}")

	Sleep($T_frenado) ; Tiempo de frenado
	Send("{Down}")

	Sleep($T_motorOff) ; Tiempo para apagar el motor y dejar de frenar
	Send("{NUMPADSUB up}")
	Send("{E}")
	ConsoleWrite("Vuelo Finalizado" & @CRLF)

EndFunc

Func DetenerAgente()
	ToolTip("Deteniendo el agente...", @DesktopWidth/2, @DesktopHeight/2)
	Sleep(1000)
	Exit
EndFunc




