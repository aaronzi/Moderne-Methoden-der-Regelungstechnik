# Buck Converter

Photovoltaikanlagen enthalten viele Tausend einzelne Photovoltaikzellen. Jede Einzelne
wandelt einfallende Sonnenstrahlung (direkt und indirekt) in elektrischen Strom um. Unter
Vernachlässigung von Verlusten in Kabeln, Wandlerverlusten und Leistungsfehlanpassungen
ist die erzeugte Leistung von PV-Systemen, die Anzahl aller enthaltenen Zellen multipliziert
mit der Leistung einer einzelnen Zelle. Über diese Annahme ist es möglich, das mathematische
Modell der gesamten PV-Anlage für die Systemanalyse abzuleiten.
Die Grundeinheiten einer PV-Anlage sind die PV-Module oder auch Solarzellen.
Ein Standard-PV-Modul besteht aus 48 bis 73 in Reihe geschalteten Zellen, die in einen Rahmen montiert
sind. PV-Anlagen werden in der Regel durch Reihen- und Parallelschaltungen von Modulen
zusammengesetzt. Solarmodule werden in Reihe geschaltet (sog. „Strings“), um die
Ausgangsspannung zu erhöhen. Parallel geschaltete Strings bilden ein „Array“, in dem die
Leistungskapazität von Tausenden bis Millionen Watt aufgebaut werden kann.
Das mathematische Modell des PV-Generators ergibt sich aus der Zusammenfassung aller
PV-Module, die durch das Modell einer einzelnen Zelle beschrieben werden. Strom und
Spannung werden in geeigneter Weise multipliziert. Dazu wird die Einzelzelle durch ein
Ersatzschaltbild modelliert, das aus einer einstrahlungsabhängigen Stromquelle, einem Modell
der Diode D und Shunt-Widerstand Rh besteht. Die
Einstrahlung S mit der physikalischen Einheit W/
m2 bezieht sich auf die direkte (normal zum
PV-Zellenfeld) und die indirekte Einstrahlung.

Um die Spannung von PV-Anlagen zu regeln, werden Gleichspannungswandler eingesetzt.
Die Ausgangsspannung des Wandlers kann eingestellt werden und unterscheidet sich von der
Eingangsspannung. Eine grundlegende Gleichspannungswandlerschaltung ist der so genannte
Buck Converter (Tiefsetzsteller).
Die Pulsweitenmodulation (PWM) ermöglicht die Steuerung und Regelung der gesamten
Ausgangsspannung. Die PWM stellt ein Rechtecksignal bereit, welches zwischen 0 und
1 schaltet. Typische Schaltfrequenzen liegen zwischen fSW = 1 kHz ... 1 MHz. Im Falle
der konkreten Anlage beträgt die Schaltfrequenz fSW = 5 kHz. In der Praxis werden z. B.
MOSFET’s als Schalter eingesetzt. Die Ausgangsspannung hinter dem MOSFET wechselt somit zwischen Null und der Ausgangsspannung
des Wandlers vDC. Das Tastverhältnis (Duty Cycle) d beschreibt die Zeitverhältnisse des
Rechtecksignals, also wann der Schalter (MOSFET) in Position 0 bzw. 1 ist.

Ziel der Regelung soll es sein, die Ausgangsspannung vDC konstant bei 900 V zu halten. Die
einzelnen PV-Zellen wurden im Vorhinein für verschiedene Bestrahlungen und Temperaturen
messtechnisch analysiert. Die Modellierung erfolgt für eine konstante
Bestrahlung mit S = 1000 W/m2 bei einer konstanten Zelltemperatur von Tc = 298K.

## Modellparameter

![image](https://user-images.githubusercontent.com/17433117/180844680-37ce1390-bbfc-4282-be90-088328779763.png)

## Simulationsergebnisse lineares Zustandsraummodell

![image](https://user-images.githubusercontent.com/17433117/180844891-9f9c9413-9eb5-410a-8116-75c5b1fd8011.png)

## Simulationsergebnisse nicht-lineares Zustandsraummodell

![image](https://user-images.githubusercontent.com/17433117/180845005-f15a5f11-ef78-49fe-86cd-197d1136cc08.png)

