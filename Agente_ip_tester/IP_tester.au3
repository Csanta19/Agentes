;Checador de IP's
Run("cmd")
Sleep(5000)
Send("c:" & @CRLF & "ipconfig" & @CRLF)
Sleep(1000)

For $cont = 0 To 255
	Send("ping 173.16.16.")
	Sleep(500)
	Send($cont & @CRLF)
	Sleep(500)
Next


$ip = "173.16.16."
$tiempo = 250

For $cont2 = 155 To 255
	$IP_test = $ip & $cont2
	$IP_res = Ping($IP_test , $tiempo)

	If $IP_res Then
		ConsoleWrite($IP_test & "-respuesta" & @CRLF)
	Else
		ConsoleWrite($IP_test & "-sin respuesta" & @CRLF)
	EndIf
Next