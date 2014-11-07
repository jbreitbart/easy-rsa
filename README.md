1.
Repository auschecken, nach easy-rsa/common wechseln.
!!! Wichtig: Die Scripte funktionieren nur richtig, wenn man sie aus dem Verzeichnis easy-rsa/common heraus aufruft.

2.
Datei config editieren. Darauf achten, dass sie nur vom Eigentümer lesbar ist, das Passwort für der privaten CA-Key ist darin enthalten.

3.
Datei vpn-config editieren, wenn .ovpn Dateien erzeugt werden sollen

4.
./init-cadir aufrufen

5.
Mit ./build-ca Schlüssel und Zertifikat fuer die CA generieren. 
* <NEWDIR>/cacert.pem enthält das selbssignierte Wurzelzertifikat für die CA. Teilnehmende Dienste und Geräte müssen dieses Zertifikat importieren oder anderweitig referenzieren.
* <NEWDIR>/private/cakey.pem enthält den privaten Schlüssel der CA. Damit werden die Teilnehmerzertifikate signiert.

6. (optional)
Mit ./build-dh Diffie Hellman Parameter erzeugen

7. (optional)
Mit ./build-openvpn-ta ein shared secret für OpenVPN TLS-auth erzeugen

8.
Mit ./build-key <cn> die Zertifikate für Rechner und Dienste generieren. <cn> muss genau so lauten, wie der Dienst später angesprochen wird.
Key, Certificate Requests, Zertifikate und OpenVPN Konfigurationen  werden im Verzeichnis <NEWDIR>/certs abgelegt.
Im Verzeichnis <NEWDIR>/certs finden sich Auch Dateien namens "*.pem". Das sind Kopien der Zertifikate. Die Zuordnung lässt sich in <NEWDIR>/index.txt ermitteln.
!!! Achtung: Die Keys sind nicht passwortgeschützt
!!! Achtung: Die Dateien -key.ovpn beinhalten die Keys auch ohne Passwortschutz
!!! Zum Verschicken der Keys über öffentliche Netze die Passwort geschützen .p12 Dateien nehmen.