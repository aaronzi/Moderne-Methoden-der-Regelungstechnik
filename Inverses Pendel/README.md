# Inverses Pendel

Ziel des Beleges ist die Modellierung und Regelung eines Inversen Pendels, welches auf
einem durch einen Motor bewegten Schlitten befestigt ist. Über die Regelung soll es möglich
sein das Pendel in der instabilen Ruhelage aufrecht stehen zu lassen. Dies soll ausschließlich
über die Bewegung des Schlittens realisiert werden.

Es gelten folgende Voraussetzungen für das System:
- Das Pendel ist frei gelagert.
- Der Motor (Synchronmaschine) ist momentengeregelt (Mmax = 80N).
- Die Position (xM) und Geschwindigkeit (x˙M) des Schlittens werden erfasst.
- Der Winkel (φ), aber nicht die Winkelgeschwindigkeit (φ˙), des Pendels werden gemessen.

Es werden folgende Einschränkungen festgelegt:
- Der Schlitten darf den Arbeitsbereich nicht verlassen (±1m).
- Es soll ein Zustandsregler mit vier Zuständen (x1 bis x4) verwendet werden.
- Für die Ermittlung der Winkelgeschwindigkeit ist die Rekonstruktion über einen Beobachter notwendig.

## Modellparameter

![image](https://user-images.githubusercontent.com/17433117/180845399-56714642-72df-46c2-bbdc-6c62f8b5c04e.png)

## Simulationsergebnisse lineares Zustandsraummodell

![image](https://user-images.githubusercontent.com/17433117/180845658-7dc7f6b0-994c-4392-842f-383b3eba00ce.png)
![image](https://user-images.githubusercontent.com/17433117/180845687-69abbf6b-7fcc-431e-b524-cd3f2ef6bc78.png)
![image](https://user-images.githubusercontent.com/17433117/180845720-4d4706f7-1449-47e2-b6c2-81324a92519a.png)

## Simulationsergebnisse nicht-lineares Zustandsraummodell
![image](https://user-images.githubusercontent.com/17433117/180845786-26483203-9d36-42ae-a99e-3da809e2518c.png)
![image](https://user-images.githubusercontent.com/17433117/180845812-89245d58-bd6d-440d-ac2c-626c2b7d738b.png)
![image](https://user-images.githubusercontent.com/17433117/180845835-64925e37-2ae2-464a-a5a6-6f7e9c094a1b.png)
